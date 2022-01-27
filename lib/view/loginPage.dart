import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/view/dashboard.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:jobswaycompany/view/register_company.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                  vertical: 80.h,
                ),
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
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    formField(
                      "Password",
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        "Forgot Password",
                        style: textStyle(
                          textBlack,
                          14.sp,
                          FontWeight.normal,
                          TextDecoration.underline,
                          fullBlack,
                          TextDecorationStyle.wavy,
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 55.h,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(
                        const LandingPage(),
                      ),
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
                      // onTap: () => Get.to(
                      //   () => const RegisterCompany(),
                      // ),
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
              );
            }),
      ),
    );
  }
}
