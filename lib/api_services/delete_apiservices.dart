import 'dart:io';
import 'package:get/get.dart' as prefix;
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:jobswaycompany/constants/constants.dart';

class ApiDeletionServices {
  Dio dio = Dio();
  initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onError:
        (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
      log("errrrrrr${error.message}");
    }, onResponse:
        (response, ResponseInterceptorHandler responseinterceptorHandler) {
      log(response.data);
    }));
  }

  Future<String?> hrDeletion(
      {required var companyId, required var hrId}) async {
    final url =
        "https://jobsway-company.herokuapp.com/api/v1/company/delete-hr/$companyId/$hrId";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.delete(
        pathUrl,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("error")) {
        prefix.Get.snackbar("HR Deletion failed", "");
      } else {
        if (response.statusCode == 200) {
          log("${response.statusCode}");
          return "success";
        }
      }
      return "failed";
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

  Future<String?> jobDeletion({required var hrId, required var jobId}) async {
    final url =
        "https://jobsway-company.herokuapp.com/api/v1/company/delete-job/$jobId?hrId=$hrId";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.delete(
        pathUrl,
      );
      log("dataaaaaaaa${response.body}");
      log("${response.statusCode}");
      String responseString = response.body;

      if (responseString.contains("error")) {
        prefix.Get.snackbar("Job Deletion failed", "");
      } else {
        if (response.statusCode == 200) {
          log("${response.statusCode}");
          return "success";
        }
      }
      return "failed";
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
