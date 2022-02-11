import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:jobswaycompany/view/splashscreen.dart';

void main() {
  runApp(GetMaterialApp(

    routes: {
        'landig':(context)=>const LandingPage(),
        // '/reg':(context)=>Registration(),
        // '/dashboard':(context)=>Dashboard()    
        },
    debugShowCheckedModeBanner: false,
    home: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: () {
          return  const SplashScreen();
        }),
    
  ));
}
