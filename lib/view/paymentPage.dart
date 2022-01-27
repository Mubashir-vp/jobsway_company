import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [
      planCard(
          plan: "Basic",
          basic: true,
          rate: "12",
          free: false,
          jobCount: "Upto 10 job at a time.",
          jobShowDay: "15"),
      planCard(
          plan: "Premium",
          basic: false,
          rate: "20",
          free: false,
          jobCount: "Post Unlimited Jobs.",
          jobShowDay: "20"),
      planCard(
          plan: "Free",
          basic: false,
          rate: "0",
          free: true,
          jobCount: "Only 1 job at a time..",
          jobShowDay: "3"),
    ];
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor(
        "#E6E6E6",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            children: [
              Text(
                "Choose a",
                style: textStyle(
                  textBlack,
                  28.sp,
                  FontWeight.w800,
                ),
              ),
              Text(
                "  Plan",
                style: textStyle(
                  primaryGreen,
                  28.sp,
                  FontWeight.w900,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h,),
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 293.h,
                pageSnapping: false,
                autoPlay: false,
                enlargeCenterPage: false,
              ),
              items: cards,
            ),
          ),
        ],
      ),
    ));
  }
}
