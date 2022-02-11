import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:jobswaycompany/api_services/api.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:jobswaycompany/controller/payment_controller.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatelessWidget {
  Payment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor(
        "#FFFFFF",
      ),
      body: GetBuilder<PaymentController>(
          init: PaymentController(),
          builder: (cont) {
            return Column(
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
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 293.h,
                      pageSnapping: false,
                      autoPlay: false,
                      enlargeCenterPage: false,
                    ),
                    items: cont.cards,
                  ),
                ),
                
              ],
            );
          }),
    ));
  }
}
