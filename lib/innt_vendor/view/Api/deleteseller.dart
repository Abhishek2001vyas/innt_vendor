import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../auth_vendor/seller_login.dart';
import '../screen/option_screen.dart';

class Seller_delete_api extends GetxController {
  RxBool isloading = false.obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Seller_delete(reason, text, context) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}deleteVendor"), body: {
        "venderId": sellerid.toString(),
        "reason": reason.toString(),
        "text": text.toString(),
      });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        await _accountDeletePopup(context);
        Future.delayed(Duration(seconds: 5), () {
          Get.offAll( SellerLogin());
          shared_preferences.remove("seller_id");
        });

        // Utils().sendMassage(resData['message'].toString());

        update();
        print(resData["data"].toString());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

  _accountDeletePopup(BuildContext context) {
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
                  "Your account has been deleted",
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
                    "We hope to see you soon!",
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
