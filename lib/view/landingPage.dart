import 'package:flutter/material.dart';
import 'package:jobswaycompany/view/applicants.dart';
import 'package:jobswaycompany/view/dashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobswaycompany/view/jobs.dart';
import 'package:jobswaycompany/view/profile.dart';
import 'package:jobswaycompany/view/shortList.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    const Dashboard(),
    const Jobs(),
    const Applicants(),
    const ShortList(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: pureWhite,
        elevation: 0,
        iconTheme: IconThemeData(
          color: fullBlack,
        ),
      ),
      drawer: Drawer(
        // backgroundColor: primaryGreen,
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "JobsWay.",
              style: textStyle(
                textBlack,
                29.sp,
                FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Container(
              height: 88.h,
              width: 83.82.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(
                      0.4,
                    ),
                    spreadRadius: 8,
                    blurRadius: 5,
                    offset: const Offset(
                      0,
                      5,
                    ), //
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
                color: pureWhite,
              ),
              child: Image.asset(
                "assets/985_google_g_icon.jpg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Google",
              style: textStyle(
                textBlack,
                24.sp,
                FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            GestureDetector(
              onTap: () {
                currentIndex = 0;
                setState(() {});
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  FaIcon(
                    FontAwesomeIcons.home,
                    color: currentIndex == 0 ? primaryGreen : fullBlack,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Dashboard",
                    style: textStyle(
                    currentIndex==0?primaryGreen:  textBlack,
                      23.sp,
                      currentIndex == 0 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                currentIndex = 1;
                setState(() {});
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  FaIcon(
                    FontAwesomeIcons.suitcase,
                    color: currentIndex == 1 ? primaryGreen : fullBlack,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Jobs",
                    style: textStyle(
                    currentIndex==1?primaryGreen:  textBlack,
                      23.sp,
                      currentIndex == 1 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                currentIndex = 2;
                setState(() {});
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  FaIcon(
                    FontAwesomeIcons.file,
                    color: currentIndex == 2 ? primaryGreen : fullBlack,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Applicants",
                    style: textStyle(
                    currentIndex==2?primaryGreen:  textBlack,
                      23.sp,
                      currentIndex == 2 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                currentIndex = 3;
                setState(() {});
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  FaIcon(
                    FontAwesomeIcons.listAlt,
                    color: currentIndex == 3 ? primaryGreen : fullBlack,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Shortlist",
                    style: textStyle(
                    currentIndex==3?primaryGreen:  textBlack,
                      23.sp,
                      currentIndex == 3 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                currentIndex = 4;
                setState(() {});
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  FaIcon(
                    FontAwesomeIcons.userAlt,
                    color: currentIndex == 4 ? primaryGreen : fullBlack,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Profile",
                    style: textStyle(
                    currentIndex==4?primaryGreen:  textBlack,
                      23.sp,
                      currentIndex == 4 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    color: fullBlack,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Logout",
                    style: textStyle(textBlack, 23.sp, FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    ));
  }
}
