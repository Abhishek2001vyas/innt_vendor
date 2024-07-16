import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ulits/constant.dart';
import '../../ulits/utils.dart';
import '../Controllers/constant.dart';
import '../Controllers/text2.dart';
import '../view/dashboard/dashboard_delivery.dart';
import '../view/screens/pending_delivery_map_screen.dart';

class orderapi extends GetxController {
  RxBool loading = false.obs;
  RxList orderlist = [].obs;
  RxList orderlistfiter = [].obs;
  RxList acceptdeatilss = [].obs;

  Future Orderlists() async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}get_order_list'),
        body: {
          "driverId":driverid.toString(),
          "latitude": position.latitude.toString(),
          "longitude": position.longitude.toString()
        },
      );

      var decodedData = json.decode(response.body);

      if (response.statusCode == 200 && decodedData["result"].toString()=='true'.toString()) {
        print("hhjjkklkl $decodedData ");
        orderlist.clear();
        orderlist.add(decodedData);

        return orderlist;
      } else {
        orderlist.clear();
        print("hhjjkklkl $decodedData ");
        orderlist.add(decodedData);
        //throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  Future acceptorreject(orderid, status,) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}assingedDriver'),
        body: {
          "driverId": driverid.toString(),
          "orderId": orderid.toString(),
          "status": status.toString()
        },
      );

      var decodedData = json.decode(response.body);
      if (response.statusCode == 200) {
        Utils().sendMassage("${decodedData["message"]}");
      } else {
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  Future ordercancel(orderid, message) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}orderCancel_byDriver'),
        body: {
          "driverId": driverid.toString(),
          "orderId": orderid.toString(),
          "message": message.toString()
        },
      );

      var decodedData = json.decode(response.body);
      if (response.statusCode == 200) {

        //Utils().sendMassage("${decodedData["message"]}");
      } else {
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  Future orderfilter(status) async {
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");

    print('gggkkdh  ${driverid}  ${status}');
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}filterOrder_list'),
        body: {
          "driverId": driverid.toString(),
          "status": status == 1
              ? "1"
              : status == 2
                  ? "3"
                  : status == 3
                      ? "4"
                      : status == 4
                          ? "5"
                          : "0".toString()
        },
      );

      print("kjjjjkkik" + response.body.toString());
      var decodedData = json.decode(response.body);
      orderlistfiter.clear();
      if (response.statusCode == 200 &&
          decodedData["result"].toString() == "true") {
        print("kjjjjkkik5666");
        orderlistfiter.add(decodedData);
        print("hhfihsdogigbddn ${orderlistfiter}");

        //   Utils().sendMassage("${decodedData["message"]}");
      } else {
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Errorfff $e");
    }
  }

  Future acceptdeatils(
    orderid,
  ) async {
    print("jlkjodfjoijfd");
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    print("djfoijoigjogf ${orderid}");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}acceptOrder_details'),
        body: {
          "driverId": driverid.toString(),
          "orderId": orderid.toString(),
        },
      );

      print("kjjjjkkikggdfdf" + response.body.toString());
      var decodedData = json.decode(response.body);
      acceptdeatilss.clear();
      if (response.statusCode == 200 &&
          decodedData["result"].toString() == "true") {
        print("kjjjjkkikoiuogiujoifdjuhg ${decodedData}");

        acceptdeatilss.add(decodedData);

        print("dfsfdsgf  ${acceptdeatilss[0]["data"]}");
        //  Utils().sendMassage("${decodedData["message"]}");
        return acceptdeatilss;
      } else {
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error55343543 $e");
    }
  }

  Future acceptpickup(
    orderid,
  ) async {
    print("jlkjodfjoijfd");
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    print("djfoijoigjogffffs ${driverid} ${orderid}");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}orderPicked_up'),
        body: {
          "driverId": driverid.toString(),
          "orderId": orderid.toString(),
        },
      );
      var decodedData = json.decode(response.body);
      // acceptdeatilss.clear();
      if (response.statusCode == 200 &&
          decodedData["result"].toString() == "true") {
        print("kjjjjkkikoiuogiujoifdjuhg ${decodedData}");
        Utils().sendMassage("${decodedData["message"]}");
        Get.off(PendingDeliveryMapScreen(
          ordeid: orderid,
        ));
      } else {
        Utils().sendMassage("${decodedData["message"]}");
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error55343543 $e");
    }
  }

  Future deliverotp(orderid, no, context, h, w) async {
    print("jlkjodfjoijfd");
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    print("djfoijoigjogffffs ${driverid} ${orderid}");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}generateCustomer_otp'),
        body: {
          "user_mobile_no": no.toString(),
          "orderId": orderid.toString(),
        },
      );
      var decodedData = json.decode(response.body);

      if (response.statusCode == 200 &&
          decodedData["result"].toString() == "true") {
        print("kjjjjkkikoiuogiujoifdjuhghhh ${decodedData}");
        Utils().sendMassage("${decodedData["message"]}");

        _showpinfilled(
            context, h, w, decodedData["data"]["customer_otp"], orderid);
      } else {
        Utils().sendMassage("${decodedData["message"]}");
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error55343543 $e");
    }
  }

  Future deliververify(orderid, otp, context, h, w) async {
    print("jlkjodfjoijfd");
    var shared_preferences = await SharedPreferences.getInstance();
    var driverid = shared_preferences.get("driverid");
    print("djfoijoigjogffffs ${driverid} ${orderid}");
    try {
      final response = await http.post(
        Uri.parse('${devilery_base_url}verifiedDelivery'),
        body: {
          "driverId": driverid.toString(),
          "orderId": orderid.toString(),
          "otp": otp.toString()
        },
      );
      var decodedData = json.decode(response.body);

      if (response.statusCode == 200 &&
          decodedData["result"].toString() == "true") {
        print("kjjjjkkikoiuogiujoifdjuhg ${decodedData}");
        Utils().sendMassage("${decodedData["message"]}");
        _showAnimatedPopup(
          context,
        );
        Future.delayed(
          Duration(
            seconds: 10,
          ),
          () {
            selectedIndex = 0;
            Get.off(DashboardDelivery());
          },
        );
      } else {
        Utils().sendMassage("${decodedData["message"]}");
        throw Exception('Failed to load vendor profile');
      }
    } catch (e) {
      print("Error55343543 $e");
    }
  }

  _showpinfilled(context, h, w, otp, orderid) {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Enter the delivery code sent to the customer \n ${otp}",
            style: A_style_medium,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: h / 14.8,
            width: w / 1.3,
            child: Pinput(
                controller: _otpController,
                onChanged: (value) {},
                //controller: off,
                separatorBuilder: (index) => const SizedBox(width: 22),
                length: 4,
                defaultPinTheme: defaultPinTheme,
                showCursor: true,
                onCompleted: (pin) {}),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                onTap: () {
                  deliververify(orderid, _otpController.text, context, h, w);
                  //   _showAnimatedPopup(context);
                },
                child: Container(
                  width: w,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade900,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text("Order delivered",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ember")),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  TextEditingController _otpController = TextEditingController();
  String otp = '';
  final defaultPinTheme = PinTheme(
    margin: EdgeInsets.only(right: 2),
    width: 65,
    height: 65,
    textStyle: TextStyle(
        fontSize: 20, color: Color(0xff1455ac), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade200, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  _showAnimatedPopup(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white,
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h / 40,
                ),
                Center(
                  child: Text(
                    "Order successfully delivered",
                    style: A_style_medium,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                Image.asset(
                  "assets/images/successfully-unscreen.gif",
                  height: 100,
                  width: 100,
                  color: logocolo,
                ),
                SizedBox(
                  height: h / 40,
                ),

                // OrderRating(),
              ],
            )
          ],
        );
      },
    );
  }
}
