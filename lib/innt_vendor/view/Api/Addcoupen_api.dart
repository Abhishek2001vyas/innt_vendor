import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../models/CouponList.dart';
import '../models/categorymodel.dart';
import '../models/productlist.dart';
import '../screen/menu_screen/coupon/add_coupon.dart';
import '../screen/menu_screen/coupon/coupon_list.dart';

class Add_coupen extends GetxController {
  RxString? dropdownValueDiscount;

  RxList<Categorymodel> cate = <Categorymodel>[].obs;
  RxList<PromotionList> coupenlistt = <PromotionList>[].obs;
  RxBool checkselect = false.obs;
  RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  RxList<Productlist> productlisttt = <Productlist>[].obs;
  RxString cupon_type = "Select type".obs;
  RxString discountType = "Percentage % off".obs;
  RxString appliesCoupon = "".obs;
  RxString dropdownValueCoupon = "Categories".obs;
  RxList selectedOptions = [].obs;

  TextEditingController endDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController cupon_code = TextEditingController();
  TextEditingController cupon_title = TextEditingController();
  TextEditingController numberOfcoupon = TextEditingController();
  TextEditingController discountAmount = TextEditingController();
  TextEditingController sameUser_discountLimit = TextEditingController();

  Future<Categorymodel?> Categories() async {
    await productlistt();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    cate.clear();
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}venderCategory_list"), body: {
        "venderId": sellerid.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        cate.add(Categorymodel.fromJson(resData));
        // print("${addproduct.prodcolors.elementAt(0).data!.color!.toString()}");
        Get.to(() => AddCoupon());
      } else {}
    } catch (e) {}
    return null;
  }

  Future<RxList<Productlist>?> productlistt() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    productlisttt.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}productList"),
          body: {"venderId": sellerid.toString()});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        productlisttt.add(Productlist.fromJson(resData));
        update();

        print(resData["data"].toString());
        isloading.value = false;
        return productlisttt;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future Addcoupen(context) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}promotinAdd"), body: {
        "venderId": sellerid.toString(),
        "cupon_code": cupon_code.text.toString(),
        "cupon_type": cupon_type.toString(),
        "cupon_title": cupon_title.text.toString(),
        "numberOfcoupon": numberOfcoupon.text.toString(),
        "start_date": startDateController.text.toString(),
        "expire_date": endDateController.text.toString(),
        "discountType": discountType.toString(),
        "discountAmount": discountAmount.text.toString(),
        "appliesType": dropdownValueCoupon.toString(),
        "appliesCoupon": appliesCoupon.toString(),
        "sameUser_discountLimit": sameUser_discountLimit.text.toString(),
        "id": selectedOptions.join(",").toString()
      });
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage(resData['message'].toString());
        update();

        _showAddCouponPopup(context);
        Future.delayed(
          Duration(seconds: 5),
          () => Get.off(CouponList()),
        );
        print(resData["data"].toString());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  _showAddCouponPopup(BuildContext context) {
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
                Icon(
                  Icons.check,
                  color: Colors.grey.shade400,
                  size: 30,
                ),
                SizedBox(
                  height: h / 70,
                ),
                Center(
                  child: Text(
                    "Coupon created",
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

  Future<RxList<PromotionList>?> coupenlist() async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}promotinList"), body: {
        "venderId": sellerid.toString(),
      });
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        //   Utils().sendMassage(resData['message'].toString());
        update();
        coupenlistt.clear();
        coupenlistt.add(PromotionList.fromJson(resData));
        print(resData["data"].toString());
        isloading.value = false;
        return coupenlistt;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
        return null;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
    return null;
  }

  Future changePromotion_status(promotionId) async {
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}changePromotion_status"), body: {
        "promotionId": promotionId.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage(resData['message'].toString());
        await coupenlist();
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        return null;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
      return null;
    }
  }
}
