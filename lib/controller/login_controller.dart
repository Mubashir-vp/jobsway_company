import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';

const sharedVal = "true";
var isCompany;

class LoginController extends GetxController {
  bool company = true;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    conditionFunction(company);
  }

  conditionFunction(bool value) async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(sharedVal, value);
    isCompany = sharedPreference.getBool(sharedVal);
    update();
  }

  selectionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            company = true;
            conditionFunction(company);
            update();
          },
          child: Container(
            decoration: BoxDecoration(
              color: isCompany == true ? primaryGreen : HexColor("#E5E4E4"),
              borderRadius: BorderRadius.circular(
                7.r,
              ),
            ),
            width: 118.w,
            height: 38.h,
            child: Center(
              child: Text(
                "Company",
                style: textStyle(
                  isCompany == true ? HexColor("#F6F6F6") : primaryGreen,
                  14.sp,
                  FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            company = false;
            conditionFunction(company);
            update();
          },
          child: Container(
            decoration: BoxDecoration(
              color: isCompany == false ? primaryGreen : HexColor("#E5E4E4"),
              borderRadius: BorderRadius.circular(
                7.r,
              ),
            ),
            width: 118.w,
            height: 38.h,
            child: Center(
              child: Text(
                "HR",
                style: textStyle(
                  isCompany == true ? primaryGreen : HexColor("#F6F6F6"),
                  14.sp,
                  FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
