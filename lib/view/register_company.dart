import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/controller/registercompany_controller.dart';
import 'package:jobswaycompany/view/registerResult.dart';
import 'package:email_validator/email_validator.dart';

class RegisterCompany extends StatelessWidget {
  const RegisterCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<RegisterCompanyController>(
              init: RegisterCompanyController(),
              builder: (controller) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                  ),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: Wrap(
                            children: [
                              Text(
                                "Register Your",
                                style: textStyle(
                                  textBlack,
                                  20.sp,
                                  FontWeight.w800,
                                ),
                              ),
                              Text(
                                " Company",
                                style: textStyle(
                                  primaryGreen,
                                  20.sp,
                                  FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 53.h,
                        ),
                        Text(
                          "enter the details of company:",
                          style: textStyle(
                            HexColor("#C6C6C6"),
                            15.sp,
                            FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: formField(
                                "Company Name",
                                controller: controller.companynameController,
                                validator: (val) {
                                  if (val == "") {
                                    return "This field is required";
                                  }
                                  if (val.length < 4) {
                                    return "Minium 4 characters required";
                                  }
                                  if (val.length > 8) {
                                    return "Maximum 8 characters allowed";
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            Expanded(
                                child: formField(
                              "Indutsrie",
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length < 2) {
                                  return "Minium 2 characters required";
                                }
                                if (val.length > 15) {
                                  return "Maximum 15 characters allowed";
                                }
                              },
                              controller: controller.industrieController,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        formField(
                          "Location",
                          validator: (val) {
                            if (val == "") {
                              return "This field is required";
                            }
                            if (val.length < 4) {
                              return "Minium 4 characters required";
                            }
                            if (val.length > 18) {
                              return "Maximum 18 characters allowed";
                            }
                          },
                          controller: controller.locationController,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: formField(
                              "Email",
                              validator: (value) =>
                                  EmailValidator.validate(value)
                                      ? null
                                      : "Please enter a valid email",
                              controller: controller.emailController,
                            )),
                            SizedBox(
                              width: 14.w,
                            ),
                            Expanded(
                                child: formField(
                              "Phone",
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length != 10) {
                                  return "Invalid Phone no";
                                }
                              },
                              controller: controller.phoneController,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        formField(
                          "About Your Company...",
                          validator: (val) {
                            if (val == "") {
                              return "This field is required";
                            }
                          },
                          controller: controller.aboutController,
                          padding: EdgeInsets.only(
                            top: 100.h,
                            left: 10.w,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_album,
                                  color: primaryGreen,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "Add A Logo",
                                  style: textStyle(
                                    fullBlack,
                                    15.sp,
                                    FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            height: 100.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              color: HexColor(
                                "#E5E4E4",
                              ),
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          "Connect Social Media : ",
                          style: textStyle(
                            textBlack,
                            20.sp,
                            FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          "Input the links your accounts",
                          style: textStyle(
                            quatesText,
                            15.sp,
                            FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: formField(
                                "WebSite",
                                validator: (val) {
                                  if (val == "") {
                                    return "This field is required";
                                  }
                                  if (val.length < 4) {
                                    return "Minium 4 characters required";
                                  }
                                  if (val.length > 8) {
                                    return "Maximum 8 characters allowed";
                                  }
                                },
                                controller: controller.webSiteController,
                                suffix: FaIcon(
                                  FontAwesomeIcons.paperclip,
                                  color: primaryGreen,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 14.w,
                            ),
                            Expanded(
                                child: formField(
                              "LinkedIn",
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length < 4) {
                                  return "Minium 4 characters required";
                                }
                                if (val.length > 8) {
                                  return "Maximum 8 characters allowed";
                                }
                              },
                              controller: controller.linkedInController,
                              suffix: FaIcon(
                                FontAwesomeIcons.linkedin,
                                color: primaryGreen,
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: formField(
                              "Facebook",
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length < 4) {
                                  return "Minium 4 characters required";
                                }
                                if (val.length > 8) {
                                  return "Maximum 8 characters allowed";
                                }
                              },
                              controller: controller.facebookController,
                              suffix: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: primaryGreen,
                              ),
                            )),
                            SizedBox(
                              width: 14.w,
                            ),
                            Expanded(
                                child: formField(
                              "Instagram",
                              validator: (val) {
                                if (val == "") {
                                  return "This field is required";
                                }
                                if (val.length < 4) {
                                  return "Minium 4 characters required";
                                }
                                if (val.length > 8) {
                                  return "Maximum 8 characters allowed";
                                }
                              },
                              controller: controller.instagramController,
                              suffix: FaIcon(
                                FontAwesomeIcons.instagramSquare,
                                color: primaryGreen,
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Create password : ",
                          style: textStyle(
                            textBlack,
                            23.sp,
                            FontWeight.w700,
                          ),
                        ),
                        formField(
                          "Create Password",
                          validator: (val) {
                            if (val == "") {
                              return "This field is required";
                            }
                            if (val.length < 4) {
                              return "Minium 4 characters required";
                            }
                            if (val.length > 8) {
                              return "Maximum 8 characters allowed";
                            }
                          },
                          controller: controller.passwordController,
                          suffix: FaIcon(
                            FontAwesomeIcons.eye,
                            color: primaryGreen,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Form(
                          child: formField(
                            "Confirm Password",
                            validator: (val) {
                              if (val == "") {
                                return "This field is required";
                              }
                              if (val.length < 4) {
                                return "Minium 4 characters required";
                              }
                              if (val.length > 8) {
                                return "Maximum 8 characters allowed";
                              }
                            },
                            controller: controller.confirmPasswordController,
                            suffix: FaIcon(
                              FontAwesomeIcons.eye,
                              color: primaryGreen,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            controller.checkButton(),
                            Expanded(
                              child: Text(
                                "I hereby declare that the information given in this application is true and correct.",
                                style: textStyle(
                                  textBlack,
                                  11.sp,
                                  FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              
                              if (formkey.currentState!.validate()&&controller.isChecked==true) {
                                Get.to(const RegisterResult());
                              }
                              if (controller.isChecked == false) {
                                Get.snackbar("Please ensure checkbutton",
                                    "Click the checkbutton");
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Register Company ',
                                style: textStyle(
                                  pureWhite,
                                  20.sp,
                                  FontWeight.w600,
                                ),
                              ),
                              width: 260.w,
                              height: 58.h,
                              decoration: BoxDecoration(
                                color: isCompany == true
                                    ? HexColor("#00B512")
                                    : primaryGreen,
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
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
