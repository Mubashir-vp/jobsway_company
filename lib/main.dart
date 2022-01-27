import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/view/dashboard.dart';
import 'package:jobswaycompany/view/paymentPage.dart';
import 'package:jobswaycompany/view/profile.dart';
import 'package:jobswaycompany/view/sample.dart';
import 'package:jobswaycompany/view/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: () {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }),
  ));
}
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(428, 926),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: () =>
//           MaterialApp(
//             //... other code
//             builder: (context, widget) {
//               //add this line
//               ScreenUtil.setContext(context);
//               return MediaQuery(
//                 //Setting font does not change with system font size
//                 data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//                 child: Sample(),
//               );
//             },
//             theme: ThemeData(
//               textTheme: TextTheme(
//                 //To support the following, you need to use the first initialization method
//                   button: TextStyle(fontSize: 45.sp)
//               ),
//             ),
//           ),
//     );
//   }
// }