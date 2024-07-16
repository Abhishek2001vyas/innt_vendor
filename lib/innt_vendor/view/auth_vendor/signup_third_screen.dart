import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../../../innt_delivery/base/custom_button.dart';
import '../Api/Seller_signup_api.dart';

class SignUpThirdScreen extends StatefulWidget {
  final frontid;
  final backid;
  final coverid;
  final storelogo;
  final storelin;

  const SignUpThirdScreen(
      {super.key,
      required this.frontid,
      required this.coverid,
      required this.storelogo,
      required this.backid,
      required this.storelin});

  @override
  State<SignUpThirdScreen> createState() => _SignUpThirdScreenState();
}

class _SignUpThirdScreenState extends State<SignUpThirdScreen> {
  final Signup_api = Get.put(Signupapi());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign up",
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 60,
              ),
              const Text(
                'Bank and mobile money',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Ember_Display_Medium'),
              ),
              SizedBox(height: h / 40),
              Text(
                "Bank name",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h / 100),
              TextFormField(
                controller: Signup_api.bankNameController,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "please entre Bank name";
                //   } else {
                //     return null;
                //   }
                // },
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
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
              SizedBox(height: h / 60),
              Text(
                "Bank account number",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h / 100),
              TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                controller: Signup_api.bankAccountNumberController,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "please entre Bank account number";
                //   } else {
                //     return null;
                //   }
                // },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  // hintText: "Bank Account Number",
                  // labelText: 'Bank Account Number',
                  // labelStyle: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontFamily: 'Ember_Display_Medium'),
                ),
              ),
              SizedBox(height: h / 60),
              Text(
                "Bank account name",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h / 100),
              TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                controller: Signup_api.bankAccountNameController,
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "please entre Bank account name";
                //   } else {
                //     return null;
                //   }
                // },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
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
              SizedBox(height: h / 60),
              Text(
                "SWIFT Code",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h / 100),
              TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                controller: Signup_api.swiftController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
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
              SizedBox(height: h / 60),
              Text(
                "Mobile money number",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Ember_Medium",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: h / 100),
              TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(15)],
                controller: Signup_api.mobileNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre Mobile money number";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1),
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
              SizedBox(height: h / 40),
              Obx(
                () => Signup_api.isloading == true
                    ? Center(
                        child: CircularProgressIndicator(color: logocolo),
                      )
                    : CustomButton(
                        title: 'Continue',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Signup_api.signupApi(
                                widget.frontid,
                                widget.backid,
                                widget.coverid,
                                widget.storelogo,
                                widget.storelin);
                          }
                        }),
              ),
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
              SizedBox(
                height: h / 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
