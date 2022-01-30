import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as prefix;
import 'dart:developer';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/model/postModel/companyLogin_model.dart';

class ApiServices {
  Dio dio = Dio();
  Login? login;

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

  Future<Login?> loginPostData(var data, var url) async {
    Response response;
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
}
