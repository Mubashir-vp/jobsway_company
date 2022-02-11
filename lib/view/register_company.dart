import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/api_services/api.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/controller/registercompany_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';

import 'registerResult.dart';

class RegisterCompany extends StatelessWidget {
  const RegisterCompany({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    ApiServices apiServices = ApiServices();
    bool loading = false;
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
                                false,
                                TextInputType.name,
                                controller: controller.companynameController,
                                validator: (val) {
                                  if (val == "") {
                                    return "This field is required";
                                  }
                                  if (val.length < 4) {
                                    return "Minium 4 characters required";
                                  }
                                  if (val.length > 18) {
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
                              false,
                              TextInputType.name,
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
                            ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        formField(
                          "Location",
                          false,
                          TextInputType.streetAddress,
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
                              false,
                              TextInputType.emailAddress,
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
                              false,
                              TextInputType.phone,
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
                          false,
                          TextInputType.name,
                          validator: (val) {
                            if (val == "") {
                              return "This field is required";
                            }
                            if (val.length < 30) {
                              return "Length minimum 30 required";
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
                          child: GestureDetector(
                            onTap: () async {
                              await controller.profilePicker();
                              if (controller.file != null) {
                                controller.cropImage();
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: controller.path == null
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                    )
                                  : Image.file(
                                      controller.file!,
                                      fit: BoxFit.cover,
                                    ),
                              height: 180.h,
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
                                false,
                                TextInputType.url,
                                validator: (val) {
                                  bool _validURL = Uri.parse(val).isAbsolute;

                                  if (val != "") {
                                    if (_validURL != true) {
                                      return "Enter a correct URL";
                                    }
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
                              false,
                              TextInputType.url,
                              validator: (val) {
                                bool _validURL = Uri.parse(val).isAbsolute;

                                if (val != "") {
                                  if (_validURL != true) {
                                    return "Enter a correct URL";
                                  }
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
                              false,
                              TextInputType.url,
                              validator: (val) {
                                bool _validURL = Uri.parse(val).isAbsolute;

                                if (val != "") {
                                  if (_validURL != true) {
                                    return "Enter a correct URL";
                                  }
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
                              false,
                              TextInputType.url,
                              validator: (val) {
                                bool _validURL = Uri.parse(val).isAbsolute;
                                if (val != "") {
                                  if (_validURL != true) {
                                    return "Enter a correct URL";
                                  }
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
                        formField("Create Password", controller.eyesOpen,
                            TextInputType.number, validator: (val) {
                          if (val == "") {
                            return "This field is required";
                          }
                          if (val.length < 4) {
                            return "Minium 4 characters required";
                          }
                          if (val.length > 10) {
                            return "Maximum 8 characters allowed";
                          }
                        },
                            controller: controller.passwordController,
                            suffix: controller.eye()),
                        SizedBox(
                          height: 25.h,
                        ),
                        formField(
                          "Confirm Password",
                          controller.eyesOpen,
                          TextInputType.number,
                          controller: controller.confirmPasswordController,
                          validator: (val) {
                            if (val == "") {
                              return "This field is required";
                            }
                            if (val.length < 4) {
                              return "Minium 4 characters required";
                            }
                            if (val.length > 10) {
                              return "Maximum 8 characters allowed";
                            }
                            if (controller.passwordController.text !=
                                controller.confirmPasswordController.text) {
                              return "Password didn't match";
                            }
                          },
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
                            onTap: () async {
                              loading = true;
                              controller.file ??
                                  Get.snackbar(
                                      "Logo didn't pick", "Registration Failed",
                                      snackPosition: SnackPosition.BOTTOM,
                                      titleText: Text(
                                        "Logo is not selected",
                                        style: textStyle(
                                          fullBlack,
                                          19.sp,
                                          FontWeight.w900,
                                        ),
                                      ),
                                      messageText: Text(
                                        "Please Select a logo to complete your registration",
                                        style: textStyle(
                                          textBlack,
                                          18.sp,
                                          FontWeight.w700,
                                        ),
                                      ));

                              if (formkey.currentState!.validate() &&
                                  controller.isChecked == true) {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                List<int> imageBytes =
                                    controller.file!.readAsBytesSync();
                                String base64Image = base64Encode(imageBytes);
                                String fileExtension = controller.path
                                    .split('/')
                                    .last
                                    .split('.')
                                    .last;
                                log(fileExtension);
                                String companyName =
                                    controller.companynameController.text;
                                const String pathUrl =
                                    "https://jobsway-company.herokuapp.com/api/v1/company/register";
                                final datas = {
                                  'companyDetails': {
                                    'companyName': controller
                                        .companynameController.text
                                        .trim(),
                                    'industry':
                                        controller.industrieController.text,
                                    'location':
                                        controller.locationController.text,
                                    'email':
                                        controller.emailController.text.trim(),
                                    'bio': controller.aboutController.text,
                                    'phone':
                                        controller.phoneController.text.trim(),
                                    'website':
                                        controller.webSiteController.text,
                                    'linkedin':
                                        controller.linkedInController.text,
                                    'facebook':
                                        controller.facebookController.text,
                                    'instagram':
                                        controller.instagramController.text,
                                    'password': controller
                                        .confirmPasswordController.text,
                                  },
                                  "image":
                                      'data:image/$fileExtension;base64,$base64Image',
                                };
                                await apiServices
                                    .postData(datas, pathUrl)
                                    .whenComplete(() => controller
                                        .conditionFunction(companyName));
                                controller.companynameController.clear();
                                controller.industrieController.clear();
                                controller.locationController.clear();
                                controller.emailController.clear();
                                controller.phoneController.clear();
                                controller.aboutController.clear();
                                controller.webSiteController.clear();
                                controller.linkedInController.clear();
                                controller.facebookController.clear();
                                controller.instagramController.clear();
                                controller.passwordController.clear();
                                controller.confirmPasswordController.clear();
                                Get.off(const RegisterResult());
                              }
                              if (controller.isChecked == false) {
                                Get.snackbar("Please ensure checkbutton",
                                    "Click the checkbutton");
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: loading == false
                                  ? Text(
                                      'Register Company ',
                                      style: textStyle(
                                        pureWhite,
                                        20.sp,
                                        FontWeight.w600,
                                      ),
                                    )
                                  : const CircularProgressIndicator(),
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
