import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jobswaycompany/api_services/api.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/addNewJob_controller.dart';
import 'package:jobswaycompany/model/postModel/addJob.dart';
import 'package:jobswaycompany/view/paymentPage.dart';

class AddNewJob extends StatelessWidget {
  AddNewJob({Key? key}) : super(key: key);
  final GlobalKey<FormState> addnewjobKey = GlobalKey<FormState>();
  ApiServices apiServices = ApiServices();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController experienceFrom = TextEditingController();
  TextEditingController experienceTo = TextEditingController();
  TextEditingController salaryFrom = TextEditingController();
  TextEditingController salaryTo = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController jobtimeController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // static var controller = Get.put(addnewJobController());
  // List<Widget> contatos = List.generate(
  //   controller.count,
  //   (int i) => controller.growableLongCard(),
  // );
  // List<Widget> skill = List.generate(
  //   controller.cardCount,
  //   (int i) => growableSkillCard(),
  // );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<addnewJobController>(
            init: addnewJobController(),
            builder: (controller) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                    ),
                    child: Form(
                      key: addnewjobKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 28.h,
                          ),
                          Wrap(
                            children: [
                              Text(
                                "Add a new",
                                style: textStyle(
                                  textBlack,
                                  32.sp,
                                  FontWeight.w700,
                                ),
                              ),
                              Text(
                                " Job",
                                style: textStyle(
                                  primaryGreen,
                                  32.sp,
                                  FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          Text(
                            "Job title:",
                            style: textStyle(
                              HexColor("#8B8B8B"),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          addJobField(
                            "",
                            false,
                            TextInputType.name,
                            validator: (val) {
                              if (val == "") {
                                return "This field is required";
                              }
                              if (val.length < 2) {
                                return "Minium 2 characters required";
                              }
                              if (val.length > 20) {
                                return "Maximum 20 characters allowed";
                              }
                            },
                            controller: jobTitle,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Category:",
                            style: textStyle(
                              HexColor("#8B8B8B"),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          addJobField(
                            "",
                            false,
                            TextInputType.name,
                            controller: categorycontroller,
                            validator: (val) {
                              if (val == "") {
                                return "This field is required";
                              }
                              if (val.length < 2) {
                                return "Minium 2 characters required";
                              }
                              if (val.length > 26) {
                                return "Maximum 26 characters allowed";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Location:",
                            style: textStyle(
                              HexColor("#8B8B8B"),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          addJobField(
                            "",
                            false,
                            TextInputType.name,
                            controller: locationController,
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
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Experience required:",
                            style: textStyle(
                              HexColor("#8B8B8B"),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: addJobField(
                                  "In years",
                                  false,
                                  TextInputType.number,
                                  controller: experienceFrom,
                                  validator: (val) {
                                    if (val == "") {
                                      return "This field is required";
                                    }
                                    if (val.length < 1) {
                                      return "Minium 1 characters required";
                                    }
                                    if (val.length > 2) {
                                      return "Maximum 2 characters allowed";
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                                child: const Center(
                                  child: Text(
                                    "To",
                                  ),
                                ),
                              ),
                              Expanded(
                                child: addJobField(
                                  "In years",
                                  false,
                                  TextInputType.number,
                                  controller: experienceTo,
                                  validator: (val) {
                                    if (val == "") {
                                      return "This field is required";
                                    }
                                    if (val.length < 1) {
                                      return "Minium 1 characters required";
                                    }
                                    if (val.length > 2) {
                                      return "Maximum 2 characters allowed";
                                    }
                                    if (int.parse(experienceFrom.text) >
                                        int.parse(experienceTo.text)) {
                                      return "To Cant be Less than From";
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Salary:",
                            style: textStyle(
                              HexColor("#8B8B8B"),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: addJobField(
                                  "",
                                  false,
                                  TextInputType.number,
                                  controller: salaryFrom,
                                  validator: (val) {
                                    if (val == "") {
                                      return "This field is required";
                                    }
                                    if (val.length < 1) {
                                      return "Minium 1 characters required";
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                                child: const Center(
                                  child: Text(
                                    "To",
                                  ),
                                ),
                              ),
                              Expanded(
                                child: addJobField(
                                  "",
                                  false,
                                  TextInputType.number,
                                  controller: salaryTo,
                                  validator: (val) {
                                    if (val == "") {
                                      return "This field is required";
                                    }
                                    if (val.length < 1) {
                                      return "Minium 1 characters required";
                                    }

                                    if (int.parse(salaryFrom.text) >
                                        int.parse(salaryTo.text)) {
                                      return "To Cant be Less than From";
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Qualification:",
                            style: textStyle(
                              HexColor("#8B8B8B"),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          addJobField(
                            "seperate by coma",
                            false,
                            TextInputType.name,
                            controller: qualificationController,
                            validator: (val) {
                              if (val == "") {
                                return "This field is required";
                              }
                              if (val.length < 2) {
                                return "Minium 2 characters required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Education:",
                            style: textStyle(
                              HexColor("#8B8B8B"),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          addJobField(
                            "seperate by coma",
                            false,
                            TextInputType.name,
                            controller: educationController,
                            validator: (val) {
                              if (val == "") {
                                return "This field is required";
                              }
                              if (val.length < 2) {
                                return "Minium 2 characters required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Language:",
                            style: textStyle(
                              HexColor(
                                "#8B8B8B",
                              ),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          addJobField(
                            "Separete by coma",
                            false,
                            TextInputType.name,
                            controller: languageController,
                            validator: (val) {
                              if (val == "") {
                                return "This field is required";
                              }
                              if (val.length < 2) {
                                return "Minium 2 characters required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Skills:",
                            style: textStyle(
                              HexColor(
                                "#8B8B8B",
                              ),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          addJobField(
                            "seperate by coma",
                            false,
                            TextInputType.name,
                            controller: skillController,
                            validator: (val) {
                              if (val == "") {
                                return "This field is required";
                              }
                              if (val.length < 2) {
                                return "Minium 2 characters required";
                              }
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(
                            "Time:",
                            style: textStyle(
                              HexColor(
                                "#8B8B8B",
                              ),
                              16.sp,
                              FontWeight.normal,
                            ),
                          ),
                          controller.radioButton(),
                          SizedBox(
                            height: 25.h,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                log(controller.time.toString());
                                var splitted =
                                    controller.time.toString().split(".");
                                log(splitted.toString());
                                log(splitted[1]);
                                log(controller.hrData[0]);
                                log(controller.companyData[7]);
                                var hrId = controller.hrData[0];
                                var companyId = controller.companyData[7];
                                List<String?> qualification =
                                    qualificationController.text.split(",");
                                List<String?> education =
                                    educationController.text.split(",");
                                List<String?> language =
                                    languageController.text.split(",");
                                List<String?> skills =
                                    skillController.text.split(",");
                                log(
                                  "*****skill=${skills[0]}*************languages=$language*********************education$education******************qualification=$qualification",
                                );

                                if (addnewjobKey.currentState!.validate()) {
                                  Map<String, dynamic> data = {
                                    "jobTitle": jobTitle.text,
                                    "jobCategory": categorycontroller.text,
                                    "minExp": experienceFrom.text,
                                    "maxExp": experienceTo.text,
                                    "timeSchedule": splitted[1],
                                    "minSalary": salaryFrom.text,
                                    "maxSalary": salaryTo.text,
                                    "qualification": qualification,
                                    "education": education,
                                    "jobLocation": locationController.text,
                                    "skills": skills,
                                    "language": language,
                                    "status": "false"
                                  };

                                  AddJob? response = await apiServices.jobAdd(
                                    data,
                                    controller.hrData[0],
                                    controller.companyData[7],
                                  );
                                  if (response == null) {
                                    log("Error");
                                  } else {
                                    log(controller.hrData[0]);
                                    log((response.job!.hrId!));
                                    log(response.job!.id!);
                                    controller.datasForplanSelection(
                                        hrId: response.job!.hrId,
                                        jobId: response.job!.id,
                                        jobName: response.job!.jobTitle);
                                    var fetchedData =
                                        controller.datasFetchingforPlan();
                                    log("sirajjjjjj${response.job!.jobTitle}");
                                    Get.to(
                                      () => Payment(),
                                    );
                                  }
                                }
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Proceed to Payment',
                                  style: textStyle(
                                    pureWhite,
                                    14.sp,
                                    FontWeight.w500,
                                  ),
                                ),
                                width: 185.w,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  color: primaryGreen,
                                  borderRadius: BorderRadius.circular(
                                    4.r,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
