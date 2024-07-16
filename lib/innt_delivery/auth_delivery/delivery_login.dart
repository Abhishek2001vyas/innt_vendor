import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../innt_vendor/view/screen/option_screen.dart';
import '../Api/driver_login_api.dart';
import '../Controllers/button.dart';
import '../Controllers/constant.dart';
import '../Controllers/text2.dart';
import 'delivery_forgot_password.dart';
import 'delivery_signup_screen.dart';

class DeliveryLogin extends StatefulWidget {
  const DeliveryLogin({super.key});

  @override
  State<DeliveryLogin> createState() => _DeliveryLoginState();
}

class _DeliveryLoginState extends State<DeliveryLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Signin_api = Get.put(Devilery_login_api());
  final valid = GlobalKey<FormState>();

  // final Signin_api = Get.put(Seller_login_api());
  bool passwordObscured = true;
  bool? isChecked = false;
  final formKey = GlobalKey<FormState>();
  RegExp pattern = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+");
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.to(OptionScreen());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h / 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            height: h / 4,
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
                                Divider(
                                  indent: 10,
                                  endIndent: 10,
                                  color: Colors.grey,
                                  thickness: 1,
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
                      ],
                    ),
                    SizedBox(
                      height: h / 30,
                    ),
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
                        Text(
                          "*",
                          style: TextStyle(
                              color: customColor,
                              fontSize: 14,
                              fontFamily: "Ember_Medium",
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h / 100,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please entre phone no or email";
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
                      ),
                    ),
                    SizedBox(
                      height: h / 80,
                    ),
                    SizedBox(
                      height: h / 50,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Ember_Medium",
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: w / 100,
                        ),
                        Text(
                          "*",
                          style: TextStyle(
                              color: customColor,
                              fontSize: 14,
                              fontFamily: "Ember_Medium",
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h / 100,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please entre password";
                        } else {
                          return null;
                        }
                      },
                      obscureText: passwordObscured,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
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
                          hintText: "Password"),
                      controller: passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        Text("Remember password", style: A_style_mid),
                      ],
                    ),
                    Obx(() => Signin_api.isloading == true
                        ? Center(
                            child: CircularProgressIndicator(color: logocolo),
                          )
                        : ElevatedButton(
                            style: buttonPrimary,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await Signin_api.Login(
                                    emailController.text.toString(),
                                    passwordController.text.toString(),
                                    context);
                              }
                            },
                            child: Text("Sign in",
                                style: A_style_text_inside_button))),
                    SizedBox(
                      height: h / 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(DeliveryForgotPassword());
                        },
                        child: Center(
                            child: Text("Forgot password?",
                                style: A_style_text_button))),
                    SizedBox(
                      height: h / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account yet?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Ember_Light",
                              fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => SignUpScreenDelivery());
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.blue.shade700,
                                fontSize: 16,
                                fontFamily: 'Ember_Display_Medium'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
