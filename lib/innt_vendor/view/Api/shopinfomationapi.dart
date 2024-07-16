import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:demo_innt/innt_vendor/view/screen/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../api_constant/api.dart';
import '../api_constant/get_vendorprofile_api.dart';
import '../models/shopinfor.dart';
import '../screen/menu_screen/my_shp.dart';
import '../screen/shops/mapshopupdateinfo.dart';

class Seller_shopinfo_api extends GetxController {
  final getprofilesller = Get.put(fetchVendorProfile());
  RxBool isloading = false.obs;
  RxList<Shopinfor> Shopinfolist = <Shopinfor>[].obs;


  RxList Working_Day = [].obs;

  // RxBool isloading = false.obs;

  void loader() {
    isloading.value = true;
    update();
  }

  late CountryCode? selectedCountry1 =
  CountryCode.fromDialCode('${vendorProfileList[0]['country']}');

  late var address = "${vendorProfileList[0]['city']}".obs;
  late TextEditingController storeNameController =
  TextEditingController(text: vendorProfileList[0]['shop_name']);
  late TextEditingController storeAddressController =
  TextEditingController(text: vendorProfileList[0]['shop_address']);
  late TextEditingController countryController =
  TextEditingController(text: vendorProfileList[0]['shop_name']);
  late TextEditingController cityController =
  TextEditingController(text: vendorProfileList[0]['city']);

  Future<RxList<Shopinfor>> shopinfo() async {
    Working_Day.clear();
    Shopinfolist.clear();
    await getprofilesller.vendorProfile();
    Working_Day.add(vendorProfileList[0]['workHours']);
    lattt2 = vendorProfileList[0]['location']["coordinates"][1];
    lonnn2 = vendorProfileList[0]['location']["coordinates"][0];

    // print('hdfhsdjkhf${Working_Day[0]}');
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}shopDetails"),
          body: {"venderId": sellerid.toString()});
      var resData = json.decode(res.body);
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        print("pp");

        Shopinfolist.add(Shopinfor.fromJson(resData));

        print("pp0");
        print("PPpP${Shopinfolist[0].data!.shopImage.toString()}");
        print(resData.toString());
        print('Done Shop information ${Shopinfolist[0].data!}');
        Get.to(() => MyShopScreen());

        // Utils().sendMassage(resData.toString());
      } else {
        // Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {}
    return Shopinfolist;
  }

  Future vendorshopinfoupdate(
      shop_logo, vender_profile, shop_licence, context) async {
    loader();
    print("$shop_logo  $vender_profile $shop_licence");
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    List modifiedList = Working_Day[0].map((item) {
      // Create a new map without the _id field
      return Map.from(item)..remove('_id');
    }).toList();
    final request = http.MultipartRequest(
        'POST', Uri.parse(ApiConstants.baseUrl + 'updateShop_information'));
    request.fields.addAll({
      "venderId": sellerid.toString(),
      "shop_name": storeNameController.text.toString(),
      "shop_address": storeAddressController.text.toString(),
      "country": selectedCountry1.toString(),
      "city": cityController.text.toString(),
      "latitude": lattt2.toString(),
      "longitude": lonnn2.toString(),
      "workHours": jsonEncode(modifiedList).toString()
    });
    print("ggg");
    shop_logo != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
      "shop_logo",
      shop_logo.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ))
        : null;
    vender_profile != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
      "vender_profile",
      vender_profile.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ))
        : null;
    shop_licence != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
      "shop_licence",
      shop_licence.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ))
        : null;

    http.StreamedResponse response1 = await request.send();
    var responseString = await response1.stream.bytesToString();
    var jsonResponse = json.decode(responseString.toString());
    print("kjjjjkkikll" + (response1.reasonPhrase.toString()));
    if (response1.statusCode == 200) {
      // var decodedData = json.decode(response.body);
      isloading.value = false;
      update();
      print("kjjjjkkik${responseString}");

      currentTab = 4;
      update();
      await _showAnimatedPopup(context);
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(DashboardScreenVendor());
      });
    } else {
      isloading.value = false;
      update();
      throw Exception('${jsonResponse} ');
    }
  }

  _showAnimatedPopup(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40),
                Text(
                  "Updated !",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
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

  Future minorderamount(amount)async{
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("jkgjhkljfb");
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}updateMinimum_orderAmount"),
          body: {
            "vendorId": sellerid.toString(),
            "amount":amount.toString()
          });
      var resData = json.decode(res.body);
      print("hhvhhhihb $resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() =="true") {
        Utils().sendMassage('${resData['message'].toString()}');
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future temporaryclose(start,end)async{
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("jkgjhkljfb");
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}updatedTemporaryClose_date"),
          body: {
            "vendorId": sellerid.toString(),
            "start_date":start.toString(),
            "end_date":end.toString()
          });
      var resData = json.decode(res.body);
      print("hhvhhhihb $resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() =="true") {
        Utils().sendMassage('${resData['message'].toString()}');
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future vacationclose(start,end)async{
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("jkgjhkljfb");
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}updatedTemporaryClose_date"),
          body: {
            "vendorId": sellerid.toString(),
            "start_date":start.toString(),
            "end_date":end.toString()
          });
      var resData = json.decode(res.body);
      print("hhvhhhihb $resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() =="true") {
        Utils().sendMassage('${resData['message'].toString()}');
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

}
