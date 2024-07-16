import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../screen/bottom_navigationbar.dart';

class changeVendorpassword_api extends GetxController {
  RxBool isloading = false.obs;
  RxBool isloading1 = false.obs;

  void loader1() {
    isloading1.value = true;
    update();
  }

  void loader() {
    isloading.value = true;
    update();
  }

  Future changeVendor_password(oldpass, nepass, compass, context) async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}changeVendor_password"), body: {
        "venderId": sellerid.toString(),
        "password": oldpass.toString(),
        "newpassword": nepass.toString(),
        "confirm_password": compass.toString()
      });
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        _showAnimatedPopup(context);
        currentTab = 0;
        //Utils().sendMassage(resData['message'].toString());

        update();
        isloading.value = false;
        Future.delayed(
            Duration(seconds: 5), () => Get.offAll(DashboardScreenVendor()));
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  _showAnimatedPopup(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h / 40,
                ),
                Text(
                  "Your password has been changed",
                  style: A_style_order,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: h / 70,
                ),
                Center(
                  child: Text(
                    "successfully",
                    style: A_style_medium,
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
            )
          ],
        );
      },
    );
  }
}
