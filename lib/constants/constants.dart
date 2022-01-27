import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/controller/registercompany_controller.dart';
import 'package:jobswaycompany/controller/taskCreation_controller.dart';
import 'package:jobswaycompany/view/addNewJob.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

final registerController = Get.put(RegisterCompanyController());
final primaryGreen = HexColor("#008FAE");
final subtextBlack = HexColor("#575757");
final textBlack = HexColor("#403A3A");
final fullBlack = HexColor("#000000");
final quatesText = HexColor("#C6C6C6");
final pureWhite = HexColor("#FFFFFF");

textStyle(var color, var size, var weight,
    [var decoration, var deccolor, var decstyle]) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
      decoration: decoration,
      decorationColor: deccolor,
      decorationStyle: decstyle,
    ),
  );
}

formField(
  var hint, {
  var suffix,
  var width,
  var height,
  padding,
  var controller,
  var validator,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: suffix,
        ),
        contentPadding: padding,
        filled: true,
        fillColor: HexColor(
          "#E5E4E4",
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        hintText: hint,
        hintStyle: textStyle(
          HexColor(
            "0B0A0A",
          ),
          11.sp,
          FontWeight.normal,
        ),
      ),
    ),
  );
}

searchformField(var hint, [var width]) {
  return SizedBox(
    width: 407.w,
    height: 48.h,
    child: TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              primaryGreen,
            ),
          ),
          onPressed: () {},
          child: Icon(
            Icons.search,
            color: pureWhite,
          ),
        ),
        suffixIconColor: primaryGreen,
        filled: true,
        fillColor: HexColor(
          "#E5E4E4",
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10.r,
          ),
        ),
        label: hint,
        hintStyle: textStyle(
          HexColor(
            "#C6C6C6",
          ),
          15.sp,
          FontWeight.normal,
        ),
      ),
    ),
  );
}

jobCardList(var card, var direction, {var height, var width}) {
  return ListView.separated(
      scrollDirection: direction,
      itemBuilder: (BuildContext context, index) {
        return card;
      },
      separatorBuilder: (
        BuildContext context,
        index,
      ) =>
          SizedBox(
            height: height,
            width: width,
          ),
      itemCount: 10);
}

qualifications() {
  return Text(
    "•   In publishing and graphic design, Lorem ipsum is a\n    placeholder textommonly used .",
    style: textStyle(
      fullBlack,
      14.sp,
      FontWeight.w300,
    ),
  );
}

growableLongCard() {
  return Row(
    children: [
      formField(
        "",
        width: 200.w,
      ),
      SizedBox(
        width: 10.w,
      )
    ],
  );
}

growableSkillCard() {
  return Row(
    children: [
      formField(
        "",
        width: 120.w,
      ),
      SizedBox(
        width: 10.w,
      )
    ],
  );
}

growableForm() {
  return Column(
    children: [
      SizedBox(
        width: 400.0.w,
        height: 140.h,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 130),
            filled: true,
            fillColor: HexColor(
              "#E5E4E4",
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                10.r,
              ),
            ),
            hintText: "Describe Your Experience",
            hintStyle: textStyle(
              HexColor(
                "0B0A0A",
              ),
              15.sp,
              FontWeight.normal,
            ),
          ),
        ),
      ),
    ],
  );
}

