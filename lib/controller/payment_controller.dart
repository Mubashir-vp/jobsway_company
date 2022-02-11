// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/api_services/api.dart';
import 'package:jobswaycompany/constants/constants.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobswaycompany/controller/login_controller.dart';
import 'package:jobswaycompany/controller/registercompany_controller.dart';
import 'package:jobswaycompany/model/postModel/addJob.dart';
import 'package:jobswaycompany/model/postModel/amountSending.dart';
import 'package:jobswaycompany/view/jobs.dart';
import 'package:jobswaycompany/view/landingPage.dart';
import 'package:jobswaycompany/view/paymentPage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'addNewJob_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  static late Razorpay razorPay;
  Payment payment = Payment();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paymentSucessHandler);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, paymentErrorHandler);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);
    sharedPreference = await SharedPreferences.getInstance();

  }

  static var paymantMode;
  static var loginController = Get.put(LoginController());
  var companyDetails = loginController.datasFetching();
  static var addJobcontroller = Get.put(addnewJobController());
  static ApiServices apiServices = ApiServices();
  var sharedPreference;
  static var sharedOrderId;
  static var sharedCurrency;
  static var sharedAmount;
  var orderList;

  paymentSucessHandler(PaymentSuccessResponse response) async {
    var result = orderFetching();
    var jobDetails = addJobcontroller.datasFetchingforPlan();

    var data = {
      "response": {
        "razorpay_order_id": response.orderId,
        "razorpay_payment_id": response.paymentId,
        "razorpay_signature": response.signature
      },
      "order": {
        "data": {
          "id": result[0],
          "currency": result[1],
          "amount": result[2],
        }
      },
      "transactionDetails": {
        "id": companyDetails[7],
        "companyName": companyDetails[0],
        "amount": paymantMode=="Basic"?"349":"899",
        "jobId": jobDetails[1],
        "jobTitle": jobDetails[2],
        "planName": paymantMode,
        "paymentGateWay": "razorpay",
        "razorpay_payment_id": result[0],
        "razorpay_order_id": result[0]
      },
    };
    bool? apiResponse = await apiServices.afterRazorPay(data);

    Get.snackbar(
      "Your Payment is Successfull",
      "Going to DashBoard",
    );
    log("${response.paymentId}");
    log("payment Success");
    if (apiResponse == true) {
      Future.delayed(
          const Duration(
            seconds: 6,
          ), () {
        Get.to( Jobs());
      });
    }
  }

  paymentErrorHandler(PaymentFailureResponse response) {
    Get.snackbar(
      "Payment Failed",
      "Something went wrong , Please try again",
    );
  }

  externalWalletHandler(ExternalWalletResponse response) {
    Get.snackbar("External Wallet", "Something went wrong , Please try again");
  }

  static void openCheckOut({var rate, var orderId}) {
    var options = {
      "key": "rzp_test_UmiUcM6L6WCULU",
      "order_id": orderId,
      "amount": rate,
      "name": "sample",
      "description": "JOBSWAY Payment Portal",
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorPay.open(options);
    } catch (e) {
      Get.snackbar(
        "e",
        "$e",
      );
    }
  }

  static freePayment() async {
    // log("Here");
    var result = addJobcontroller.datasFetchingforPlan();
    log(result[0]);
    log("clicked");
    var data = {
      "jobId": result[1],
    };

    bool? response = await apiServices.freePlan(
      data,
      result[0],
    );
    if (response == true) {
      Get.snackbar(
        "Job Added Successfull",
        "Your Job will be shown shortly",
        duration: const Duration(seconds: 15),
        snackbarStatus: (status) {
          Get.to(
            () =>   Jobs(),
          );
        },
      );
    } else {
      Get.snackbar(
        "Job Adding Failed",
        "Please Try later",
      );
    }
  }

  static orderSaving({
    var orderId,
    var currency,
    var amount,
  }) async {
    final List<String> map = [
      sharedOrderId = orderId,
      sharedCurrency = currency,
      sharedAmount = amount.toString(),
    ];

    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setStringList("orderList", map);
  }

  List<String> orderFetching() {
    var result = sharedPreference.getStringList("orderList");
    log(result[2]);
    return result;
  }

  static paidPayment({var rate}) async {
    // log("Here");
    var result = addJobcontroller.datasFetchingforPlan();
    log(result[0]);
    log("clicked");
    var data = {
      "jobId": result[1],
    };

    PaymentResponse? response = await apiServices.premiumPlan(
      result[0],
      rate,
    );
    if (response != null) {
      orderSaving(
        amount: response.amount,
        orderId: response.id,
        currency: response.currency,
      );
      openCheckOut(rate: response.amount, orderId: response.id);
    } else {
      Get.snackbar(
        "Job Adding Failed",
        "Please Try later",
      );
    }
  }

  //widgets***********************************************
  static planCard({
    var plan,
    bool? basic,
    var rate,
    var jobShowDay,
    var jobCount,
    bool? free,
  }) {
    return GestureDetector(
      onTap: () async {
        if (free == true) {
          freePayment();
          paymantMode = "free";
        } else if (basic == true) {
          paidPayment(rate: "4.68");
          paymantMode = "Basic";
        } else {
          paidPayment(rate: "12.03");
          paymantMode = "premium";
        }
      },
      child: Container(
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                      "\₹ $rate",
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
      ),
    );
  }

  List<Widget> cards = [
    planCard(
      plan: "Basic",
      basic: true,
      rate: "349",
      free: false,
      jobCount: "Upto 10 job at a time.",
      jobShowDay: "15",
    ),
    planCard(
      plan: "Premium",
      basic: false,
      rate: "899",
      free: false,
      jobCount: "Post Unlimited Jobs.",
      jobShowDay: "20",
    ),
    planCard(
      plan: "Free",
      basic: false,
      rate: "0",
      free: true,
      jobCount: "1 job at a time..",
      jobShowDay: "3",
    ),
  ];
}
