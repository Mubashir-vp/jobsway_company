import 'dart:developer';

import 'package:get/get.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:jobswaycompany/view/loginPage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var controller = Get.put(LoginController());

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      controller.logedChecking();
    });
  }
}
