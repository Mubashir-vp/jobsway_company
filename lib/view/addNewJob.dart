import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/addNewJob_controller.dart';
import 'package:jobswaycompany/view/paymentPage.dart';

class AddNewJob extends StatelessWidget {
  const AddNewJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<addnewJobController>(
            init: addnewJobController(),
            builder: (controller) {
              List<Widget> contatos = List.generate(
                controller.count,
                (int i) => growableLongCard(),
              );
              List<Widget> skill = List.generate(
                controller.cardCount,
                (int i) => growableSkillCard(),
              );
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 28.h,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Add a new",
                              style: textStyle(
                                textBlack,
                                32.sp,
                                FontWeight.w700,
                              ),
                            ),
                            Text(
                              " Job",
                              style: textStyle(
                                primaryGreen,
                                32.sp,
                                FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Text(
                          "Job title:",
                          style: textStyle(
                            HexColor("#8B8B8B"),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        formField(""),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Category:",
                          style: textStyle(
                            HexColor("#8B8B8B"),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        formField(""),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Experience required:",
                          style: textStyle(
                            HexColor("#8B8B8B"),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: formField(""),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: const Center(
                                child: Text(
                                  "To",
                                ),
                              ),
                            ),
                            Expanded(
                              child: formField(""),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Salary:",
                          style: textStyle(
                            HexColor("#8B8B8B"),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: formField(""),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: const Center(
                                child: Text(
                                  "To",
                                ),
                              ),
                            ),
                            Expanded(
                              child: formField(""),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Qualification:",
                          style: textStyle(
                            HexColor("#8B8B8B"),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 60.h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: contatos,
                                ),
                              ),
                            ),
                            controller.addButton(),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Education:",
                          style: textStyle(
                            HexColor("#8B8B8B"),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 60.h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: contatos,
                                ),
                              ),
                            ),
                            controller.addButton(),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Language:",
                          style: textStyle(
                            HexColor(
                              "#8B8B8B",
                            ),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        formField(
                          "Separete by coma",
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Skills:",
                          style: textStyle(
                            HexColor(
                              "#8B8B8B",
                            ),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 60.h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: skill,
                                ),
                              ),
                            ),
                            controller.cardButton(),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          "Time:",
                          style: textStyle(
                            HexColor(
                              "#8B8B8B",
                            ),
                            16.sp,
                            FontWeight.normal,
                          ),
                        ),
                        controller.radioButton(),
                        SizedBox(
                          height: 25.h,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () => Get.to(() => const Payment()),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Proceed to Payment',
                                style: textStyle(
                                  pureWhite,
                                  14.sp,
                                  FontWeight.w500,
                                ),
                              ),
                              width: 185.w,
                              height: 58.h,
                              decoration: BoxDecoration(
                                color: primaryGreen,
                                borderRadius: BorderRadius.circular(
                                  4.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
