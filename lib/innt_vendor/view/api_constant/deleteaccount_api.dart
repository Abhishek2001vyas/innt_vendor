import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

List deleteAccount = [];

class deleteAccountApi extends GetxController {
  Future getDeleteAccount() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + 'venderAccount_delete'),
      body: {'venderId': sellerid.toString()},
    );
    print("kjjjjkkik ggggg" + deleteAccount.toString());
    if (response.statusCode == 200) {
      //  bankInformation.clear();
      var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      deleteAccount.add(decodedData['data']);
      print("kjjjjkkik" + deleteAccount.toString());
      return deleteAccount;
    } else {
      throw Exception('Failed to load bank information');
    }
  }
}
