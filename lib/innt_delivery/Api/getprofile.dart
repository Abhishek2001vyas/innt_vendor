import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ulits/constant.dart';
import '../../ulits/utils.dart';
import '../view/dashboard/dashboard_delivery.dart';
import '../view/screens/profile_details_delivery/modify_profile_otp.dart';

class driverProfile extends GetxController {
  RxList driveprofilee = [].obs;
  var loading = false.obs;

  void loaderon() {
    loading.value = true;
  }

  Future driverrProfile() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");

    final response = await http.post(
      Uri.parse('${devilery_base_url}getDriverData'),
      body: {'driverId': driverid.toString()},
    );
    driveprofilee.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);

      driveprofilee.add(decodedData);

      return driveprofilee;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future activestatus() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    final response = await http.post(
      Uri.parse('${devilery_base_url}getDriverData'),
      body: {'driverId': driverid.toString()},
    );

    final response1 = await http.post(
      Uri.parse('${devilery_base_url}driverStatus'),
      body: {'driverId': driverid.toString()},
    );

    driveprofilee.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);

      driveprofilee.add(decodedData);

      return driveprofilee;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

 RxBool isloading= false.obs;
  Future updateprofiledriver(
      first,last,dob,mobile,email,city,fornt,back,vehicle,document) async {

    isloading.value = true;
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");

    final request = http.MultipartRequest(
        'POST', Uri.parse('${devilery_base_url}updateDriver_data'));
    request.fields.addAll({
      "driverId": driverid.toString(),
      "fname": first.toString(),
      "lname": last.toString(),
      "email": email.toString(),
      "phone": mobile.toString(),
      "dob": dob.toString(),
      "city": city.toString(),
    });
    fornt != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
      "frontId_iamge",
      fornt.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ))
        : null;
    back != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
      "backId_iamge",
      back.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ))
        : null;
    vehicle != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
      "vehical_iamge",
      vehicle.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ))
        : null;

    document != "0"
        ? request.files.add(await http.MultipartFile.fromPath(
      "document",
      document.toString(),
      contentType: MediaType(
        'image',
        'png',
      ),
    ))
        : null;
    http.StreamedResponse response1 = await request.send();
    var responseString = await response1.stream.bytesToString();
    var jsonResponse = json.decode(responseString.toString());
   if (response1.statusCode == 200) {
      // var decodedData = json.decode(response.body);

      update();
     isloading.value = false;



        Get.to(ModifyProfileOtp(
         dob: jsonResponse["data"]["dob"],
          email:jsonResponse["data"]["email"],
          fname: jsonResponse["data"]["fname"],
          frontId_iamge: jsonResponse["data"]["frontId_iamge"],
          lname: jsonResponse["data"]["lname"],
          vehical_iamge: jsonResponse["data"]["vehical_iamge"],
          backId_iamge: jsonResponse["data"]["backId_iamge"],
          city: jsonResponse["data"]["city"],
          document: jsonResponse["data"]["document"],
          mobile: mobile.toString(),otp: jsonResponse["data"]["otp"],));

    } else {
      isloading.value = false;
      update();
      throw Exception('${jsonResponse} ');
    }
  }

  verify(otp,first,last,email,mobile,dob,city,document,vehical_iamge,frontId_iamge,backId_iamge) async {

    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      var res = await http.post(Uri.parse("${devilery_base_url}verifyPhone"),
          body: {
        "otp":otp.toString(),
            "driverId":driverid.toString(),
            "fname": first.toString(),
            "lname": last.toString(),
            "email": email.toString(),
            "phone": mobile.toString(),
            "dob": dob.toString(),
            "city": city.toString(),
            "document":document.toString(),
            "vehical_iamge":vehical_iamge.toString(),
            "frontId_iamge":frontId_iamge.toString(),
            "backId_iamge":backId_iamge.toString()
          });
      var resData = json.decode(res.body);
     if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
       Utils().sendMassage('${resData['message'].toString()}');
        update();
        selectedIndex=4;
        isloading.value = false;

        // forgot==null?
        Get.offAll(DashboardDelivery());

      } else {

        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {  isloading.value = false;}
  }

}
