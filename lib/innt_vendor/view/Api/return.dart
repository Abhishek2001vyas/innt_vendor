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

class Seller_retunorder_api extends GetxController {
  RxBool isloading = false.obs;
  RxList retunorderlist = [].obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }



  Future return_list(status) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    retunorderlist.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}retunorderlist"),
          body: {
        "vendorId": sellerid.toString(),
            "status":status


      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        retunorderlist.add(resData);
        print("pp0");
        print("PPpP$retunorderlist");
        print("Product Type" + resData.toString());

        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
  }


}
