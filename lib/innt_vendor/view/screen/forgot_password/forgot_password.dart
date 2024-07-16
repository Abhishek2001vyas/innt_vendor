import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/button.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';

String? off = "3";

class Forgot_Password1 extends StatefulWidget {
  const Forgot_Password1({super.key});

  @override
  State<Forgot_Password1> createState() => _Forgot_Password1State();
}

class _Forgot_Password1State extends State<Forgot_Password1> {
  bool isloading = false;
  final emailControllerrr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Email or phone",
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
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextFormField(
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
                    "We'll send a verification code to this email or phone number if it matches an existing innt account.",
                    style: TextStyle(
                        //letterSpacing: 1.5,
                        //color: Colors.white,
                        color: Colors.grey.shade700,
                        fontFamily: "Amazon_med",
                        fontSize: 14)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                child: ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      setState(() {
                        isloading = true;
                      });
                      Future.delayed(Duration(seconds: 2), () {
                        setState(() {
                          isloading = false;
                          //Get.to(Verify_Login());
                          //Get.to(forgototpp());
                        });
                      });
                    },
                    child: isloading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("Continue", style: A_style_text_inside_button)),
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
            ],
          ),
        ),
      ),
    );
  }
}
