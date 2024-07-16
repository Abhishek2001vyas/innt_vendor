import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../auth_delivery/delivery_login.dart';
import '../auth_delivery/delivery_signup_confirm_password.dart';

class Delivery_Verify_api extends GetxController {
  RxBool isloading = false.obs;
  var newotp = "".obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  verify(body) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    try {
      var res = await http.post(Uri.parse("${devilery_base_url}Verifyotp"),
          body: body);
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        shared_preferences.setString(
            "driverid", resData["data"]["_id"].toString());
        shared_preferences.setString("token", resData["token"].toString());
        Utils().sendMassage('${resData['message'].toString()}');
        update();
        print(resData["data"].toString());
        isloading.value = false;
        print("done");
        // forgot==null?
        Get.offAll(DeliverySignupConfirmPassword());
        //: Get.to(newpassword(mobile: forgot,));
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        //print(resData["msg"].toString());
        isloading.value = false;
      }
    } catch (e) {}
  }

  resend_otpmobile(mobile) async {
    var shared_preferences = await SharedPreferences.getInstance();
    // // var isLogedIn = shared_preferences.getString('user1_id');
    Map body = {"phone": mobile.toString(), "fcm_id": "1"};
    print("ppp");
    try {
      var res = await http.post(Uri.parse("${devilery_base_url}ResendOtp"),
          body: body);
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage('${resData['message'].toString()}');
        update();
        print(resData["data"].toString());
        var otp_set = shared_preferences.setString(
            'otp', resData["data"]["otp"].toString());
        // verify_otp_user.resentagain();
        print("resent" + resData["data"].toString());
        newotp.value = resData["data"]["otp"].toString();
        update();
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        //print(resData["msg"].toString());
      }
    } catch (e) {}
  }

  createpassword(pass, campass) async {
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");

    try {
      var res = await http
          .post(Uri.parse("${devilery_base_url}createPassword"), body: {
        "driverId": driverid.toString(),
        "password": pass.toString(),
        "confirm_password": campass.toString(),
      });
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "false".toString()) {
        Get.offAll(const DeliveryLogin());
        Utils().sendMassage(resData['message'].toString());

        update();
        print(resData["data"].toString());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('error $e');
      isloading.value = false;
    }
  }
}
