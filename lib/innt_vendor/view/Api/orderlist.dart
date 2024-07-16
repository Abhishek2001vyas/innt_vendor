import 'dart:convert';
import 'package:demo_innt/innt_vendor/view/screen/order/order_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../api_constant/get_vendorprofile_api.dart';
import '../models/orderList.dart';
import 'maincategory.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Seller_orderlist_api extends GetxController {
  RxBool isloading = false.obs;
  RxList<OrderList> orderlistt = <OrderList>[].obs;
  RxList orderdeatilsbyprod = [].obs;
  late RxString valueChoose = "".obs;
  late RxString valueChoosePayment = "".obs;

  void loader() {
    isloading.value = true;
    update();
  }

  Future<OrderList?> orderlist() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    orderlistt.clear();
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}orderList"), body: {
        "shopId": sellerid.toString(),
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pprrrfdggn$resData");
        orderlistt.add(OrderList.fromJson(resData));
        print("pp0");
        print("PPpP444fdfhgggf$orderlistt");
        print("gggffg" + resData.toString());
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        return null;
      }
    } catch (e) {
      print("hh" + e.toString());
    }
    return null;
  }

  Future orderdeatils(dynamic order_id, dynamic productId) async {
    orderdeatilsbyprod.clear();
    print("kjkjk");
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}orderDetails"),
          body: {
            "order_id": order_id.toString(),
            "productId": productId.toString()
          });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pprrr");
        orderdeatilsbyprod.add(resData);
        print("pp0");
        print("PPpP444$orderdeatilsbyprod");
        print("gggffg" + resData.toString());
        orderdeatilsbyprod[0]["data"]["payment_status"].toString() != "Unpaid"
            ? valueChoosePayment.value = "Paid"
            : valueChoosePayment.value = "Unpaid";
        orderdeatilsbyprod[0]["data"]["order_status"].toString() == "0"
            ? valueChoose.value = "Pending"
            : orderdeatilsbyprod[0]["data"]["order_status"].toString() == "2"
                ? valueChoose.value = "Confirmed"
                : orderdeatilsbyprod[0]["data"]["order_status"].toString() ==
                        "3"
                    ? valueChoose.value = "Packing"
                    : valueChoose.value = "Pending";

        update();
        Get.to(OrderDetails(
          orderid: order_id,
          productid: productId,
        ));
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print("hh" + e.toString());
    }
  }

  Future<RxList<OrderList>?> orderlistfilter(status) async {
    print(status);
    orderlistt.clear();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("kjkjk");
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}filterOrder_list"), body: {
        "shopId": sellerid,
        "status": status == 1
            ? "0"
            : status == 2
                ? "2"
                : status == 3
                    ? "3"
                    : status == 4
                        ? "4"
                        : status == 5
                            ? "6"
                            : status == 6
                                ? "5"
                                : status == 7
                                    ? "1"
                                    : "7"
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pprrr");
        orderlistt.add(OrderList.fromJson(resData));

        return orderlistt;
      } else {
        //Utils().sendMassage('${resData['message'].toString()}');
        return orderlistt;
      }
    } catch (e) {
      print("hh" + e.toString());
    }
  }

  Future orderstatusupdate({
    required dynamic order_id,
    required dynamic productId,
  }) async {
    print("kjkjk");
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}updateOrder_status"), body: {
        "orderId": order_id.toString(),
        "status": valueChoose.value.toString() == "Pending"
            ? "0"
            : valueChoose.value.toString() == "Confirmed"
                ? "2"
                : "3",
        "payment_status": valueChoosePayment.value.toString(),
        "productId": productId.toString()
      });
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['message'].toString()}');
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print("hh" + e.toString());
    }
  }
}
