import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/button.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/passwordchangeseller.dart';
import '../../auth_vendor/forget_password.dart';

var one;

class ChangedPassword extends StatefulWidget {
  //final String otp;

  //Verify({required this.otp, required id});

  @override
  State<ChangedPassword> createState() => _ChangedPasswordState();
}

class _ChangedPasswordState extends State<ChangedPassword> {
  final changepass = Get.put(changeVendorpassword_api());

  final formKey = GlobalKey<FormState>();
  final oldpasswordddd = TextEditingController();
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
          "Change password",
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 60,
              ),
              const Text(
                "Enter current password",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
                controller: oldpasswordddd,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please entre current password";
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
              SizedBox(
                height: h / 40,
              ),
              Text("Enter new password", style: TextStyle()),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
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
              SizedBox(
                height: h / 40,
              ),
              Text("Re-enter new password", style: TextStyle()),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
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
              Obx(() => changepass.isloading.value == true
                  ? Center(
                      child: CircularProgressIndicator(color: logocolo),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                      child: ElevatedButton(
                          style: buttonPrimary,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              changepass.changeVendor_password(
                                  oldpasswordddd.text.toString(),
                                  newpasswordddd.text.toString(),
                                  ccnewpasswordddd.text.toString(),
                                  context);
                            }
                          },
                          child: const Text("Done",
                              style: A_style_text_inside_button)),
                    )),
              InkWell(
                  onTap: () {
                    Get.to(Forgot_Password());
                  },
                  child: Center(
                      child: Text("Forgot password?",
                          style: A_style_text_button))),
            ],
          ),
        ),
      ),
    );
  }
}
