import 'package:flutter/material.dart';
import 'package:jobswaycompany/controller/landing_page_controller.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/model/postModel/companyLogin_model.dart';
import 'package:jobswaycompany/view/applicants.dart';
import 'package:jobswaycompany/view/dashboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobswaycompany/view/hr_page.dart';
import 'package:jobswaycompany/view/jobs.dart';
import 'package:jobswaycompany/view/loginPage.dart';
import 'package:jobswaycompany/view/profile.dart';
import 'package:jobswaycompany/view/shortList.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var controller = Get.put(LandingController());
  hrDrawer() {
    return Drawer(
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
          Text(
            controller.result![0],
            style: textStyle(
              primaryGreen,
              28.sp,
              FontWeight.w900,
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
                    currentIndex == 0 ? primaryGreen : textBlack,
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
                    currentIndex == 1 ? primaryGreen : textBlack,
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
                    currentIndex == 2 ? primaryGreen : textBlack,
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
                    currentIndex == 3 ? primaryGreen : textBlack,
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
            onTap: () async {
              await logincontroller.falseFunction();
              Get.off(() => LoginPage());
            },
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
    );
  }

  companyDrawer() {
    return Drawer(
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
              child: controller.result != null
                  ? Image.network(
                      controller.result![4],
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      "assets/comp_3.gif",
                      fit: BoxFit.cover,
                    )),
          SizedBox(
            height: 20.h,
          ),
          Text(
            controller.result![0].toUpperCase(),
            style: textStyle(
              primaryGreen,
              28.sp,
              FontWeight.w900,
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
                    currentIndex == 0 ? primaryGreen : textBlack,
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
                    currentIndex == 1 ? primaryGreen : textBlack,
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
                  FontAwesomeIcons.users,
                  color: currentIndex == 2 ? primaryGreen : fullBlack,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Hr Manage",
                  style: textStyle(
                    currentIndex == 2 ? primaryGreen : textBlack,
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
                  FontAwesomeIcons.userAlt,
                  color: currentIndex == 3 ? primaryGreen : fullBlack,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "Profile",
                  style: textStyle(
                    currentIndex == 3 ? primaryGreen : textBlack,
                    23.sp,
                    currentIndex == 3 ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          GestureDetector(
            onTap: () async {
              await logincontroller.falseFunction();
              await logincontroller.sharedPreferenceEmpty();
              Get.off(() => LoginPage());
            },
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
    );
  }

  var logincontroller = Get.put(LoginController());
  int currentIndex = 0;
  List<Widget> pagesHr = [
    const Dashboard(),
     Jobs(),
    const Applicants(),
    const ShortList(),
  ];
  List<Widget> pagesCompany = [
    const Dashboard(),
     Jobs(),
    const HrPage(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<LandingController>(
            init: LandingController(),
            builder: (controller) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: pureWhite,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: fullBlack,
                  ),
                ),
                drawer: isCompany == true ? companyDrawer() : hrDrawer(),
                body: IndexedStack(
                  index: currentIndex,
                  children: isCompany == true ? pagesCompany : pagesHr,
                ),
              );
            }));
  }
}
