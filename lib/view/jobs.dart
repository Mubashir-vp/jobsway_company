import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/api_services/api_get_services.dart';
import 'package:jobswaycompany/api_services/delete_apiservices.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobswaycompany/controller/jobController.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/model/getModel/getAllJob_hr.dart';
import 'package:jobswaycompany/view/addNewJob.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:timeago/timeago.dart' as timeago;

class Jobs extends StatelessWidget {
  Jobs({Key? key}) : super(key: key);
  ApiDeletionServices apiDeletionServices = ApiDeletionServices();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<JobController>(
          init: JobController(),
          builder: (controller) {
            return Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: pureWhite,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () {
                      Get.off(
                        const LandingPage(),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      Text(
                        "Jobs.",
                        style: textStyle(
                          primaryGreen,
                          38.sp,
                          FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      isCompany != true
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Get.to(() => AddNewJob()),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Add Job',
                                              style: textStyle(
                                                pureWhite,
                                                20.sp,
                                                FontWeight.w600,
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
                                  ],
                                ),
                                SizedBox(
                                  height: 27.h,
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 28.h,
                            ),
                      Expanded(
                        child: FutureBuilder(
                            future: GetServices().getAllJobs(
                              hrId: controller.result[0],
                            ),
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<List<GetAllJobHr?>?> snapshot,
                            ) {
                              if (snapshot.hasData) {
                                log(snapshot.data!.length.toString());
                                return ListView.separated(
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (
                                      BuildContext context,
                                      index,
                                    ) {
                                      final data = snapshot.data![index];

                                      return GestureDetector(
                                        onTap: () {
                                          isCompany != true
                                              ?controller. alertBox(
                                                  jobId: data!.id,
                                                  hrId: data.hrId)
                                              : log("Company");
                                        },
                                        child: Container(
                                          height: 170.h,
                                          width: 400.w,
                                          decoration: BoxDecoration(
                                            color: fullBlack,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16.w,
                                              vertical: 10.h,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 250.w,
                                                      child: Text(
                                                        "${data!.jobTitle} ",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: textStyle(
                                                          pureWhite,
                                                          25.sp,
                                                          FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      timeago.format(
                                                          data.createdDate!),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: textStyle(
                                                        quatesText,
                                                        11.sp,
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 12.h,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 190.w,
                                                      child: Text(
                                                        '₹ ${data.minSalary}-${data.maxSalary}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: textStyle(
                                                          HexColor(
                                                            "#00B512",
                                                          ),
                                                          20.sp,
                                                          FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${data.timeSchedule}',
                                                        style: textStyle(
                                                          pureWhite,
                                                          14.sp,
                                                          FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 13.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${data.minExp} - ${data.maxExp} years Experience",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: textStyle(
                                                        quatesText,
                                                        14.sp,
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                        child: Center(
                                                          child: Text(
                                                            "View Applicants",
                                                            style: textStyle(
                                                              primaryGreen,
                                                              12.sp,
                                                              FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                        height: 28.h,
                                                        width: 102.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: pureWhite,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            7.r,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (
                                      BuildContext context,
                                      index,
                                    ) =>
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                    itemCount: snapshot.data!.length);
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
