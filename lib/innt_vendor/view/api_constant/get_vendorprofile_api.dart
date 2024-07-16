import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../screen/profile/my_profile.dart';
import '../screen/updatemobileverifty.dart';
import 'api.dart';

List vendorProfileList = [];

class fetchVendorProfile extends GetxController {
  var loading = false.obs;

  void loaderon() {
    loading.value = true;
  }

  Future vendorProfile() async {
    vendorProfileList.clear();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + 'getVenderProfile'),
      body: {'venderId': sellerid.toString()},
    );
    print("kjjjjkkik" + response.body.toString());
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      vendorProfileList.add(decodedData['data']);
      print("kjjjjkkik" + vendorProfileList.toString());
      print("Done vender profile");
      return vendorProfileList;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future vendorProimgupdate(vender_profile) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.baseUrl + 'Update_venderProfile'));
    request.fields.addAll({
      "venderId": sellerid.toString(),
    });

    request.files.add(await http.MultipartFile.fromPath(
      "vender_profile",
      vender_profile.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ));
    http.StreamedResponse response1 = await request.send();
    var responseString = await response1.stream.bytesToString();
    var jsonResponse = json.decode(responseString.toString());
    print("kjjjjkkik" + (response1.reasonPhrase.toString()));
    if (response1.statusCode == 200) {
      vendorProfile();
      // var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      //    vendorProfileList.add(decodedData['data']);
      // print("kjjjjkkik" + vendorProfileList.toString());
      //  return vendorProfileList;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future vendorProdate(first, last, upload_frontId, upload_backsideId) async {
    loaderon();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.baseUrl + 'updateseller'));
    request.fields.addAll({
      "venderId": sellerid.toString(),
      "firstName": first.toString(),
      "lastName": last.toString()
    });
    upload_frontId != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
            "upload_frontId",
            upload_frontId.toString(),
            contentType: MediaType(
              'image',
              'png',
            ),
          ))
        : null;
    upload_backsideId != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
            "upload_backsideId",
            upload_backsideId.toString(),
            contentType: MediaType(
              'image',
              'png',
            ),
          ))
        : null;
    http.StreamedResponse response1 = await request.send();
    var responseString = await response1.stream.bytesToString();
    var jsonResponse = json.decode(responseString.toString());
    print("kjjjjkkik" + (response1.reasonPhrase.toString()));
    if (response1.statusCode == 200) {
      await vendorProfile();
      // var decodedData = json.decode(response.body);
      loading.value = false;
      update();
      print("kjjjjkkik");

      Get.offAll(MyProfile());
    } else {
      loading.value = false;
      update();
      throw Exception('Failed to load vendor profile ${upload_backsideId}');
    }
  }

  Future vendorPromo(mobile) async {
    print("ppp");

    update();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}updateMobile"), body: {
        "venderId": sellerid.toString(),
        "mobile_number": mobile.toString(),
      });
      var resData = json.decode(res.body);
      print("OOOOOOO$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Get.to(SellerupdatemobileOTP(
          otp: resData["data"]["otp"],
          mobile: resData["data"]["newMobile_number"],
        ));
        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }

  Future vendorPromoverfiy(mobile, verify) async {
    print("ppp");
    loaderon();

    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}verifyPhone"), body: {
        "venderId": sellerid.toString(),
        "newMobile_number": mobile.toString(),
        "otp": verify.toString()
      });
      var resData = json.decode(res.body);
      print("OOOOOOO$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        await vendorProfile();
        loading.value = false;
        Utils().sendMassage("${resData['message'].toString()}");
        Get.offAll(MyProfile());
      } else {
        loading.value = false;
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return null;
  }
}
