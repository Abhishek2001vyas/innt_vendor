import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';


class staff extends GetxController{
RxList stafflistt=[].obs;


  Future stafflist() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");

    stafflistt.clear();
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}staffList"),
          body: {"shopId": sellerid.toString()});

      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["data"].isNotEmpty) {
        stafflistt.add(resData);
        return stafflistt;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

}