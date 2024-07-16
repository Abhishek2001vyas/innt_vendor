import 'package:demo_innt/innt_vendor/view/auth_vendor/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../innt_delivery/Controllers/button.dart';
import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../Api/Seller_signup_api.dart';
import '../Api/seller_login_api.dart';
import 'forget_password.dart';

class SellerLogin extends StatefulWidget {
  const SellerLogin({super.key});

  @override
  State<SellerLogin> createState() => _SellerLoginState();
}

class _SellerLoginState extends State<SellerLogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Signup_api = Get.put(Signupapi());
  final valid = GlobalKey<FormState>();
  final Signin_api = Get.put(Seller_login_api());
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
                      height: h / 010,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            height: h / 3.65,
                            width: w / 2.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(
                                  width: 2.5, color: Colors.blue.shade700),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/seller_logo.png",
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width / 2,
                                ),
                                // Divider(
                                //   indent: 10,
                                //   endIndent: 10,
                                //   color: Colors.grey,
                                //   thickness: 1,
                                // ),
                                Text(
                                  "Seller",
                                  style: TextStyle(
                                    color: Color(0xff020301),
                                    fontSize: 31,
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
                        hintText: "Email or phone",
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
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Signin_api.Login(
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
                          Get.to(Forgot_Password());
                        },
                        child: Center(
                            child: Text("Forgot password?",
                                style: TextStyle(
                                    //letterSpacing: 1.5,
                                    color: logocolo,
                                    fontFamily: "Amazon_med",
                                    fontSize: 15)))),
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
                            Get.to(() => SignUpScreenVendor());
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: logocolo,
                                fontSize: 16,
                                fontFamily: 'Ember_Display_Medium'),
                          ),
                        ),
                      ],
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     //Get.to(() => Verify());
                    //   },
                    //   child: Container(
                    //     padding: const EdgeInsets.only(left: 8),
                    //     height: 50,
                    //     width: w / 1.2,
                    //     decoration: BoxDecoration(
                    //         color: Colors.redAccent.shade700,
                    //         borderRadius: BorderRadius.circular(25)),
                    //     child: Row(
                    //       children: [
                    //         Spacer(),
                    //         const Text("SignIn",
                    //             style: TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.white,
                    //                 fontSize: 20)),
                    //         Spacer(),
                    //         Container(
                    //           margin: const EdgeInsets.all(2),
                    //           decoration: const BoxDecoration(
                    //             color: Colors.white,
                    //             shape: BoxShape.circle,
                    //           ),
                    //           child: IconButton(
                    //             onPressed: () {
                    //               //Get.to(() => Verify());
                    //             },
                    //             icon: Icon(
                    //               Icons.arrow_forward,
                    //               color: Colors.redAccent.shade700,
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    /* InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Happy Hair",
                                content: Text(
                                    "We will verifying your phone number \n\n${name.toString()}  ${phoneController.text.toString()} \n\nIs this OK,or would like to edit the number?"),
                                cancel: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("EDIT")),
                                confirm: TextButton(onPressed: () {}, child: const Text("OK")));
                          },
                          child: InkWell(
                            onTap: () {
                              Get.to(() => Verify());
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 8),
                              height: 50,
                              width: w / 1.2,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent.shade700,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Row(

                                children: [
                                  Spacer(),
                                  const Text("NEXT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20)),
                                  Spacer(),
                                  Container(
                                    margin: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Get.to(() => Verify());
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.redAccent.shade700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),*/
                    // Container(
                    //     width: w/1.3,
                    //     height: h/20,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.all(Radius.circular(20))
                    //     ),
                    //     child: ElevatedButton(
                    //         style: ButtonStyle(
                    //             backgroundColor: MaterialStatePropertyAll(Colors.redAccent.shade700)),
                    //         onPressed: (){
                    //           //Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen02()));
                    //           Get.defaultDialog(
                    //               title: "Happy Hair",
                    //               content: Text("We will verifying your phone number \n\n${name.toString()}  ${phonecontroller.text.toString()} \n\nIs this OK,or would like to edit the number?"),
                    //               cancel: TextButton(
                    //                   onPressed: (){
                    //                     Get.to(Screen02());
                    //                   },
                    //                   child: Text("EDIT")),
                    //               confirm: TextButton(
                    //                   onPressed: (){
                    //                     Get.to(OTP());
                    //                   },
                    //                   child: Text("OK")
                    //               ));
                    //         },
                    //         child: Text("NEXT", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),)),
                    // ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
