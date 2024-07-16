import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../auth_vendor/signup_confirm_password.dart';

class Seller_Verify_api extends GetxController {
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
      var res = await http.post(Uri.parse("${Seller_base_url}venderVerifyOtp"),
          body: body);
      var resData = json.decode(res.body);
      print("qqqq$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        shared_preferences.setString(
            "seller_id", resData["data"]["_id"].toString());
        shared_preferences.setString("token", resData["token"].toString());
        Utils().sendMassage('${resData['message'].toString()}');
        update();
        print(resData["data"].toString());
        isloading.value = false;
        print("done");
        // forgot==null?
        Get.offAll(SignUpConfirmPassword());
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
    Map body = {"mobile_number": mobile.toString(), "choose_status": "1"};
    print("ppp");
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}resendOtp"), body: body);
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
}
