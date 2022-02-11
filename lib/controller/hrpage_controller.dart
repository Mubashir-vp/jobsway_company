import 'dart:developer';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_controller.dart';

class HrpageController extends GetxController {
  bool? success;
  var loginLink;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var loginController = Get.put(LoginController());
    result = loginController.datasFetching();
  }

  late List<String> result;
  void launchURL({var url}) async {
    if (!await launch( url)) throw 'Could not launch $url';
  }

  responseSuccessFunction({var link}) {
    success = true;
    loginLink = link;
    log("Hr creation Success");
    update();
  }
}
