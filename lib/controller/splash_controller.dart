import 'package:get/get.dart';
import 'package:jobswaycompany/view/register_company.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Get.to(
        () => const RegisterCompany(),
      );
    });
  }
}
