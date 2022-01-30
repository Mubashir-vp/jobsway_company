import 'package:get/get.dart';

import 'login_controller.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var loginController = Get.put(LoginController());
    result = loginController.datasFetching();
  }

  late List<String> result;
}
