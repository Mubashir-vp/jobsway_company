import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/api_services/api.dart';
import 'package:jobswaycompany/api_services/api_get_services.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/dash_controller.dart';
import 'package:jobswaycompany/controller/landing_page_controller.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/model/getModel/get_companyDetails.dart';
import 'package:jobswaycompany/model/postModel/companyLogin_model.dart';
import 'package:jobswaycompany/model/postModel/hrlogin_model.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:jobswaycompany/view/register_company.dart';
import 'dart:developer';

var hrDetails;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ApiServices apiServices = ApiServices();

  GetServices getServices = GetServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                  vertical: 80.h,
                ),
                child: Form(
                  key: LoginPage.formkey,
                  child: Column(
                    children: [
                      Center(
                        child: Wrap(
                          children: [
                            Text(
                              "Log In to ",
                              style: textStyle(
                                textBlack,
                                30.sp,
                                FontWeight.w800,
                              ),
                            ),
                            Text(
                              controller.company == true ? "Company" : "HR",
                              style: textStyle(
                                primaryGreen,
                                30.sp,
                                FontWeight.w800,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      controller.selectionButton(),
                      SizedBox(
                        height: 43.h,
                      ),
                      formField(
                        "Email",
                        false,
                        TextInputType.emailAddress,
                        controller: controller.emailController,
                        validator: (value) => EmailValidator.validate(value)
                            ? null
                            : "Please enter a valid email",
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      formField(
                        "Password",
                        controller.eyesOpen,
                        TextInputType.number,
                        controller: controller.passwordController,
                        suffix: controller.eye(),
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      InkWell(
                        onTap: () async {
                          Login? response;
                          if (LoginPage.formkey.currentState!.validate()) {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (isCompany == true) {
                              String pathUrl =
                                  "https://jobsway-company.herokuapp.com/api/v1/company/login";
                              var data = {
                                'email': controller.emailController.text,
                                'password': controller.passwordController.text,
                              };

                              var dataaaa = await apiServices
                                  .loginPostHttp(data, pathUrl)
                                  .whenComplete(() => null);
                              if (dataaaa == null) {
                                Get.snackbar(
                                  "Something Went Wrong",
                                  "No company found, try agian",
                                  colorText: primaryGreen,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                                return;
                              } else if (dataaaa.company!.ban != true) {
                                if (dataaaa.company!.status == true) {
                                  await controller.datasSaving(
                                      companyName: dataaaa.company!.companyName,
                                      industrie: dataaaa.company!.industry,
                                      location: dataaaa.company!.location,
                                      phone: dataaaa.company!.phone,
                                      email: dataaaa.company!.email,
                                      bio: dataaaa.company!.bio,
                                      logo: dataaaa.company!.logoUrl,
                                      id: dataaaa.company!.id);
                                  controller.datasFetching();
                                  await controller.trueFunction();
                                  controller.emailController.clear();
                                  controller.passwordController.clear();
                                  Get.off(
                                    const LandingPage(),
                                  );
                                }
                              } else if (dataaaa.company!.ban == true) {
                                Get.snackbar(
                                  "Your Company Has been Banned",
                                  "Company Banned",
                                );
                              } else if (dataaaa.company!.status != true) {
                                Get.snackbar(
                                  "Registration Failed",
                                  "Reregister Your Company",
                                );
                              }
                            } else {
                              var data = {
                                'email': controller.emailController.text,
                                'password': controller.passwordController.text,
                              };
                              var url =
                                  "https://jobsway-company.herokuapp.com/api/v1/company/login/hr";
                              HrLogin? response =
                                  await apiServices.hrLogin(data, url);
                              if (response != null) {
                                log("hrId======${response.hrDetails!.id}");

                                await controller.hrFullData(
                                  hrid: response.hrDetails!.id,
                                  name: response.hrDetails!.name,
                                );
                                setState(() {
                                  hrDetails = controller.hrfetching();
                                  log("HrdataFromLogin$hrDetails");
                                });
                                Get.put(LandingController());
                                log("Sucess");

                                CompanyDetailsHr? companydetails =
                                    await getServices.companyDetails(
                                  companyId: response.hrDetails!.companyId!,
                                );
                                if (companydetails != null) {
                                  await controller.datasSaving(
                                      companyName:
                                          companydetails.company!.companyName,
                                      industrie:
                                          companydetails.company!.industry,
                                      location:
                                          companydetails.company!.location,
                                      phone: companydetails.company!.phone,
                                      email: companydetails.company!.email,
                                      bio: companydetails.company!.bio,
                                      logo: companydetails.company!.logoUrl,
                                      id: companydetails.company!.id);

                                  await controller.trueFunction();
                                  controller.emailController.clear();
                                  controller.passwordController.clear();
                                  controller.datasFetching();

                                  Get.off(
                                    () => const LandingPage(),
                                  );
                                } else {
                                  Get.snackbar(
                                    "Something Went Wrong",
                                    "Please Try Again",
                                  );
                                }
                              }
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                          ),
                          width: 160.w,
                          height: 50.h,
                          child: Center(
                            child: Text(
                              "Sign in",
                              style: textStyle(
                                pureWhite,
                                18.sp,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.to(
                          () => const RegisterCompany(),
                        ),
                        child: Wrap(
                          children: [
                            Text(
                              "Company not registerd?",
                              style: textStyle(
                                textBlack,
                                15.sp,
                                FontWeight.normal,
                              ),
                            ),
                            Text(
                              " Register now",
                              style: textStyle(
                                primaryGreen,
                                15.sp,
                                FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            );
          }),
    );
  }
}
