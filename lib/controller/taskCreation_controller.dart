import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskCreationController extends GetxController {
  static int count = 1;
  int cardCount = 1;
  static int columnCount = 1;
  addButton() {
    return IconButton(
      onPressed: () {
        count = count + 1;
        print("click");
        update();
      },
      icon: Icon(
        FontAwesomeIcons.plusCircle,
        color: primaryGreen,
      ),
    );
  }

  onPressed() {
    columnCount = columnCount + 1;
    update();
    print(columnCount);
  }

  List<Widget> contatos = List.generate(
    count,
    (int i) => growableTaskCard(),
  );
}
