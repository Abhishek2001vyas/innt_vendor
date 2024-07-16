import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../models/productlist.dart';

class QR_api extends GetxController {
  RxBool isloading = false.obs;
  var selectedItem = "Store front".obs;
  RxList qrlist = [].obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  RxString product = "".obs;
  RxList<Productlist> productlist = <Productlist>[].obs;

  Seller_qr(qrcode_name, context) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}createQrcodes"), body: {
        "shopId": sellerid.toString(),
        "qrcode_name": qrcode_name.toString(),
        "type": selectedItem.toString(),
        if (selectedItem.value == 'Specific product')
          "productId": product.toString()
      });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print('ff');
        _showCreatePopup(context);
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

  _showCreatePopup(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
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
                Text("QR code successfully created !", style: A_style_medium),
                SizedBox(height: 40),
                Image.asset(
                  "assets/images/successfully-unscreen.gif",
                  height: 100,
                  width: 100,
                  color: logocolo,
                ),
                SizedBox(height: 40),
                // Add any other widgets you want in the dialog
              ],
            ),
          ),
        );
      },
    );
  }

  qrlistt() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}qrcodesList"), body: {
        "shopId": sellerid.toString(),
      });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      qrlist.clear();
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print('ff');
        qrlist.add(resData);
        // Utils().sendMassage(resData['message'].toString());

        update();
        print(resData["data"].toString());
        isloading.value = false;
        return qrlist;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }

  productlistforqr() async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    productlist.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}productList"),
          body: {"venderId": sellerid.toString()});
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        productlist.add(Productlist.fromJson(resData));
        product!.value = productlist[0].data!.elementAt(0).productId.toString();
        // Utils().sendMassage(resData['message'].toString());
        update();

        print(resData["data"].toString());
        isloading.value = false;
        return productlist;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }
}
