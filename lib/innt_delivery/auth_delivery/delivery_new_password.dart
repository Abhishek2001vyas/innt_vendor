import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/driver_login_api.dart';
import '../Controllers/button.dart';
import '../Controllers/constant.dart';
import '../Controllers/text2.dart';
import 'delivery_login.dart';

class DeliveryNewPassword extends StatefulWidget {
  final mobile;

  const DeliveryNewPassword({super.key, this.mobile});

  @override
  State<DeliveryNewPassword> createState() => _DeliveryNewPasswordState();
}

class _DeliveryNewPasswordState extends State<DeliveryNewPassword> {
  TextEditingController _otpController = TextEditingController();
  bool _isVerifyButtonEnabled = false;
  bool isloading = false;
  final passwordapi = Get.put(Devilery_login_api());
  final formKey = GlobalKey<FormState>();
  String otp = '';
  String otpResendValue = '';
  String mobiles = '';
  bool showCenter = false;

  bool? isChecked = false;

  final newpasswordddd = TextEditingController();
  final ccnewpasswordddd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Forgot password",
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            )),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / 18,
                ),
                Center(
                  child: Text(
                    "Create your new password",
                    style: Black_Text_Bold_Large,
                  ),
                ),
                SizedBox(
                  height: h / 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      const Text(
                        "Enter your new password",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Ember_Medium",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: w / 100,
                      ),
                      Icon(
                        Icons.star,
                        size: 6,
                        color: customColor,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                  child: TextFormField(
                    controller: newpasswordddd,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "please entre password upto 6 digit";
                      } else if (value.isEmpty) {
                        return "please entrer password";
                      } else {
                        return null;
                      }
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("Confirm your new password", style: TextStyle()),
                    SizedBox(
                      width: w / 100,
                    ),
                    Icon(
                      Icons.star,
                      size: 6,
                      color: customColor,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                  child: TextFormField(
                    controller: ccnewpasswordddd,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "please entre confirm password upto 6 digit";
                      } else if (value.isEmpty) {
                        return "please entre confirm password";
                      } else if (value != newpasswordddd.text) {
                        return "Password is not match to confirm password";
                      }
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Obx(() => passwordapi.isloading.value == true
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                        child: ElevatedButton(
                            style: buttonPrimary,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await passwordapi.resetpass(
                                  widget.mobile.toString(),
                                  newpasswordddd.text.toString(),
                                );
                                _showAnimatedPopup(context);
                                Get.offAll(DeliveryLogin());
                              }
                            },
                            child: const Text("Continue",
                                style: A_style_text_inside_button)),
                      )),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text(
                          "Back",
                          style: A_style_medium,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showAnimatedPopup(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final h = MediaQuery.of(context).size.height;
  showDialog(
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
              Text(
                "Your password has been changed",
                style: A_style_order,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: h / 70,
              ),
              Center(
                child: Text(
                  "successfully",
                  style: A_style_medium,
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
            ],
          )
        ],
      );
    },
  );
}
