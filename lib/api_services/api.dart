import 'dart:io';

import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();

  Future postData() async {
    const String pathUrl =
        "https://jobsway-company.herokuapp.com/api/v1/company/register";
    var response = await dio.post(pathUrl);
  }
}
