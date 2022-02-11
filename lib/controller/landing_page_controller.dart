import 'package:get/get.dart';
import 'package:jobswaycompany/controller/dash_controller.dart';

import 'login_controller.dart';

class LandingController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    var loginController = Get.put(LoginController());
    result = loginController.datasFetching();
  }

  List<String>? result;
}
