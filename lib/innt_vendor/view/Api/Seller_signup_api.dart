import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../notification/fcm.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../auth_vendor/map_screen.dart';
import '../auth_vendor/seller_signup_otp.dart';

class Signupapi extends GetxController {
  RxBool isloading = false.obs;
  RxList Working_Day = [
    {
      "day_name": "Monday",
      "status": "false",
      "open_time": "00:00",
      "close_time": "00:00"
    },
    {
      "day_name": "Tuesday",
      "status": "false",
      "open_time": "00:00",
      "close_time": "00:00"
    },
    {
      "day_name": "Wednesday",
      "status": "false",
      "open_time": "00:00",
      "close_time": "00:00"
    },
    {
      "day_name": "Thursday",
      "status": "false",
      "open_time": "00:00",
      "close_time": "00:00"
    },
    {
      "day_name": "Friday",
      "status": "false",
      "open_time": "00:00",
      "close_time": "00:00"
    },
    {
      "day_name": "Saturday",
      "status": "false",
      "open_time": "00:00",
      "close_time": "00:00"
    },
    {
      "day_name": "Sunday",
      "status": "false",
      "open_time": "00:00",
      "close_time": "00:00"
    },
  ].obs;
  var inntoutcatid = [];
  var selectedBusinessItem = 'Enterprise';
  var selectedResItem = 'No';
  CountryCode _selectedCountry = CountryCode.fromCode('IN');
  File? coverImage;
  RxList Working_Day1 = [].obs;

  @override
  void onInit() {
    maincategory_list();

    // TODO: implement onInit
    super.onInit();
  }

  var address = "Address not found ".obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // TextEditingController shopNoController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  // TextEditingController buildingController = TextEditingController();
  TextEditingController residencyController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController businessDisController = TextEditingController();

  //second screen
  TextEditingController miniOrderController = TextEditingController();
  TextEditingController faltcon = TextEditingController();
  TextEditingController servicesvalble = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController frstoreNameController = TextEditingController();
  TextEditingController frstoredesController = TextEditingController();

  TextEditingController storeAddressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController =
      TextEditingController(text: "Select city");
  TextEditingController textEditingController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();

  //third screen
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  TextEditingController bankAccountNameController = TextEditingController();
  TextEditingController swiftController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  void loader() {
    isloading.value = true;
    update();
  }

  signupApi(vender_profile, upload_backsideId, upload_frontId, shop_logo,
      shop_licence) async {
    loader();
    print("ppp772 $Working_Day1 "
        "${lastNameController.text.toString()}"
        "${emailController.text.toString()}"
        "${mobileController.text.toString()}"
        "${residencyController.text.toString()}"
        "${residencyController.text.toString()}"
        "${lonnn}"
        "${lattt.toString()}"
        "${storeAddressController.text.toString()}"
        "${selectedBusinessItem.toString()}"
        "${storeNameController.text.toString()}"
        "${dobController.text.toString()}"
        "${firstNameController.text.toString()}");
    var ssss = selectedResItem.toString() == "No"
        ? inntoutcatid[0][0]["_id"].toString()
        : inntoutcatid[0][1]["_id"].toString();
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${Seller_base_url}venderSignup"));
      request.fields.addAll({
        "firstName": firstNameController.text.toString(),
        "lastName": lastNameController.text.toString(),
        "email": emailController.text.toString(),
        "mobile_number": mobileController.text.toString(),
        "dob": dobController.text.toString(),
        // "residenceyCity": residencyController.text.toString(),
        "typeOfbusiness": selectedBusinessItem.toString(),
        "shop_name": storeNameController.text.toString(),
        "frnz_shop_name": frstoreNameController.text.toString(),
        if (selectedBusinessItem == "Enterprise")
          "store_description": businessDisController.text.toString(),
        if (selectedBusinessItem == "Enterprise")
          "frnz_store_description": frstoredesController.text.toString(),
        "shop_address": storeAddressController.text.toString(),
        "country": _selectedCountry.toString(),
        "city": cityController.text.toString(),
        "latitude": lattt.toString(),
        "longitude": "$lonnn",
        "serviceType": ssss.toString(),
        "workHours": Working_Day1.toString(),
        "bank_name": bankNameController.text.toString(),
        "bankAccount_name": bankAccountNameController.text.toString(),
        "acc_number": bankAccountNumberController.text.toString(),
        "swift_code": swiftController.text.toString(),
        "mobile_money_number": mobileNumberController.text.toString(),
        "fcm_id": fCMToken.toString()
      });

      if (vender_profile != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "vender_profile",
          vender_profile.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp6");
      if (upload_frontId != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "upload_frontId",
          upload_frontId.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp5");
      if (shop_logo != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "shop_logo",
          shop_logo.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }

      print("ppp8");

      if (upload_backsideId != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "upload_backsideId",
          upload_backsideId.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }

      print("ppp7");
      if (shop_licence != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "shop_licence",
          shop_licence.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp1");
      http.StreamedResponse response1 = await request.send();
      var responseString = await response1.stream.bytesToString();
      var jsonResponse = json.decode(responseString.toString());
      print(response1.reasonPhrase);
      print("ppp$responseString");
      if (response1.statusCode == 200) {
        print("pooii");
        // var responseString = await response1.stream.bytesToString();

        if (jsonResponse['result'].toString() == "true".toString()) {
          Utils().sendMassage("Signup Successfully");
          isloading.value = false;
          update();
          Get.offAll(() => SellerSignUpOTP(
                otp: jsonResponse['data']["otp"],
                mobile: jsonResponse['data']["mobile_number"],
              ));
          log("signup" + responseString.toString());
        }
      } else {
        isloading.value = false;
        Utils().alertbox('${jsonResponse['message'].toString()}');
        print(response1.stream.toString());
      }
    } catch (e) {}
  }

  Future maincategory_list() async {
    print("hjkhgdukigchzxu");

    print("hhihkilh");
    inntoutcatid.clear();
    try {
      var res = await http.get(
        Uri.parse("${Seller_base_url}maincategory_list"),
      );
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        inntoutcatid.add(resData["data"]);

        print("${inntoutcatid[0][0]}");

        update();
        print(resData["data"].toString());
      } else {}
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }
}
