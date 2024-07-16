import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';
//import '../models/productdeatils.dart';
import '../models/productReviewss.dart';
import '../models/reviewsDetailss.dart';
import '../screen/menu_screen/reviews/review.dart';
import '../screen/menu_screen/reviews/reviews_details.dart';

class reviewlist_api extends GetxController {
  RxBool isloading = false.obs;
  RxBool isloading1 = false.obs;

  RxList<ProductReviewss> reviewproductlisttt = <ProductReviewss>[].obs;
  RxList<ReviewsDetailss> reviewsDetailslisttt = <ReviewsDetailss>[].obs;
  RxList singleReview_detail = [].obs;
  RxList<Data33> reviewproductsearchlisttt=<Data33>[].obs;
  void loader1() {
    isloading1.value = true;
    update();
  }

  void loader() {
    isloading.value = true;
    update();
  }
   filterByRating( int rating) {
     reviewproductsearchlisttt.value= reviewproductlisttt.elementAt(0).data!.where((product) => product.rating == rating).toList();
     Get.to(() => ReviewScreen());
  }
  searchProducts(String searchTerm) {
    // Convert the search term to lowercase for case-insensitive search

    String searchTermLower = searchTerm.toLowerCase();
    reviewproductsearchlisttt.clear();

    for (var pproducts in reviewproductlisttt) {
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
          reviewproductsearchlisttt
              .add(reviewproductlisttt.elementAt(0).data!.elementAt(element));
        });
      }
    }

    return reviewproductsearchlisttt;
  }

  Future<RxList<ProductReviewss>?> reviewproduct() async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    reviewproductlisttt.clear();
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}productReviews_list"),
          body: {"venderId": sellerid.toString()});
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        reviewproductlisttt.add(ProductReviewss.fromJson(resData));

        // Utils().sendMassage(resData['message'].toString());
        update();

        print(resData["data"].toString());
        isloading.value = false;
        return reviewproductlisttt;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future<RxList<ReviewsDetailss>?> reviewsDetails_api(productid) async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    reviewsDetailslisttt.clear();
    try {
      var res = await http.post(Uri.parse("${Seller_base_url}ReviewsDetails"),
          body: {"productId": productid.toString()});
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        reviewsDetailslisttt.add(ReviewsDetailss.fromJson(resData));

        // Utils().sendMassage(resData['message'].toString());
        update();

        print(resData["data"].toString());
        isloading.value = false;
        Get.to(() => ReviewsDetails());
        return reviewsDetailslisttt;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future reviewsreport_api(ratingId, text) async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    reviewsDetailslisttt.clear();
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}reviewReport"), body: {
        "ratingId": ratingId.toString(),
        "shopId": sellerid.toString(),
        "message": text.toString(),
      });
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        Utils().sendMassage(resData['message'].toString());
        print(resData["data"].toString());
        isloading.value = false;
        Get.to(() => ReviewScreen());
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future singleReview_detail_api(ratingId) async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    singleReview_detail.clear();
    try {
      var res = await http
          .post(Uri.parse("${Seller_base_url}singleReview_detail"), body: {
        "ratingId": ratingId.toString(),
      });
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        singleReview_detail.add(resData["data"]);
        //Utils().sendMassage(resData['message'].toString());
        print(resData["data"].toString());
        isloading.value = false;
        return singleReview_detail;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

  Future reviewReplay_api(ratingId, text) async {
    print("hjkhgdukigchzxu");
    loader();
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    print("hhihkilh");
    reviewsDetailslisttt.clear();
    try {
      var res =
          await http.post(Uri.parse("${Seller_base_url}reviewReplay"), body: {
        "ratingId": ratingId.toString(),
        "shopId": sellerid.toString(),
        "message": text.toString(),
      });
      print('jhggdsvugdsf${res.reasonPhrase}');
      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["result"].toString() == "true".toString()) {
        await singleReview_detail_api(ratingId);
        Utils().sendMassage(resData['message'].toString());
        print(resData["data"].toString());
        isloading.value = false;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
        isloading.value = false;
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }
}
