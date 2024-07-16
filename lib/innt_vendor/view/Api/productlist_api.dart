import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../innt_delivery/Controllers/constant.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
import '../models/Productdeatils.dart';
import '../models/productlist.dart';
import '../screen/menu_screen/aad_product_list.dart';
import '../screen/menu_screen/product_details.dart';

class productlist_api extends GetxController {
  RxBool isloading = false.obs;
  RxBool isloading1 = false.obs;

  RxList<Productlist> productlisttt = <Productlist>[].obs;
  RxList productdeatilslist = [].obs;
  RxList<Data1> productsearchlisttt = <Data1>[].obs;
  List lll = [];

  TextEditingController discountcontroller = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String? valueChooseDiscountType;

  void loader1() {
    isloading1.value = true;
    update();
  }

  void loader() {
    isloading.value = true;
    update();
  }

  Future<RxList<Productlist>?> productlistt() async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    productlisttt.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}productList"),
          body: {"venderId": sellerid.toString()});
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        productlisttt.add(Productlist.fromJson(resData));

        // Utils().sendMassage(resData['message'].toString());
        update();

        print(resData["data"].toString());
        isloading.value = false;
        return productlisttt;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  searchProducts(String searchTerm) {
    // Convert the search term to lowercase for case-insensitive search

    String searchTermLower = searchTerm.toLowerCase();
    productsearchlisttt.clear();

    for (var pproducts in productlisttt) {
      List<int> indices = [];
      for (int i = 0; i < pproducts.data!.length; i++) {
        if (pproducts.data![i].productName!
            .toLowerCase()
            .contains(searchTermLower)) {
          indices.add(i);
        }
      }
      if (indices.isNotEmpty) {
        indices.forEach((element) {
          productsearchlisttt
              .add(productlisttt.elementAt(0).data!.elementAt(element));
        });
      }
    }

    return productsearchlisttt;
  }

  Future<RxList?> productdeatils(productid) async {
    print("hjkhgdukigchzxuProductdeatils");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilhProductdeatils");
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}productDetails"),
          body: {
            "venderId": sellerid.toString(),
            "productId": productid.toString()
          });
      print('jhggdsvugdsfProductdeatils${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojojProductdeatils$resData");

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        productdeatilslist.clear();
        productdeatilslist.add(resData);
        //  productdeatilslist.add(Productdeatils.fromJson(resData));

        // Utils().sendMassage(resData['message'].toString());
        update();
        print("uiuighuhuihuiProductdeatils${productdeatilslist[0].toString()}");
        print(resData["data"].toString());
        isloading.value = false;
        Get.to(() => ProductDetails());
        return productdeatilslist;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future productactive(productid) async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilhProductdeatils");
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}productActive_statusChange"),
          body: {"productId": productid.toString()});
      print('jhggdsvugdsfProductdeatils${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojojProductdeatils$resData");

      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage(resData['message'].toString());
        productdeatils(productid);
        update();
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future productdelete(productId, context, prodname) async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    productlisttt.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}deleteProduct"),
          body: {
            "venderId": sellerid.toString(),
            "productId": productId.toString()
          });
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        _showAnimatedPopup(context, prodname);

        //Utils().sendMassage(resData['message'].toString());
        await Future.delayed(Duration(seconds: 10), () {
          Get.back();
          productlistt();
        });

        update();
        print(resData["data"].toString());
        isloading.value = false;
        return productlisttt;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  _showAnimatedPopup(BuildContext context, prodname) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40),
                Text(
                  "Delete $prodname",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),
                Image.asset(
                  "assets/images/successfully-unscreen.gif",
                  height: 100,
                  width: 100,
                  color: logocolo,
                ),
                SizedBox(height: 40),
                // Add any other widgets you want in the dialog
              ],
            ),
          ),
        );
      },
    );
  }

  Future productupdate(productId, context) async {
    print("hjkhgdukigchzxu");
    loader1();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    var discountarry = [
      {
        "discount_type": "$valueChooseDiscountType",
        "discount_value": "${discountcontroller.text.toString()}"
      }
    ];
    String jsonString = jsonEncode(discountarry);
    print("uiiuiuyhih${jsonString}");
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}productUpdate"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "venderId": sellerid.toString(),
            "productId": productId.toString(),
            "unit_price": priceController.text.toString(),
            "discount": discountarry,
          }));
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        updatePopup(
          context,
        );

        //Utils().sendMassage(resData['message'].toString());
        await Future.delayed(Duration(seconds: 10), () {
          Get.to(ProductList());
          //productlistt();
        });

        update();
        print(resData["data"].toString());
        isloading1.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading1.value = false;
      }
    } catch (e) {
      isloading1.value = false;
      print('tyhtrhftr${e}');
    }
  }

  updatePopup(
    BuildContext context,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 40),
                Text(
                  "Updated",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 40),
                Image.asset(
                  "assets/images/successfully-unscreen.gif",
                  height: 100,
                  width: 100,
                  color: logocolo,
                ),
                SizedBox(height: 40),
                // Add any other widgets you want in the dialog
              ],
            ),
          ),
        );
      },
    );
  }
}
