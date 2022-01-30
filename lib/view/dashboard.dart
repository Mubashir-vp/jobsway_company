import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/dash_controller.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobswaycompany/view/drawer.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
  List<String> result = loginController.datasFetching();
    log(result[0]);
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<DashBoardController>(
            init: DashBoardController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 37.h,
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Hello, ",
                          style: textStyle(
                            textBlack,
                            38.sp,
                            FontWeight.w700,
                          ),
                        ),
                        Text(
                          isCompany == true ? controller.result[0] : " Mubashir",
                          style: textStyle(
                            primaryGreen,
                            38.sp,
                            FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Welcome back !",
                      style: textStyle(
                        HexColor("#8B8B8B"),
                        30.sp,
                        FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        statusCard(
                          "11",
                          "New Applicants",
                          textStyle(
                            textBlack,
                            30.h,
                            FontWeight.w600,
                          ),
                          textStyle(
                            textBlack,
                            20.h,
                            FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        statusCard(
                          "4",
                          "Jobs",
                          textStyle(
                            textBlack,
                            30.h,
                            FontWeight.w600,
                          ),
                          textStyle(
                            textBlack,
                            30.h,
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    isCompany != true
                        ? Expanded(
                            child: jobList(),
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
