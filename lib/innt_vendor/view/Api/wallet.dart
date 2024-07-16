import 'dart:convert';
import 'package:demo_innt/innt_vendor/view/screen/bottom_navigationbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../ulits/constant.dart';
import '../../../ulits/utils.dart';



class Walletvender extends GetxController{

  RxList walletbalancelist =[].obs;
  RxList wallethistroylist =[].obs;

  Future Wallethistroy()async{
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    wallethistroylist.clear();
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}vendorWithdraw_requestList"),
          body: {"vendorId": sellerid.toString()});

      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["data"].isNotEmpty) {
        wallethistroylist.add(resData);
        return wallethistroylist;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }


  Future Walletbalance()async{
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    walletbalancelist.clear();
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}withdrawable_blance"),
          body: {"vendorId": sellerid.toString()});

      var resData = json.decode(res.body);
      print("pjojojoj$resData");
      if (res.statusCode == 200 &&
          resData["data"].isNotEmpty) {
        walletbalancelist.add(resData);
        return walletbalancelist;
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }


  Future withdrawrequest(amount)async{
    var shared_preferences = await SharedPreferences.getInstance();
    var sellerid = shared_preferences.get("seller_id");
    walletbalancelist.clear();
    try {
      var res = await http.post(
          Uri.parse("${Seller_base_url}withdrawRequest"),
          body: {
            "venderId": sellerid.toString(),
            "amount":amount.toString()
          });
      var resData = json.decode(res.body);

      if (res.statusCode == 200 &&
          resData["data"].isNotEmpty) {
        Utils().sendMassage('${resData['message'].toString()}');
        currentTab=0;
        Get.off(DashboardScreenVendor());
      } else {
        Utils().sendMassage('${resData['message'].toString()}');
      }
    } catch (e) {
      print('tyhtrhftr${e}');
    }
  }

}