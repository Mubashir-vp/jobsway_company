import 'dart:io';
import 'package:get/get.dart' as prefix;
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/model/getModel/getAllJob_hr.dart';
import 'package:jobswaycompany/model/getModel/get_allHr.dart';
import 'package:jobswaycompany/model/getModel/get_companyDetails.dart';

class GetServices {
  Dio dio = Dio();

  ///*************************************************************** */
  late List<GetHr?> getHr;
  Future<List<GetHr?>?> hrlist({var companyId}) async {
    final url =
        "https://jobsway-company.herokuapp.com/api/v1/company/get-all-hr/$companyId";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("error")) {
        prefix.Get.snackbar("HR creation failed", "HR Already exist");
      } else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          log("${response.statusCode}");
          return getHrFromJson(responseString);
        }
      }

      return getHr;
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

  ///*************************************************************** */
  CompanyDetailsHr companyDetailsHr = CompanyDetailsHr();
  Future<CompanyDetailsHr?> companyDetails({var companyId}) async {
    final url =
        "https://jobsway-company.herokuapp.com/api/v1/company/company/$companyId";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("error")) {
        prefix.Get.snackbar("HR creation failed", "HR Already exist");
      } else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          log("${response.statusCode}");
          return companyDetailsHrFromJson(responseString);
        }
      }

      return companyDetailsHr;
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

  ///*************************************************************** */
  late List<GetAllJobHr?> getAllJobHr;
  Future<List<GetAllJobHr?>?> getAllJobs({required var hrId}) async {
    log(hrId);
    final url =
        "https://jobsway-company.herokuapp.com/api/v1/company/jobs/$hrId";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
      );
      String responseString = response.body;

      if (responseString.contains("error")) {
        prefix.Get.snackbar("HR creation failed", "HR Already exist");
      } else {
        if (response.statusCode == 200) {
          String responseString = response.body;
          return getAllJobHrFromJson(responseString);
        }
      }

      return getAllJobHr;
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
}
