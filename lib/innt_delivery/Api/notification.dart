import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ulits/constant.dart';
import '../../ulits/utils.dart';
import '../view/dashboard/dashboard_delivery.dart';
import '../view/screens/profile_details_delivery/modify_profile_otp.dart';

class drivernotifications extends GetxController {
  RxList drivenotification = [].obs;
  var loading = false.obs;

  void loaderon() {
    loading.value = true;
  }

  Future driverrnotification() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");

    final response = await http.post(
      Uri.parse('${devilery_base_url}notification_list'),
      body: {'driverId': driverid.toString()},
    );
    drivenotification.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);

      drivenotification.add(decodedData);

      return drivenotification;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }




}
