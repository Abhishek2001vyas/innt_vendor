import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../ulits/constant.dart';
import '../../ulits/utils.dart';


class earningdriver extends GetxController {
  RxBool loading = false.obs;
  RxList earninglist = [].obs;
  RxList earninglistfiter = [].obs;


  Future earninglists() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}earningStatement'),
        body: {
        "driverId":driverid.toString()
        },
      );

      var decodedData = json.decode(response.body);
      earninglist.clear();
      if (response.statusCode == 200) {
        earninglist.add(decodedData);

        return earninglist;
      } else {
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  Future earninglistsfiter(status) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}filter_earningStatement'),
        body: {
          "driverId":driverid.toString(),
          "status":status.toString()
        },
      );

      var decodedData = json.decode(response.body);
      earninglistfiter.clear();
      if (response.statusCode == 200) {
        earninglistfiter.add(decodedData);

        return earninglistfiter;
      } else {
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error $e");
    }
  }


}
