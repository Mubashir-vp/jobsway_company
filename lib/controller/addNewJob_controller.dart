import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_controller.dart';

enum Time { FULLTIME, PARTTIME }
Time? character = Time.FULLTIME;

class addnewJobController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    var loginController = Get.put(LoginController());
    companyData = loginController.datasFetching();
    hrData = loginController.hrfetching();
    sharedPreference = await SharedPreferences.getInstance();
  }

  var sharedPreference;
  var sharedJobid;
  var sharedHrid;
  var sharedPlanList;
  var sharedJobname;
  datasForplanSelection({
    var hrId,
    var jobId,
    var jobName
  }) async {
    final List<String> map = [
      sharedHrid = hrId,
      sharedJobid = jobId,
      sharedJobname=jobName
    ];

    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setStringList("sharedPlanList", map);
  }

  List<String> datasFetchingforPlan() {
    var result = sharedPreference.getStringList("sharedPlanList");
    log(result![0]);
    return result;
  }

  late List<String> companyData;
  late List<String> hrData;

  int count = 1;
  int cardCount = 1;
  Time? time = Time.FULLTIME;
  addButton() {
    return IconButton(
      onPressed: () {
        count = count + 1;
        update();
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }

  cardButton() {
    return IconButton(
      onPressed: () {
        cardCount = cardCount + 1;
        update();
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }

  radioButton() {
    return Column(
      children: [
        ListTile(
          title: const Text(
            'Fulltime',
          ),
          leading: Radio<Time>(
            activeColor: primaryGreen,
            value: Time.FULLTIME,
            groupValue: character,
            onChanged: (
              Time? value,
            ) {
              time = value;
              character = value;
              update();
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Part Time',
          ),
          leading: Radio<Time>(
            activeColor: primaryGreen,
            value: Time.PARTTIME,
            groupValue: character,
            onChanged: (
              Time? value,
            ) {
              time = value;
              update();
              character = value;
            },
          ),
        ),
      ],
    );
  }

  // growableLongCard() {
  //   return Row(
  //     children: [
  //       formField(
  //         "",
  //         false,
  //         TextInputType.name,
  //         controller: qualificationController,
  //         width: 200.w,
  //       ),
  //       SizedBox(
  //         width: 10.w,
  //       )
  //     ],
  //   );
  // }
}
