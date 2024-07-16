import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../ulits/constant.dart';

class driverterms extends GetxController {
  RxList termlist = [].obs;
  var loading = false.obs;
  RxList contactlist = [].obs;
  RxList needhleplist = [].obs;


  void loaderon() {
    loading.value = true;
  }

  Future termm() async {
    final response = await http.get(
      Uri.parse('${devilery_base_url}term_and_pulicy'),
    );
    termlist.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);

      termlist.add(decodedData);

      return termlist;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future needhlep() async {
    final response = await http.get(
      Uri.parse('${devilery_base_url}emergancyContact_list'),
    );
    needhleplist.clear();
    print("ghhg ${response.body}");
    var decodedData = json.decode(response.body);
    if (response.statusCode == 200) {
      needhleplist.add(decodedData);

      return needhleplist;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future contactus() async {
    final response = await http.get(
      Uri.parse('${devilery_base_url}contactus_list'),
    );
    contactlist.clear();
    print("ghhg ${response.body}");
    var decodedData = json.decode(response.body);
    if (response.statusCode == 200) {
      contactlist.add(decodedData);

      return contactlist;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }
}
