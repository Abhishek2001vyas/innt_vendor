import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../innt_delivery/Controllers/button.dart';
import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../Api/seller_forgot_api.dart';

String? off = "3";

class Forgot_Password extends StatefulWidget {
  const Forgot_Password({super.key});

  @override
  State<Forgot_Password> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Password> {
  bool isloading = false;
  final formKey = GlobalKey<FormState>();
  final emailControllerrr = TextEditingController();
  final forgot_api = Get.put(Seller_forgot_api());

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
                                  await forgot_api.forgot(
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
