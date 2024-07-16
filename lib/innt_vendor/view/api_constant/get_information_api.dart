import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../ulits/constant.dart';
import 'api.dart';

List bankInformation = [];

class fetchBankInfoList extends GetxController {
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Future getBankInfoList() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(Seller_base_url + 'getBank_information'),
      body: {'venderId': sellerid.toString()},
    );
    print("kjjjjkkik" + bankInformation.toString());
    if (response.statusCode == 200) {
      bankInformation.clear();
      var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      bankInformation.add(decodedData['data']);
      print("kjjjjkkik" + bankInformation.toString());
      return bankInformation;
    } else {
      throw Exception('Failed to load bank information');
    }
  }

  Future bankinfoupdate(context, mobile_money_number, bank_name, acc_number,
      bankAccount_name, swift_code) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + 'update_BankInformation'),
      body: {
        'venderId': sellerid.toString(),
        "swift_code": swift_code.toString(),
        "bankAccount_name": bankAccount_name.toString(),
        "acc_number": acc_number.toString(),
        'bank_name': bank_name.toString(),
        "mobile_money_number": mobile_money_number.toString()
      },
    );

    if (response.statusCode == 200) {
      //  bankInformation.clear();
      var decodedData = json.decode(response.body);
      _bankMobileMoneyPopup(context);
      await Future.delayed(Duration(seconds: 5), () {
        getBankInfoList();
        Get.back();
        Get.back();
        // Get.off(BankDetails());

        isloading.value = false;
        update();
        //Get.until((route) =>route.settings ==const BankDetails());
      });

      // Utils().sendMassage('${decodedData['message'].toString()}');
    } else {
      isloading.value = false;
      update();
      throw Exception('Failed to load bank information');
    }
  }

  _bankMobileMoneyPopup(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    showDialog(
      barrierDismissible: false,
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
                  "Your bank and mobile money",
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
                    "Information has been updated!",
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
