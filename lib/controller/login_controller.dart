// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/dash_controller.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:jobswaycompany/view/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const sharedVal = "true";
bool? isCompany = true;
var isLoggedIn = "false";
bool? isLogged;

class LoginController extends GetxController {
  bool? company;
  bool eyesOpen = true;
  var isLoggedIn = "false";
  bool? isLogged;
  var sharedList;
  var sharedCompanyname;
  var sharedindustrie;
  var sharedLocation;
  var sharedPhone;
  var sharedLogo;
  var sharedBio;
  var sharedemail;
  var sharedId;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    sharedPreference = await SharedPreferences.getInstance();
  }

  var sharedPreference;
  var sharedHrList;


  conditionFunction(bool value) async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(sharedVal, value);
    isCompany = sharedPreference.getBool(sharedVal);
    update();
  }

  datasSaving(
      {var companyName,
      var industrie,
      var location,
      var phone,
      var logo,
      var bio,
      var email,
      var id}) async {
    final List<String> map = [
      sharedCompanyname = companyName,
      sharedindustrie = industrie,
      sharedLocation = location,
      sharedPhone = phone,
      sharedLogo = logo,
      sharedBio = bio,
      sharedemail = email,
      sharedId = id
    ];

    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setStringList("sharedList", map);
    update();
  }

  List<String> datasFetching() {
    var result = sharedPreference.getStringList("sharedList");
    return result;
  }

  trueFunction() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(isLoggedIn, true);
  }

  falseFunction() async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(isLoggedIn, false);
  }

  logedChecking() async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    isLogged = sharedPreference.getBool(isLoggedIn);
    if (isLogged == true) {
      Get.to(() => const LandingPage());
    } else {
      Get.to(() => LoginPage());
    }
    update();
    update();
  }

  isComponyOrnot() async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    isCompany = sharedPreference.getBool(sharedVal);
  }

  selectionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            company = true;
            conditionFunction(company!);
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
            conditionFunction(company!);
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

  eye() {
    return GestureDetector(
      onTap: () {
        if (eyesOpen == false) {
          eyesOpen = true;
        } else {
          eyesOpen = false;
        }

        update();
      },
      child: FaIcon(
        eyesOpen == false ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
        color: primaryGreen,
      ),
    );
  }

  var sharedHrname;
  var hrname;
  hrNameSaver({
    var hrname,
  }) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("sharedHrname", hrname);
    update();
  }

  var sharedHrId;

  hrFullData({
    var name,
    var hrid,
  }) async {
    final List<String> map = [
      sharedHrId = hrid,
      sharedHrname = name,
    ];

    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setStringList("sharedHrList", map);
    update();
  }

  List<String> hrfetching() {

    var result = sharedPreference.getStringList("sharedHrList");
    log("Hereeeeeeeeee$result");

    return result;
  }

  sharedPreferenceEmpty() {
    hrFullData(hrid: "", name: "");
    hrNameSaver(hrname: "");
    update();
  }

  Future refreshingSharedPreference(
      {required var id, required var name}) async {
    hrNameSaver(hrname: name);
    hrFullData(
      hrid: id,
      name: name,
    );
    var hrData = hrfetching();
    update();
  }
}
