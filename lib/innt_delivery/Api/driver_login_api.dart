import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../auth_delivery/delivery_forgot_otp.dart';
import '../auth_delivery/delivery_new_password.dart';
import '../view/dashboard/dashboard_delivery.dart';

class Devilery_login_api extends GetxController {
  RxBool isloading = false.obs;
  var newotp = "".obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Login(mobile, pass, context) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();

    try {
      var res =
          await http.post(Uri.parse("${devilery_base_url}driver_login"), body: {
        "key": mobile.toString(),
        "password": pass.toString(),
      });
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        shared_preferences.setString(
            "driverid", resData["data"]["_id"].toString());
        shared_preferences.setString("Session", "1");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "${resData["data"]["fname"].toString()}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Add any other widgets you want in the dialog
                  ],
                ),
              ),
            );
          },
        );
        //  Get.offAll(const HomeScreen());
        Utils().sendMassage(resData['message'].toString());
        update();
        Future.delayed(
          Duration(milliseconds: 250),
          () => Get.offAll(
            () => const DashboardDelivery(),
          ),
        );
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

  forgototppp(mobile) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();

    try {
      var res = await http
          .post(Uri.parse("${devilery_base_url}forgotPassword"), body: {
        "key": mobile.toString(),
      });
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //  Get.offAll(const HomeScreen());
        Utils().sendMassage(resData['message'].toString());
        update();
        Get.to(DeliveryForgotOtp(
          mobileno: resData['data']["phone"],
          otp: resData['data']["otp"],
        ));
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      isloading.value = false;
    }
  }

  forgotverify(body) async {
    loader();

    try {
      var res = await http.post(
          Uri.parse("${devilery_base_url}verifyEmail_andMobile"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['message'].toString()}');
        update();
        isloading.value = false;

        Get.to(DeliveryNewPassword(
          mobile: resData["data"]["phone"].toString(),
        ));
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

  resetpass(mobile, pass) async {
    isloading.value = true;

   try {
      var res = await http.post(Uri.parse("${devilery_base_url}resetPassword"),
          body: {"key": mobile, "password": pass});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['message'].toString()}');
        update();
        isloading.value = false;

        update();
      } else {
        isloading.value = false;
        Utils().sendMassage('${resData['message'].toString()}');
         }
    } catch (e) {
      isloading.value = false;
     }
  }
}
