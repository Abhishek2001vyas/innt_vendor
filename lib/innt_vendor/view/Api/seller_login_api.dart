import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../screen/bottom_navigationbar.dart';


class Seller_login_api extends GetxController {
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
      var res = await http
          .post(Uri.parse("${Seller_base_url}venderLogin_withEmail"), body: {
        "key": mobile.toString(),
        "password": pass.toString(),
      });
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        shared_preferences.setString(
            "seller_id", resData["data"]["_id"].toString());
        shared_preferences.setString("Session", "0");
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
                      "${resData["data"]["firstName"].toString()}",
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
            () => const DashboardScreenVendor(),
          ),
        );
        print(resData["data"].toString());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