taskCard() {
  return Container(
    height: 260.h,
    width: 400.w,
    decoration: BoxDecoration(
      color: fullBlack,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      "assets/985_google_g_icon.jpg",
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 26.w,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  'MicroSoft',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    25.sp,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    size: 11,
                                    color: quatesText,
                                  ),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  Text(
                                    'Bengaluru, India',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: textStyle(
                                      quatesText,
                                      11.sp,
                                      FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Complete Task ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: textStyle(
                                  pureWhite,
                                  20.sp,
                                  FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0.w, top: 13.h),
                                child: Text(
                                  "Questions   : 4",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    16.sp,
                                    FontWeight.normal,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0.w, top: 7.h),
                                child: Text(
                                  "Time   : 40 minutes",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: textStyle(
                                    pureWhite,
                                    16.sp,
                                    FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      "Start Task",
                      style: textStyle(
                        pureWhite,
                        12.sp,
                        FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 34.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(
                      7.r,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

jobStatusContainer(var buttonColor, var textColor, var text) {
  return Container(
    width: 410.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10.r,
      ),
      color: fullBlack,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              15.r,
            ),
            child: SizedBox(
              height: 50.h,
              width: 55.w,
              child: Image.asset(
                "assets/985_google_g_icon.jpg",
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.0.w,
            ),
            child: SizedBox(
              width: 220,
              child: Text(
                "Sr.Software Developer",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: textStyle(
                  pureWhite,
                  20.sp,
                  FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                text,
                style: textStyle(
                  HexColor(
                    textColor,
                  ),
                  12.sp,
                  FontWeight.bold,
                ),
              ),
            ),
            height: 34.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: HexColor(
                buttonColor,
              ),
              borderRadius: BorderRadius.circular(
                5.r,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

questions(var text) {
  return Text(
    text,
    style: textStyle(
      textBlack,
      20.sp,
      FontWeight.w400,
    ),
  );
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return primaryGreen;
}

statusCard(var count, var title, var style1, var style2) {
  return Expanded(
    child: Container(
      width: 182.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: HexColor("#FBE784"),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Text(count, style: style1),
          ),
          Center(
            child: Text(
              title,
              style: style2,
            ),
          )
        ],
      ),
    ),
  );
}

jobTile() {
  return Container(
    height: 130.h,
    width: 450.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        10.r,
      ),
      color: HexColor(
        "#8EEBFF",
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Row(children: [
            SizedBox(
              width: 150.w,
              child: Text(
                "Anas Muhammed Hassan ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle(
                  HexColor("#004756"),
                  15.sp,
                  FontWeight.w800,
                ),
              ),
            ),
            Text(
              "Has completed task",
              style: textStyle(
                HexColor("#A9A9A9"),
                17.sp,
                FontWeight.w300,
              ),
            )
          ]),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30.h,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                  color: HexColor(
                    "#00B512",
                  ),
                ),
                child: Center(
                  child: Text(
                    "Contact",
                    style: textStyle(
                      pureWhite,
                      13.sp,
                      FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                height: 30.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.r,
                    ),
                    color: HexColor(
                      "#C30101",
                    )),
                child: Center(
                  child: Text(
                    "Reject",
                    style: textStyle(
                      pureWhite,
                      13.sp,
                      FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
              ),
              Container(
                height: 30.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.r,
                    ),
                    color: primaryGreen),
                child: Center(
                  child: Text(
                    "view",
                    style: textStyle(
                      pureWhite,
                      14.sp,
                      FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

jobList() {
  return ListView.separated(
    itemBuilder: (BuildContext context, index) {
      return jobTile();
    },
    separatorBuilder: (
      BuildContext context,
      index,
    ) =>
        SizedBox(
      height: 18.h,
    ),
    itemCount: 10,
  );
}

companyJobs() {
  return Container(
    height: 170.h,
    width: 400.w,
    decoration: BoxDecoration(
      color: fullBlack,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250.w,
                child: Text(
                  "Sr.Web developer ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textStyle(
                    pureWhite,
                    25.sp,
                    FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "20 days ago",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: textStyle(
                  quatesText,
                  11.sp,
                  FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 190.w,
                child: Text(
                  '₹ 30000 - 50000',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textStyle(
                    HexColor(
                      "#00B512",
                    ),
                    20.sp,
                    FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Full time',
                  style: textStyle(
                    pureWhite,
                    14.sp,
                    FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "4 - 8 years Experience",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: textStyle(
                  quatesText,
                  14.sp,
                  FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Center(
                    child: Text(
                      "View Applicants",
                      style: textStyle(
                        primaryGreen,
                        12.sp,
                        FontWeight.bold,
                      ),
                    ),
                  ),
                  height: 28.h,
                  width: 102.w,
                  decoration: BoxDecoration(
                    color: pureWhite,
                    borderRadius: BorderRadius.circular(
                      7.r,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

planCard({
  var plan,
  bool? basic,
  var rate,
  var jobShowDay,
  var jobCount,
  bool? free,
}) {
  return Container(
    height: 293.h,
    width: 268.w,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(
            0.8,
          ),
          spreadRadius: 3,
          blurRadius: 11, blurStyle: BlurStyle.normal,
          offset: const Offset(
            0,
            5,
          ), //
        ),
      ],
      color: free == true
          ? pureWhite
          : HexColor(
              "#0A0047",
            ),
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Column(
      children: [
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              plan,
              style: textStyle(
                free == true ? textBlack : pureWhite,
                20.sp,
                FontWeight.w600,
              ),
            ),
            basic == true
                ? Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Popular',
                      style: textStyle(
                        pureWhite,
                        14.sp,
                        FontWeight.w500,
                      ),
                    ),
                    width: 73.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: HexColor("#00B512"),
                      borderRadius: BorderRadius.circular(
                        4.r,
                      ),
                    ),
                  )
                : const SizedBox(),
          ]),
        ),
        SizedBox(
          height: 22.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Center(
            child: Wrap(
              children: [
                Text(
                  "\$ $rate",
                  style: textStyle(
                    free == true ? textBlack : pureWhite,
                    46.sp,
                    FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.0.h,
                  ),
                  child: Text(
                    "  /Job",
                    style: textStyle(
                      free == true ? textBlack : HexColor("#B0B0B0"),
                      15.sp,
                      FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Center(
          child: Text(
            "Job Show for $jobShowDay Days",
            style: textStyle(
              free == true ? textBlack : pureWhite,
              14.sp,
              FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Center(
          child: Text(
            jobCount,
            style: textStyle(
              free == true ? HexColor("#C30101") : pureWhite,
              14.sp,
              FontWeight.w200,
            ),
          ),
        ),
        SizedBox(
          height: 13.h,
        ),
        GestureDetector(
          // onTap: ()=>Get.to(()=>const Home()),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Select Plan',
              style: textStyle(
                pureWhite,
                20.sp,
                FontWeight.w800,
              ),
            ),
            width: 293.w,
            height: 58.h,
            decoration: BoxDecoration(
                color: HexColor(
                  "#5B40FF",
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    10.r,
                  ),
                  bottomRight: Radius.circular(
                    10.r,
                  ),
                )),
          ),
        ),
      ],
    ),
  );
}

applicantsCard() {
  return Container(
    height: 220.h,
    width: 420.w,
    decoration: BoxDecoration(
      color: fullBlack,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
                child: SizedBox(
                  height: 120.h,
                  width: 100.w,
                  child: Image.asset(
                    "assets/dp.jpg",
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Mubashir",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            pureWhite,
                            23.sp,
                            FontWeight.w800,
                          ),
                        ),
                      ),
                      PopupMenuButton(
                          icon: Icon(
                            Icons.pending,
                            color: pureWhite,
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: GestureDetector(
                                    // onTap: () => Get.to(const Profile()),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: primaryGreen,
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "View",
                                          style: textStyle(
                                            pureWhite,
                                            13.sp,
                                            FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    // onTap: () => Get.to(const Profile()),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: HexColor(
                                          "#00B512",
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Add To shortlist",
                                          style: textStyle(
                                            pureWhite,
                                            13.sp,
                                            FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: GestureDetector(
                                    // onTap: () => Get.to(const Profile()),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: HexColor(
                                          "#C30101",
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Reject",
                                          style: textStyle(
                                            pureWhite,
                                            13.sp,
                                            FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  value: 2,
                                ),
                              ])
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Wrap(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 11,
                        color: quatesText,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Bengaluru, India',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            quatesText,
                            11.sp,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Wrap(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.phone,
                        size: 11,
                        color: quatesText,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          '9656234320',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            quatesText,
                            11.sp,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Wrap(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.envelope,
                        size: 11,
                        color: quatesText,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Mubashir.vp14@gmail.com',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            quatesText,
                            11.sp,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.h),
          Wrap(
            children: [
              Text(
                "Applied For : ",
                style: textStyle(
                  pureWhite,
                  14.sp,
                  FontWeight.w300,
                ),
              ),
              Text(
                "  Sr. Web Devoloper",
                style: textStyle(
                  pureWhite,
                  14.sp,
                  FontWeight.w800,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

shortlistCard() {
  return Container(
    height: 220.h,
    width: 420.w,
    decoration: BoxDecoration(
      color: fullBlack,
      borderRadius: BorderRadius.circular(
        10.r,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
                child: SizedBox(
                  height: 120.h,
                  width: 100.w,
                  child: Image.asset(
                    "assets/dp.jpg",
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          "Mubashir",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            pureWhite,
                            23.sp,
                            FontWeight.w800,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => const AddNewJob()),
                        child: Container(
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              'Assign Task',
                              style: textStyle(
                                pureWhite,
                                11.sp,
                                FontWeight.w600,
                              ),
                            ),
                          ),
                          width: 90.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(
                              4.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Wrap(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 11,
                        color: quatesText,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Bengaluru, India',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            quatesText,
                            11.sp,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Wrap(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.phone,
                        size: 11,
                        color: quatesText,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          '9656234320',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            quatesText,
                            11.sp,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Wrap(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.envelope,
                        size: 11,
                        color: quatesText,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          'Mubashir.vp14@gmail.com',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle(
                            quatesText,
                            11.sp,
                            FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.h),
          Wrap(
            children: [
              Text(
                "Applied For : ",
                style: textStyle(
                  pureWhite,
                  14.sp,
                  FontWeight.w300,
                ),
              ),
              Text(
                "  Sr. Web Devoloper",
                style: textStyle(
                  pureWhite,
                  14.sp,
                  FontWeight.w800,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

growableTaskCard() {
  return Column(
    children: [
      formField(
        "",
        width: 400.w,
      ),
      SizedBox(
        height: 30.h,
      )
    ],
  );
}
