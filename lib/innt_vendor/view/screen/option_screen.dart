import 'package:demo_innt/innt_delivery/Controllers/controller.dart';
import 'package:demo_innt/innt_delivery/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/auth_delivery/delivery_login.dart';
import '../auth_vendor/seller_login.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  GetxControllers controller = Get.put(GetxControllers());
  var selectType = "-1";
  bool _isShowSellerCheck = false;
  bool _isShowDeliveryCheck = false;
  bool isloading = false;

  bool? isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 10,
              ),
              /*Center(
                    child: Image.asset(
                  "assets/images/innt-animation-unscreen.gif",
                  scale: 3,
                )),*/
              Center(
                child: Text(
                  "Welcome to innt office",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: "Ember_Display_Medium"),
                ),
              ),
              SizedBox(
                height: h / 15,
              ),
              Center(
                child: Text(
                  "Select your account",
                  style: TextStyle(
                      color: Colors.blue.shade700,
                      fontSize: 20,
                      fontFamily: "Ember_Display_Medium"),
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectType = "0";

                            });
                          },
                          child: Container(
                            height: h / 4.6,
                            width: w / 2.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: Colors.blue.shade700),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/seller_logo.png",
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                ),
                                Text(
                                  "Seller",
                                  style: TextStyle(
                                    color: Color(0xff020301),
                                    fontSize: 24,
                                    fontFamily: "Ember_Display_Medium",
                                  ),
                                ),
                                SizedBox(
                                  height: h / 80,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: selectType == "0"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectType = "0";
                                    // _isShowSellerCheck = false;
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  color: logocolo,
                                  size: 35,
                                ),
                              )
                            : Icon(
                                Icons.check_circle,
                                color: Colors.grey,
                                size: 35,
                              ), // Invisible if _isShowSellerCheck is false
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectType = "1";
                              // _isShowDeliveryCheck = !_isShowDeliveryCheck;
                              // _isShowSellerCheck = false;
                              // if (_isShowDeliveryCheck) {
                              /* showDialog(
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
                                        "Delivery",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      // Add any other widgets you want in the dialog
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isloading = false;
                              //Get.to(Verify_Login());
                              Get.to(SellerLogin());
                            });
                          });*/
                            });
                          },
                          child: Container(
                            height: h / 4.6,
                            width: w / 2.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: Colors.blue.shade700),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/delivery_logo.png",
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                ),
                                Text(
                                  "Delivery",
                                  style: TextStyle(
                                    color: Color(0xff020301),
                                    fontSize: 24,
                                    fontFamily: "Ember_Display_Medium",
                                  ),
                                ),
                                SizedBox(
                                  height: h / 80,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: selectType == "1"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectType = "1";
                                    _isShowDeliveryCheck = false;
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  size: 35,
                                  color: logocolo,
                                ),
                              )
                            : Icon(
                                Icons.check_circle,
                                color: Colors.grey,
                                size: 35,
                              ), // Invisible if _isShowDeliveryCheck is false
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h / 8,
              ),

              selectType == "0" || selectType == "1"
                  ? CustomButton(
                      title: "Continue",
                      onTap: () {
                        if (selectType == '0') {
                          Get.to(() => SellerLogin());
                        } else if (selectType == '1') {
                          // Get.to(() => DashboardDelivery());
                          Get.to(() => DeliveryLogin());
                        }
                      })
                  : Container(
                      height: 50,
                      width: Get.width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Ember_Display_Medium'),
                        ),
                      ),
                    ),


            ],
          ),
        ));
  }
}
