import 'dart:developer';

import 'package:get/get.dart';

import 'login_controller.dart';

class DashBoardController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var loginController = Get.put(LoginController());
    isCompany == true
        ? result = loginController.datasFetching()
        : hrData = loginController.hrfetching();
    update();
    log("dashboardData-_----__---__--_-__--___-$hrData");
  }

  late List<String> result;
  late List<String> hrData;
}
