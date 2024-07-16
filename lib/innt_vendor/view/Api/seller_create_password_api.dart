import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../auth_vendor/seller_login.dart';

class Seller_password_api extends GetxController {
  RxBool isloading = false.obs;
  var newotp = "".obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  createpassword(pass, campass) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}createSeller_password"), body: {
        "sellerId": sellerid.toString(),
        "password": pass.toString(),
        "confirm_password": campass.toString(),
      });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "false".toString()) {
        Get.offAll(const SellerLogin());
        Utils().sendMassage(resData['message'].toString());

        update();
        print(resData["data"].toString());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {}
  }
}
