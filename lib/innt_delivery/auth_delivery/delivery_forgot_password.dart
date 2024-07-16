import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/driver_login_api.dart';
import '../Controllers/button.dart';
import '../Controllers/constant.dart';
import '../Controllers/text2.dart';

class DeliveryForgotPassword extends StatefulWidget {
  const DeliveryForgotPassword({super.key});

  @override
  State<DeliveryForgotPassword> createState() => _DeliveryForgotPasswordState();
}

class _DeliveryForgotPasswordState extends State<DeliveryForgotPassword> {
  bool isloading = false;
  final formKey = GlobalKey<FormState>();
  final emailControllerrr = TextEditingController();
  final forgot_api = Get.put(Devilery_login_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Email or phone",
                    style: A_style_mid,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please entre phone no or email";
                        } else {
                          return null;
                        }
                      },
                      controller: emailControllerrr,
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
                        // hintText: "Example@gmail.com",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                        "We'll send a verification code to this email or phone number if it matches an existing innt account",
                        style: TextStyle(
                            //letterSpacing: 1.5,
                            //color: Colors.white,
                            color: Colors.grey.shade700,
                            fontFamily: "Amazon_med",
                            fontSize: 14)),
                  ),
                  Obx(() => forgot_api.isloading == true
                      ? Center(
                          child: CircularProgressIndicator(color: logocolo),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                              style: buttonPrimary,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await forgot_api.forgototppp(
                                      emailControllerrr.text.toString());
                                }
                              },
                              child: Text("Continue",
                                  style: A_style_text_inside_button)),
                        )),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Back",
                          style: A_style_mid,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
