import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_screen.dart';

String? off = "3";

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    // primary: Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        forceMaterialTransparency: true,
        title: const Text(
          "Forgot Password",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //     child: Image.asset(
              //   "assets/images/login.png",
              // )),
              SizedBox(
                height: h / 6,
              ),
              const Text(
                "How would you like to reset your Password",
                style: TextStyle(
                    color: Colors.black, fontSize: 17, fontFamily: "Ember"),
              ),
              SizedBox(
                height: h / 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    off = "0";
                    print(off);
                  });
                },
                child: Container(
                  height: h / 12,
                  width: w / 1.1,
                  decoration: BoxDecoration(
                      color: off == "0"
                          ? Color(0xD7E2F1FF)
                          : const Color(0xffeff3f6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: h / 21,
                          width: w / 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xff1455ac)),
                              color: Colors.white),
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.mail_outline,
                              color: Color(0xff1455ac),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 3),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Via Email",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: "Ember"),
                                ),
                                SizedBox(
                                  height: h / 110,
                                ),
                                const Text(
                                  "123@gmail.com",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: "Ember"),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 25,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    off = "1";
                  });
                },
                child: Container(
                  height: h / 12,
                  width: w / 1.1,
                  decoration: BoxDecoration(
                      color: off == "1" ? Color(0xD7E2F1FF) : Color(0xffeff3f6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: h / 21,
                          width: w / 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xff1455ac)),
                              color: Colors.white),
                          child: InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.sms_outlined,
                              color: Color(0xff1455ac),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 3),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Via SMS",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: "Ember"),
                                ),
                                SizedBox(
                                  height: h / 110,
                                ),
                                const Text(
                                  "(+91) 1234567890",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: "Ember"),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => otp_vendor());
                },
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: const Color(0xff1455ac),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Get.to(() => otp_vendor());
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
