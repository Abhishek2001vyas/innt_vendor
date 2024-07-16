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

class Seller_offer_api extends GetxController {
  RxBool isloading = false.obs;
  RxList offerlist = [].obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Seller_offer(context, select_directly, productId, offerType, end_date,
      limitPeruser, start_date) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("jj $select_directly $productId");
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}addOffer"), body: {
        "vendorId": sellerid.toString(),
        "select_directly": select_directly.toString(),
        "productId": productId == null
            ? "65f157bae3f45f7f69acf44d"
            : productId.toString(),
        "end_date": end_date.toString(),
        "start_date": start_date.toString(),
        "limitPeruser": limitPeruser.toString(),
        "offerType": offerType.toString()
      });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        _showAddOfferPopup(context);

        currentTab = 0;
        Future.delayed(Duration(seconds: 5), () {
          Get.off(DashboardScreenVendor());
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

  _showAddOfferPopup(BuildContext context) {
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
                Center(
                  child: Text(
                    "Your offer has been submitted",
                    style: A_style_order,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: h / 70,
                ),
                Center(
                  child: Text(
                    "and is waiting for approval!",
                    style: A_style_order,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: h / 70,
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

  Future offer_list() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    offerlist.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}offerList"),
          body: {"vendorId": sellerid.toString()});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        offerlist.add(resData);
        print("pp0");
        print("PPpP$offerlist");
        print("Product Type" + resData.toString());

        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
  }

  Future offer_delete(offerId) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var res = await http.post(Uri.parse("${Seller_base_url}deleteOffer"),
          body: {"offerId": offerId.toString()});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("Product Type" + resData.toString());

        Utils().sendMassage("${resData['message'].toString()}");
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
  }

  Future offer_status(offerId) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var res = await http.post(Uri.parse("${Seller_base_url}offer_on_off"),
          body: {"offerId": offerId.toString()});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("Product Type" + resData.toString());

        Utils().sendMassage("${resData['message'].toString()}");
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
  }
}
