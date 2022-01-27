import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:jobswaycompany/constants/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 13.w,
            ),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 11.0.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18.h,
                        ),
                        Center(
                          child: Material(
                            elevation: 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                10.r,
                              ),
                              child: SizedBox(
                                height: 120.h,
                                width: 120.w,
                                child: Image.asset(
                                  "assets/985_google_g_icon.jpg",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Center(
                          child: Text(
                            "Google",
                            style: textStyle(
                              textBlack,
                              20.sp,
                              FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Industry     :',
                            style: textStyle(
                              fullBlack,
                              15.sp,
                              FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  Information Technology',
                                style: textStyle(
                                  fullBlack,
                                  15.sp,
                                  FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Location     :',
                            style: textStyle(
                              fullBlack,
                              15.sp,
                              FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  chettipadi,PGDI',
                                style: textStyle(
                                  fullBlack,
                                  15.sp,
                                  FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Phone     :',
                            style: textStyle(
                              fullBlack,
                              15.sp,
                              FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  9656234320',
                                style: textStyle(
                                  fullBlack,
                                  15.sp,
                                  FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                          SizedBox(
                          height: 30.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Email     :',
                            style: textStyle(
                              fullBlack,
                              15.sp,
                              FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  Mubashir.vp14@gmail.com',
                                style: textStyle(
                                  fullBlack,
                                  15.sp,
                                  FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                          SizedBox(
                          height: 30.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Phone     :',
                            style: textStyle(
                              fullBlack,
                              15.sp,
                              FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '  9656234320',
                                style: textStyle(
                                  fullBlack,
                                  15.sp,
                                  FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          'Bio     :',
                          style: textStyle(
                            fullBlack,
                            15.sp,
                            FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Inpublishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful contentument or a typeface without relying on meaningful contentument or a typeface without relying on meaningful content publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful contentument or a typeface without relying on meaningful contentument or a typeface without relying on meaningful content. ',
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle(
                            fullBlack,
                            20.sp,
                            FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.instagram,
                              color: primaryGreen,
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            FaIcon(
                              FontAwesomeIcons.facebook,
                              color: primaryGreen,
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            FaIcon(
                              FontAwesomeIcons.linkedin,
                              color: primaryGreen,
                            ),
                            SizedBox(
                              width: 19.w,
                            ),
                            FaIcon(
                              FontAwesomeIcons.twitter,
                              color: primaryGreen,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
