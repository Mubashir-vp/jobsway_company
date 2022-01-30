import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

var companyName;

class RegisterCompanyController extends GetxController {
  bool isChecked = false;
  bool eyesOpen = true;
  static const sharedVal = "company";
 @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    conditionFunction("");
  }
  conditionFunction(String value) async {
    WidgetsFlutterBinding.ensureInitialized();
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString(sharedVal, value);
    companyName = sharedPreference.getString(sharedVal);
    update();
  }

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

  File? file;
  var path;

  Future profilePicker() async {
    final image = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (image == null) return;
    path = image.files.single.path;
    update();
    file = File(path!);
    update();
  }

  Future<Null> cropImage() async {
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            activeControlsWidgetColor: primaryGreen,
            toolbarTitle: 'Edit Your Logo',
            toolbarColor: primaryGreen,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          title: 'Edit Your Logo',
        ));
    if (croppedFile != null) {
      file = croppedFile;

      update();
    }
  }

  eye() {
    return GestureDetector(
      onTap: () {
        if (eyesOpen == false) {
          eyesOpen = true;
        } else {
          eyesOpen = false;
        }
        print("opend");

        update();
      },
      child: FaIcon(
        eyesOpen == false ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
        color: primaryGreen,
      ),
    );
  }
}
