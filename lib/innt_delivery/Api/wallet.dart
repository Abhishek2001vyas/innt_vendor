import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../Controllers/constant.dart';
import '../Controllers/text2.dart';
import '../view/dashboard/dashboard_delivery.dart';
import '../view/screens/withdrawal_request_otp.dart';

class Delivery_wallet_api extends GetxController {
  RxBool isloading = false.obs;
  var newotp = "".obs;
  RxList wallethistroy = [].obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Future withdrawalrequest(amount, mobile) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      var res = await http
          .post(Uri.parse("${devilery_base_url}driverWithdraw_request"), body: {
        "amount": amount.toString(),
        "mobile_money_number": mobile.toString(),
        "driverId": driverid.toString()
      });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['message'].toString()}');

        Get.to(WithdrawalRequestOtp(
          otp: resData["data"]["otp"],
          mobile: mobile,
          amount: amount,
        ));
      } else {
        Utils().sendMassage('${resData['message'].toString()}');

        isloading.value = false;
      }
    } catch (e) {}
  }

  Future withdrawalrequestverify(amount, mobile, otp, context) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      var res = await http.post(
          Uri.parse("${devilery_base_url}verifiedWithdrawRequest"),
          body: {
            "amount": amount.toString(),
            "mobile_money_number": mobile.toString(),
            'otp': otp.toString(),
            "driverId": driverid.toString()
          });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['message'].toString()}');
        _showAnimatedPopup(context);
        Future.delayed(
          Duration(
            seconds: 10,
          ),
          () {
            selectedIndex = 0;
            Get.off(DashboardDelivery());
          },
        );
      } else {
        print("fgfg ${resData}");
        Utils().sendMassage('${resData['message'].toString()}');

        isloading.value = false;
      }
    } catch (e) {
      print("fgfg $e");
    }
  }

  Future transactionhistroy() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      var res = await http.post(
          Uri.parse("${devilery_base_url}withdrawTranjection_history"),
          body: {"driverId": driverid.toString()});
      var resData = json.decode(res.body);
      print("qqqq$resData");
      wallethistroy.clear();
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        // Utils().sendMassage('${resData['message'].toString()}');

        wallethistroy.add(resData);
      } else {
        Utils().sendMassage('${resData['message'].toString()}');

        isloading.value = false;
      }
    } catch (e) {}
  }

  _showAnimatedPopup(
    context,
  ) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h / 40,
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  Center(
                    child: Text(
                      " Your withdrawal request has been\nsubmitted",
                      style: A_style_medium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: h / 40,
                  ),
                  Image.asset(
                    "assets/images/successfully-unscreen.gif",
                    height: 100,
                    width: 100,
                    color: logocolo,
                  ),
                  SizedBox(
                    height: h / 40,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
