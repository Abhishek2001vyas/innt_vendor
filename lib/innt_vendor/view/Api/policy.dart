import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../ulits/constant.dart';

class Policy extends GetxController {
  RxList returnpoilcy = [].obs;
  RxList cancellpoilcy = [].obs;
  RxList aboutuss = [].obs;
  RxList refunds = [].obs;

  var loading = false.obs;

  void loaderon() {
    loading.value = true;
  }

  Future returnspolicy() async {
    final response = await http.get(
      Uri.parse('${Seller_base_url}returnPolicyList'),
    );
    print("kjjjjkkik" + response.body.toString());
    returnpoilcy.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      returnpoilcy.add(decodedData);
      print("kjjjjkkik" + returnpoilcy.toString());
      print("Done driver profile");
      return returnpoilcy;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future cancelpolicy() async {
    final response = await http.get(
      Uri.parse('${Seller_base_url}cancellationPolicyList'),
    );
    print("kjjjjkkik" + response.body.toString());
    cancellpoilcy.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      cancellpoilcy.add(decodedData);
      print("kjjjjkkik" + cancellpoilcy.toString());
      print("Done driver profile");
      return cancellpoilcy;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future aboutuspolicy() async {
    final response = await http.get(
      Uri.parse('${Seller_base_url}aboutUsList'),
    );
    print("kjjjjkkik" + response.body.toString());
    aboutuss.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      aboutuss.add(decodedData);
      print("kjjjjkkik" + aboutuss.toString());
      print("Done driver profile");
      return aboutuss;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }

  Future refundpolicy() async {
    final response = await http.get(
      Uri.parse('${Seller_base_url}refundPolicyList'),
    );
    print("kjjjjkkik" + response.body.toString());
    refunds.clear();
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print("kjjjjkkik");

      refunds.add(decodedData);
      print("kjjjjkkik" + refunds.toString());
      print("Done driver profile");
      return refunds;
    } else {
      throw Exception('Failed to load vendor profile');
    }
  }
}
