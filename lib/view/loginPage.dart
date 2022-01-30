import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/api_services/api.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/model/postModel/companyLogin_model.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:jobswaycompany/view/register_company.dart';
import 'dart:developer';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices = ApiServices();
    final formkey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.w,
                    vertical: 80.h,
                  ),
                  child: Form(
                    key: formkey,
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
                            if (formkey.currentState!.validate()) {
                              String pathUrl =
                                  "https://jobsway-company.herokuapp.com/api/v1/company/login";
                              var data = {
                                'email': controller.emailController.text,
                                'password': controller.passwordController.text,
                              };
                              response = await apiServices
                                  .loginPostData(data, pathUrl)
                                  .whenComplete(() => null);
                              if (response == null) {
                                log("hai guyss");
                                return;
                              } else if (response.company!.ban != true) {
                                if (response.company!.status != true) {
                                  await controller.datasSaving(
                                    companyName: response.company!.companyName,
                                    industrie: response.company!.industry,
                                    location: response.company!.location,
                                    phone: response.company!.phone,
                                    email: response.company!.email,
                                    bio: response.company!.bio,
                                    logo: response.company!.logoUrl,
                                  );
                                  controller.datasFetching();
                                  await controller.trueFunction();
                                  Get.off(
                                    () => const LandingPage(),
                                  );
                                }
                              } else if (response.company!.ban == true) {
                                Get.snackbar(
                                  "Your Company Has been Banned",
                                  "Company Banned",
                                );
                              } else if (response.company!.status == true) {
                                Get.snackbar(
                                  "Registration Failed",
                                  "Reregister Your Company",
                                );
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
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
