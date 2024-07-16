import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../../innt_vendor/view/auth_vendor/map_screen.dart';
import '../auth_delivery/delivery_signup_otp.dart';


class Signupapidevilery extends GetxController {
  RxBool isloading = false.obs;

  CountryCode _selectedCountry = CountryCode.fromCode('IN');
  File? coverImage;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController residencyController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cityController =
  TextEditingController(text: "Select city");
  void loader() {
    isloading.value = true;
    update();
  }

  signupApi({frontid, backid, vechileimage, registratinimage}) async {
    loader();

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse("${devilery_base_url}driverSignup"));
      request.fields.addAll({
        "fname": firstNameController.text.toString(),
        "lname": lastNameController.text.toString(),
        "email": emailController.text.toString(),
        "phone": mobileController.text.toString(),
        "dob": dobController.text.toString(),
        "city": residencyController.text.toString(),
        "fcm_id": "fcm_id".toString(),
        "longitude":lattt.toString(),
        "latitude":lonnn.toString()
      });

      if (frontid != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "frontId_iamge",
          frontid.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp6");
      if (backid != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "backId_iamge",
          backid.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }
      print("ppp5");
      if (vechileimage != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "vehical_iamge",
          vechileimage.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }

      print("ppp8");

      if (registratinimage != "") {
        request.files.add(await http.MultipartFile.fromPath(
          "document",
          registratinimage.toString(),
          contentType: MediaType(
            'image',
            'png',
          ),
        ));
      }

      print("ppp1");
      http.StreamedResponse response1 = await request.send();
      print("fffffasdf");
      var responseString = await response1.stream.bytesToString();
      print("fffffasdf666");
      var jsonResponse = json.decode(responseString.toString());
      print("fffffasdfttrrrt");
      print(response1.reasonPhrase);
      print("ppp$responseString");
      if (response1.statusCode == 200) {
        print("pooii");
        // var responseString = await response1.stream.bytesToString();

        if (jsonResponse['result'].toString() == "true".toString()) {
          Utils().sendMassage("Signup Successfully");
          isloading.value = false;
          update();
          Get.offAll(() => DeliverySignupOtp(
                otp: jsonResponse['data']["otp"],
                mobile: jsonResponse['data']["phone"],
              ));
          log("signup" + responseString.toString());
        }
      } else {
        print('oidfidsf');
        isloading.value = false;
        Utils().alertbox('${jsonResponse['message'].toString()}');
        print(response1.stream.toString());
      }
    } catch (e) {
      isloading.value = false;
      print("error $e");
    }
  }


}
