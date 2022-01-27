import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobswaycompany/view/addNewJob.dart';

class Jobs extends StatelessWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 28.h,
            ),
            Text(
              "Jobs.",
              style: textStyle(
                primaryGreen,
                38.sp,
                FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: ()=>Get.to(()=>const AddNewJob()),
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Job',
                          style: textStyle(
                            pureWhite,
                            20.sp,
                            FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.add,
                          color: pureWhite,
                        ),
                      ],
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
              height: 28.h,
            ),
            Expanded(
              child: jobCardList(
                companyJobs(),
                Axis.vertical,
                height: 20.h,
              ),
            )
          ],
        ),
      )),
    );
  }
}
