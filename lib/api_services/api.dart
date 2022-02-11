import 'dart:io';
import 'package:get/get.dart' as prefix;
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/model/postModel/addJob.dart';
import 'package:jobswaycompany/model/postModel/amountSending.dart';
import 'package:jobswaycompany/model/postModel/companyLogin_model.dart';
import 'package:jobswaycompany/model/postModel/hr_creation.dart';
import 'package:jobswaycompany/model/postModel/hrlogin_model.dart';

class ApiServices {
  Dio dio = Dio();
  Login? login;

//*************************************************************** */

  Future postData(var data, var url) async {
    try {
      var response = await dio.post(
        url,
        data: data,
      );

      if (response.statusCode == 200) {
        log("hii");
        log('*******************************${response.data}');
      }

      return response.data;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("eror${e.message}.message");

      prefix.Get.snackbar(
        "Something Went Wrong",
        e.message,
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
    initializeInterceptors();
  }

//*************************************************************** */
  Future<Login?> loginPostData(var data, var url) async {
    try {
      var response = await dio.post(
        url,
        data: data,
      );
      log("dataaaaaaaa${response.data}");

      if (response.statusCode == 200) {
        login = Login.fromJson(response.data);
        return login;
      }
      return login;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
    initializeInterceptors();
  }

  initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onError:
        (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
      log("errrrrrr${error.message}");
    }, onResponse:
        (response, ResponseInterceptorHandler responseinterceptorHandler) {
      log(response.data);
    }));
  }
//*************************************************************** */

  Future<Login?> loginPostHttp(var data, var url) async {
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");

      if (response.statusCode == 200) {
        String responseString = response.body;
        log("${response.statusCode}");
        return loginFromJson(responseString);
      }
      return login;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
    initializeInterceptors();
  }
//*************************************************************** */

  Hrcreation hrcreation = Hrcreation();
  Future<Hrcreation?> hrRegistration(var data, var url) async {
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("msg")) {
        prefix.Get.snackbar(
          "HR creation failed",
          "HR with this Email already exists",
          snackPosition: prefix.SnackPosition.BOTTOM,
        );
      } else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          log("${response.statusCode}");
          return hrcreationFromJson(responseString);
        }
      }

      return hrcreation;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
    initializeInterceptors();
  }

//*************************************************************** */
  HrLogin _hrLogin = HrLogin();
  Future<HrLogin?> hrLogin(var data, var url) async {
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("error")) {
        prefix.Get.snackbar("HR Not Found", "");
        return null;
      } else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          log("${response.statusCode}");
          return hrLoginFromJson(responseString);
        }
      }

      return _hrLogin;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log(e.message);

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    }
    initializeInterceptors();
  }

//*************************************************************** */

  AddJob addJob = AddJob();
  Future jobAdd(
    Map<String, dynamic> data,
    var hrId,
    var compenyId,
  ) async {
    var url =
        "https://jobsway-company.herokuapp.com/api/v1/company/add-job/$hrId?cid=$compenyId";
    log(hrId);
    log(compenyId);
    var pathUrl = Uri.parse(url);

    String jsonData = jsonEncode(data);

    try {
      var response = await http.post(
        pathUrl,
        body: jsonData,
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        return addJobFromJson(response.body);
      }

      return addJob;
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("llllll");

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on TypeError catch (e) {
      log(e.toString());
      prefix.Get.snackbar(
        "$e",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on NoSuchMethodError catch (e) {
      log(e.toString());
    }
    initializeInterceptors();
  }
  //*************************************************************** */

  Future<bool?> freePlan(
    Map<String, dynamic> data,
    var hrId,
  ) async {
    var url =
        "https://jobsway-company.herokuapp.com/api/v1/company/add-free-plan/$hrId";
    log(hrId);
    var pathUrl = Uri.parse(url);

    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );
      log("statusCode${response.statusCode}");
      if (response.body.contains("Invalid Access to Delete the Job")) {
        prefix.Get.snackbar("Error Adding Job", "Please try later");
        return false;
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("llllll");

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on TypeError catch (e) {
      log(e.toString());
      prefix.Get.snackbar(
        "$e",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on NoSuchMethodError catch (e) {
      log(e.toString());
    }
    initializeInterceptors();
  }

  //*************************************************************** */
  PaymentResponse paymentResponse = PaymentResponse();
  Future<PaymentResponse?> premiumPlan(
    var hrId,
    var amount,
  ) async {
    var data = {"amount": amount};
    var url =
        "https://jobsway-company.herokuapp.com/api/v1/company/razorpay/addjobpayment/$hrId";
    log(hrId);
    var pathUrl = Uri.parse(url);

    try {
      var response = await http.post(
        pathUrl,
        body: data,
      );

      log("statusCode${response.body}");
      if (response.body.contains("Invalid Access to Delete the Job")) {
        prefix.Get.snackbar("Payment Error", "Please try later");
      }
      if (response.statusCode == 200) {
        return paymentResponseFromJson(response.body);
      } else {
        return null;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("llllll");

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on TypeError catch (e) {
      log(e.toString());
      prefix.Get.snackbar(
        "$e",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on NoSuchMethodError catch (e) {
      log(e.toString());
    }
    initializeInterceptors();
  }

  //*************************************************************** */
  Future<bool?> afterRazorPay(
    Map<String, dynamic> data,
  ) async {
    var url =
        "https://jobsway-company.herokuapp.com/api/v1/company/razorpay/verify-payment";
    var pathUrl = Uri.parse(url);
    String encoded = json.encode(data);
    log(encoded.toString());

    try {
      var response = await http.post(
        pathUrl,
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"},
      );

      log("statusCode${response.body}");
      if (response.body.contains("Invalid Access to Delete the Job")) {
        prefix.Get.snackbar("Payment Error", "Please try later");
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException {
      log("scene");
      prefix.Get.snackbar(
        "NetWork Error",
        "Check your networkconnection",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on DioError catch (e) {
      log("llllll");

      prefix.Get.snackbar(
        "Something Went Wrong",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on TypeError catch (e) {
      log(e.toString());
      prefix.Get.snackbar(
        "$e",
        "No company found, try agian",
        colorText: primaryGreen,
        snackPosition: prefix.SnackPosition.BOTTOM,
      );
    } on NoSuchMethodError catch (e) {
      log(e.toString());
    }
    initializeInterceptors();
  }
}
