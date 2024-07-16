import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../models/shopOrder_count.dart';

class homepageeList extends GetxController {
  RxList<ShopOrderCount> homelist1 = <ShopOrderCount>[].obs;
  RxList homelist2 = [].obs;
  RxList homelist3 = [].obs;
  RxList earninglist = [].obs;

  RxString selectedBusinessItem = "All".obs;
  RxString selectedItem = 'This week'.obs;

  Future<RxList<ShopOrderCount>> ShopOrderCountList() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(Seller_base_url + 'shopOrder_count'),
      body: {
        "shopId": sellerid.toString(),
        "status": selectedBusinessItem.value == "All"
            ? "1"
            : selectedBusinessItem.value == "Today"
                ? "2"
                : selectedBusinessItem.value == "This week"
                    ? "3"
                    : selectedBusinessItem.value == "This month"
                        ? "4"
                        : "5".toString()
      },
    );

    var decodedData = json.decode(response.body);
    //List privacypolicy = decodedData['data'];
    if (response.statusCode == 200) {
      homelist1.clear();

      homelist1.add(ShopOrderCount.fromJson(decodedData));

      print(homelist1);
      return homelist1;
    } else {
      throw Exception('Failed to load maincate category list');
    }
  }

  Future shopHigh_lightList() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(Seller_base_url + 'shopHigh_light'),
      body: {
        "shopId": sellerid.toString(),
      },
    );

    var decodedData = json.decode(response.body);

    if (response.statusCode == 200) {
      homelist2.clear();

      homelist2.add(decodedData);

      print(homelist2.elementAt(0)["data"]["like_count"]);
      return homelist2;
    } else {
      throw Exception('Failed to load maincate category list');
    }
  }

  Future topSale_productList() async {
    homelist3.clear();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(Seller_base_url + 'topSale_productList'),
      body: {
        "shopId": sellerid.toString(),
      },
    );

    var decodedData = json.decode(response.body);

    if (response.statusCode == 200) {
      homelist3.add(decodedData);

      print(homelist3.elementAt(0));
      return homelist3;
    } else {
      throw Exception('Failed to load maincate category list');
    }
  }

  Future earminggragh() async {
    earninglist.clear();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    final response = await http.post(
      Uri.parse(Seller_base_url + 'graphData'),
      body: {
        "vendorId": sellerid.toString(),
        "status": selectedItem == 'This week'
            ? "1"
            : selectedItem == 'This month'
                ? "3"
                : "2"
      },
    );

    var decodedData = json.decode(response.body);

    if (response.statusCode == 200) {
      earninglist.add(decodedData);

      print(earninglist.elementAt(0));
      return earninglist;
    } else {
      throw Exception('Failed to load maincate category list');
    }
  }
}
