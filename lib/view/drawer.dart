// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jobswaycompany/constants/constants.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class MyDrawer extends StatefulWidget {
//   const MyDrawer({Key? key}) : super(key: key);

//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }

// class _MyDrawerState extends State<MyDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     var current = "dash";
//     return Drawer(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 40.h,
//           ),
//           Text(
//             "JobsWay.",
//             style: textStyle(
//               textBlack,
//               29.sp,
//               FontWeight.w700,
//             ),
//           ),
//           SizedBox(
//             height: 35.h,
//           ),
//           Container(
//             height: 88.h,
//             width: 83.82.w,
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(
//                     0.4,
//                   ),
//                   spreadRadius: 8,
//                   blurRadius: 5,
//                   offset: const Offset(
//                     0,
//                     5,
//                   ), //
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(
//                 10.r,
//               ),
//               color: pureWhite,
//             ),
//             child: Image.asset(
//               "assets/985_google_g_icon.jpg",
//               fit: BoxFit.contain,
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Text(
//             "Google",
//             style: textStyle(
//               textBlack,
//               24.sp,
//               FontWeight.w300,
//             ),
//           ),
//           SizedBox(
//             height: 50.h,
//           ),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 FaIcon(
//                   FontAwesomeIcons.home,
//                   color: current == "dash" ? primaryGreen : fullBlack,
//                 ),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Text(
//                   "Dashboard",
//                   style: textStyle(
//                     textBlack,
//                     23.sp,
//                     current == "dash" ? FontWeight.w600 : FontWeight.normal,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 FaIcon(
//                   FontAwesomeIcons.suitcase,
//                   color: current == "dash" ? primaryGreen : fullBlack,
//                 ),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Text(
//                   "Jobs",
//                   style: textStyle(textBlack, 23.sp, FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 FaIcon(
//                   FontAwesomeIcons.file,
//                   color: current == "dash" ? primaryGreen : fullBlack,
//                 ),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Text(
//                   "Applicants",
//                   style: textStyle(textBlack, 23.sp, FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 FaIcon(
//                   FontAwesomeIcons.listAlt,
//                   color: current == "dash" ? primaryGreen : fullBlack,
//                 ),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Text(
//                   "Shortlist",
//                   style: textStyle(textBlack, 23.sp, FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 FaIcon(
//                   FontAwesomeIcons.userAlt,
//                   color: current == "dash" ? primaryGreen : fullBlack,
//                 ),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Text(
//                   "Profile",
//                   style: textStyle(textBlack, 23.sp, FontWeight.w600),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.h,
//           ),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 FaIcon(
//                   FontAwesomeIcons.signOutAlt,
//                   color: current == "dash" ? primaryGreen : fullBlack,
//                 ),
//                 SizedBox(
//                   width: 20.w,
//                 ),
//                 Text(
//                   "Logout",
//                   style: textStyle(textBlack, 23.sp, FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
