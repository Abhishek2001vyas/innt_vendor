import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../ulits/constant.dart';

class Homepageapi extends GetxController {
  RxBool loading = false.obs;
  RxList homepagelist = [].obs;

  Future homepagefunction() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}driverHomePage'),
        body: {
          "driverId": driverid.toString(),
        },
      );

      print("kjjjjkkik" + response.body.toString());
      var decodedData = json.decode(response.body);
      homepagelist.clear();
      if (response.statusCode == 200 &&
          decodedData["result"].toString() == "true".toString()) {
        print("kjjjjkkik");
        homepagelist.add(decodedData);
        print("kjjjjkkik" + homepagelist.toString());

        return homepagelist;
      } else {
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error $e");
    }
  }
}
