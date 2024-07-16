// import 'dart:convert';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'api.dart';
//
// List bankUpdate = [];
//
// class bankMoneyUpdateApi extends GetxController {
//
//   Future getBankUpdate() async {
//     var shared_preferences = await SharedPreferences.getInstance();
//     var sellerid = shared_preferences.get("seller_id");
//     final response = await http.post(
//       Uri.parse(ApiConstants.baseUrl + 'getBank_information'),
//       body: {'venderId': sellerid.toString()},
//     );
//     print("hello" + bankUpdate.toString());
//     if (response.statusCode == 200) {
//       //  bankInformation.clear();
//       var decodedData = json.decode(response.body);
//       print("kjjjjkkik");
//
//       bankUpdate.add(decodedData['data']);
//       print("kjjjjkkik" + bankUpdate.toString());
//       return bankUpdate;
//     } else {
//       throw Exception('Failed to load bank information');
//     }
//   }
// }
