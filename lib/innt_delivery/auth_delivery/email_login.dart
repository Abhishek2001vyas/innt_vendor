import 'package:demo_innt/innt_delivery/auth_delivery/signUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/constant.dart';
import '../view/dashboard/dashboard_delivery.dart';
import 'otp_Login.dart';

class EmailLoginDelivery extends StatefulWidget {
  const EmailLoginDelivery({super.key});

  @override
  State<EmailLoginDelivery> createState() => _EmailLoginDeliveryState();
}

class _EmailLoginDeliveryState extends State<EmailLoginDelivery> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    // primary: Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final valid = GlobalKey<FormState>();
  RegExp pattern = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+");

  bool passwordObscured = true;

  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: valid,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / 40,
                ),
                Center(
                    child: Image.asset(
                  "assets/images/innt-animation-unscreen.gif",
                  scale: 3,
                )),
                SizedBox(
                  height: h / 90,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Delivery  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ember"),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "App",
                      style: TextStyle(
                          color: logocolo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ember"),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 90,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome to innt  ",
                      style: TextStyle(
                          color: logocolo,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Ember"),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.waving_hand,
                      color: Colors.yellow.shade700,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.length < 10) {
                      return "Invalid email address";
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
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
                      hintText: "Email",
                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Wrong password";
                    } else {
                      return null;
                    }
                  },
                  obscureText: passwordObscured,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
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
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObscured = !passwordObscured;
                            });
                          },
                          icon: Icon(
                            passwordObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          )),
                      hintText: "Password",
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.black)),
                  controller: passwordController,
                ),
                const SizedBox(),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: const Color(0xff1455ac),
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      },
                    ),
                    const Text(
                      "Remember password",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Ember_Display_Medium"),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          Get.to(() => Verify_Login());
                        },
                        child: const Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            fontFamily: "Ember_Display_Medium",
                            color: Color(0xff1455ac),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                isChecked == true
                    ? InkWell(
                        onTap: () {
                          Get.to(() => DashboardDelivery());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: logocolo,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Ember_Bold"),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(12),
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Ember_Bold"),
                          textAlign: TextAlign.center,
                        ),
                      ),
                SizedBox(
                  height: h / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Ember_Light",
                          fontSize: 14),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SignUpScreenDelivery());
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                            color: Color(0xff1455ac),
                            fontSize: 16,
                            fontFamily: 'Ember_Display_Medium'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
