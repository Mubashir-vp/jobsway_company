import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';

class RegisterCompanyController extends GetxController {
  bool isChecked = false;

  checkButton() {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        isChecked = value!;
        update();
      },
    );
  }

  TextEditingController companynameController = TextEditingController();
  TextEditingController industrieController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController webSiteController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

 



}
