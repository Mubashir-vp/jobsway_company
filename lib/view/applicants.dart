import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';

class Applicants extends StatelessWidget {
  const Applicants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Applications",
                style: textStyle(
                  primaryGreen,
                  33.sp,
                  FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 88.h,
              ),
              Expanded(
                  child: jobCardList(
                applicantsCard(),
                Axis.vertical,
                height: 20.h,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
