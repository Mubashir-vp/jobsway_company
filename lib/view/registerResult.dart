import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/registercompany_controller.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/view/loginPage.dart';

class RegisterResult extends StatelessWidget {
  const RegisterResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 13.w,
          ),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 294.h,
                  ),
                  Wrap(
                    children: [
                      Text(
                        "Hey",
                        style: textStyle(
                          textBlack,
                          30.sp,
                          FontWeight.w600,
                        ),
                      ),
                      Text(
                        " $companyName,",
                        style: textStyle(
                          primaryGreen,
                          30.sp,
                          FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Your Company has Created Successfully.",
                    style: textStyle(
                      fullBlack,
                      16.sp,
                      FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Center(
                    child: Text(
                      "JobsWay will Verify Your Company and Provide the Dashboard to you within 1 - 2 days.",
                      style: textStyle(
                        fullBlack,
                        16.sp,
                        FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        Get.to(
                          () => const LoginPage(),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Go Back to Login ',
                          style: textStyle(
                            pureWhite,
                            20.sp,
                            FontWeight.w600,
                          ),
                        ),
                        width: 260.w,
                        height: 58.h,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
