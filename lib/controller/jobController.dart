import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/api_services/delete_apiservices.dart';
import 'package:jobswaycompany/constants/constants.dart';

import 'login_controller.dart';

class JobController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var loginController = Get.put(LoginController());
    result = loginController.hrfetching();
  }

  late List<String> result;
  ApiDeletionServices apiDeletionServices = ApiDeletionServices();

  alertBox({required jobId, required hrId}) {
    return Get.defaultDialog(
        title: "Delete this job?",
        titleStyle: textStyle(
          primaryGreen,
          24.sp,
          FontWeight.w600,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () async {
                String? response = await apiDeletionServices.jobDeletion(
                  jobId: jobId,
                  hrId: hrId,
                );
                update();
                Get.back();

                if (response!.contains(
                  "success",
                )) {
                  Get.snackbar(
                    "Job Deleted Successfully",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    "Yes",
                    style: textStyle(
                      pureWhite,
                      18.sp,
                      FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    "Cancel",
                    style: textStyle(
                      pureWhite,
                      18.sp,
                      FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
