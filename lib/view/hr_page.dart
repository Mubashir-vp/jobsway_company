import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/api_services/api.dart';
import 'package:jobswaycompany/api_services/api_get_services.dart';
import 'package:jobswaycompany/api_services/delete_apiservices.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:jobswaycompany/controller/hrpage_controller.dart';
import 'package:jobswaycompany/model/getModel/get_allHr.dart';
class HrPage extends StatefulWidget {
  const HrPage({Key? key}) : super(key: key);

  @override
  State<HrPage> createState() => _HrPageState();
}

class _HrPageState extends State<HrPage> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ApiDeletionServices apiDeletionServices = ApiDeletionServices();
    ApiServices apiServices = ApiServices();
    TextEditingController hrNameController = TextEditingController();
    TextEditingController hrEmailController = TextEditingController();

    row(var key, var value) {
      return Row(
        children: [
          Text(
            key,
            style: textStyle(
              quatesText,
              20.sp,
              FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 30.w,
          ),
          Text(
            value,
            style: textStyle(
              pureWhite,
              20.h,
              FontWeight.w600,
            ),
          )
        ],
      );
    }

    hrCard() {
      return Container(
        decoration: BoxDecoration(
          color: quatesText,
          borderRadius: BorderRadius.circular(
            5.r,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            10.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            row(
              "Name",
              "Mubashir",
            ),
            SizedBox(
              height: 28.h,
            ),
            row(
              "Email",
              "Mubashir@gmail.com",
            ),
            SizedBox(
              height: 28.h,
            ),
            row(
              "Status",
              "Active",
            ),
            SizedBox(
              height: 28.h,
            ),
            Row(
              children: [
                Text(
                  "Action",
                  style: textStyle(
                    HexColor(
                      "#B4A9A9",
                    ),
                    20.sp,
                    FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ],
            ),
          ]),
        ),
      );
    }

    return SafeArea(
      child: GetBuilder<HrpageController>(
        init: HrpageController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 12.w,
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      formField(
                        "HR Name",
                        false,
                        TextInputType.name,
                        controller: hrNameController,
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
                      SizedBox(
                        height: 30.h,
                      ),
                      formField(
                        "HR Email",
                        false,
                        TextInputType.emailAddress,
                        controller: hrEmailController,
                        validator: (value) => EmailValidator.validate(
                          value,
                        )
                            ? null
                            : "Please enter a valid email",
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            FocusScopeNode currentFocus = FocusScope.of(
                              context,
                            );

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (formkey.currentState!.validate()) {
                              var data = {
                                "name": hrNameController.text.trim(),
                                "email": hrEmailController.text,
                              };
                              var companyId = controller.result[7];
                              final String pathUrl =
                                  "https://jobsway-company.herokuapp.com/api/v1/company/add-company-hr/$companyId";
                              var response = await apiServices.hrRegistration(
                                data,
                                pathUrl,
                              );
                              if (response != null) {
                                controller.responseSuccessFunction(
                                  link: response.signLink,
                                );

                                log(
                                  "Hr creation Success",
                                );
                              } else {
                                Get.snackbar(
                                  "Hr Creation Failed",
                                  "Some error Occured ,Please try again",
                                );
                              }
                              hrNameController.clear();
                              hrEmailController.clear();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add HR',
                                  style: textStyle(
                                    pureWhite,
                                    20.sp,
                                    FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Icon(
                                  Icons.add,
                                  color: pureWhite,
                                ),
                              ],
                            ),
                            width: 156.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: HexColor(
                                "#00B512",
                              ),
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
                      Text(
                        "HR Accounts:",
                        style: textStyle(
                          primaryGreen,
                          26.sp,
                          FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      SizedBox(
                        width: 400.w,
                        height: 270.h,
                        child: FutureBuilder(
                            future: GetServices().hrlist(
                              companyId: controller.result[7],
                            ),
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<List<GetHr?>?> snapshot,
                            ) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (
                                    BuildContext context,
                                    int index,
                                  ) {
                                    final data = snapshot.data![index];
                                   
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: fullBlack,
                                        borderRadius: BorderRadius.circular(
                                          5.r,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                          10.0,
                                        ),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              row(
                                                "Name",
                                                data!.name!.toUpperCase(),
                                              ),
                                              SizedBox(
                                                height: 28.h,
                                              ),
                                              row(
                                                "Email",
                                                data.email,
                                              ),
                                              SizedBox(
                                                height: 28.h,
                                              ),
                                              row(
                                                "Status",
                                                data.status!.toUpperCase(),
                                              ),
                                              SizedBox(
                                                height: 28.h,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Action",
                                                    style: textStyle(
                                                      primaryGreen,
                                                      20.sp,
                                                      FontWeight.w400,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30.w,
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.delete,
                                                    ),
                                                    onPressed: () async {
                                                      Get.defaultDialog(
                                                          title:
                                                              "Delete ${data.name}?",
                                                          titleStyle: textStyle(
                                                            primaryGreen,
                                                            24.sp,
                                                            FontWeight.w600,
                                                          ),
                                                          content: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  String?
                                                                      response =
                                                                      await apiDeletionServices
                                                                          .hrDeletion(
                                                                    companyId:
                                                                        controller
                                                                            .result[7],
                                                                    hrId:
                                                                        data.id,
                                                                  );
                                                                  Get.back();

                                                                  if (response!
                                                                      .contains(
                                                                    "success",
                                                                  )) {
                                                                    setState(
                                                                        () {});
                                                                    Get.snackbar(
                                                                      "Hr Deleted Successfully",
                                                                      "",
                                                                      snackPosition:
                                                                          SnackPosition
                                                                              .BOTTOM,
                                                                    );
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        primaryGreen,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10.r,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                      8.0,
                                                                    ),
                                                                    child: Text(
                                                                      "Yes",
                                                                      style:
                                                                          textStyle(
                                                                        pureWhite,
                                                                        18.sp,
                                                                        FontWeight
                                                                            .w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () =>
                                                                    Get.back(),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        primaryGreen,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10.r,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                      8.0,
                                                                    ),
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style:
                                                                          textStyle(
                                                                        pureWhite,
                                                                        18.sp,
                                                                        FontWeight
                                                                            .w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ));
                                                    },
                                                    color: Colors.red,
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (
                                    context,
                                    int index,
                                  ) {
                                    return SizedBox(
                                      width: 20.w,
                                    );
                                  },
                                  itemCount: snapshot.data!.length,
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      controller.success == true
                          ? GestureDetector(
                              onTap: () {
                                controller.launchURL(
                                  url: controller.loginLink,
                                );
                              },
                              child: Wrap(
                                children: [
                                  Text(
                                    "If your not yet set up your ",
                                    style: textStyle(
                                      textBlack,
                                      15.sp,
                                      FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    " HR account click here",
                                    style: textStyle(
                                      primaryGreen,
                                      15.sp,
                                      FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
