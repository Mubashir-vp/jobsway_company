import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/view/tasksetCreation.dart';

import 'addNewJob.dart';

class ShortList extends StatelessWidget {
  const ShortList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 13.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Short Listed.",
                  style: textStyle(
                    primaryGreen,
                    33.sp,
                    FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => const TaskCreationPage()),
                      child: Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            'Task set',
                            style: textStyle(
                              pureWhite,
                              20.sp,
                              FontWeight.w600,
                            ),
                          ),
                        ),
                        width: 156.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: HexColor(
                            "#00B512",
                          ),
                          borderRadius: BorderRadius.circular(
                            10.r,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 69.h,
                ),
                Expanded(
                  child: jobCardList(
                    shortlistCard(),
                    Axis.vertical,
                    height: 20.h,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
