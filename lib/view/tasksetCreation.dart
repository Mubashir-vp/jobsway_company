import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:jobswaycompany/controller/taskCreation_controller.dart';

class TaskCreationPage extends StatelessWidget {
  const TaskCreationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cons = Get.put(TaskCreationController());

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryGreen,
        onPressed: () {
          cons.onPressed();
        },
        child: const Icon(FontAwesomeIcons.plus),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<TaskCreationController>(
            init: TaskCreationController(),
            builder: (controller) {
              List<Widget> contatos = List.generate(
                TaskCreationController.count,
                (int i) => growableTaskCard(),
              );

              taskSet() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Set - 1",
                      style: textStyle(
                        textBlack,
                        18.sp,
                        FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Questions : ",
                      style: textStyle(
                        HexColor("#8B8B8B"),
                        20.sp,
                        FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SizedBox(
                      height: 350.h,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: contatos,
                            ),
                          ),
                          controller.addButton(),
                          Divider(
                            color: primaryGreen,
                            thickness: 4,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }

              List<Widget> column = List.generate(
                TaskCreationController.columnCount,
                (int i) => taskSet(),
              );
              return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 48.h,
                      ),
                      Text(
                        "Task List",
                        style: textStyle(
                          primaryGreen,
                          33.sp,
                          FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                     
                     
                       Container(
                        //  color: Colors.red,
                      height: 450.h,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: column,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ],
                  ));
            }),
      ),
    ));
  }
}
