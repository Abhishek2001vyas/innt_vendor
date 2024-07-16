/*
import 'package:demo_innt/innt_vendor/view/auth_vendor/signup_screen.dart';
import 'package:demo_innt/innt_vendor/view/screen/bottom_navigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../innt_delivery/Controllers/button.dart';
import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../screen/forgot_password/forgot_password.dart';

class Signin_email_vendor extends StatefulWidget {
  const Signin_email_vendor({super.key});

  @override
  State<Signin_email_vendor> createState() => _Signin_email_vendorState();
}

class _Signin_email_vendorState extends State<Signin_email_vendor> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final valid = GlobalKey<FormState>();
  RegExp pattern = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+");

  bool passwordObscured = true;

  bool isloading = false;

  bool? isChecked = false;
*/
/*  bool _isShow = false;
  bool _isShowSeller = false;
  bool _isShowDelivery = false;*/ /*

  bool _isShowSellerCheck = false;
  bool _isShowDeliveryCheck = false;
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
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Form(
              child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / 40,
                ),
                */
/*Center(
                    child: Image.asset(
                  "assets/images/innt-animation-unscreen.gif",
                  scale: 3,
                )),*/ /*

                Center(
                  child: Text(
                    "Select your account",
                    style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 20,
                        fontFamily: "Ember_Display_Medium"),
                  ),
                ),
                SizedBox(
                  height: h / 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isShowSellerCheck = !_isShowSellerCheck;
                                _isShowDeliveryCheck = false;
                                if (_isShowSellerCheck) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        content: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 40),
                                              Text(
                                                "Welcome",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 40),
                                              Text(
                                                "Devon !",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 40),
                                              // Add any other widgets you want in the dialog
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  Future.delayed(Duration(seconds: 2), () {
                                    setState(() {
                                      isloading = false;
                                      //Get.to(Verify_Login());
                                      Get.to(DashboardScreenVendor());
                                    });
                                  });
                                }
                              });
                            },
                            child: Container(
                              height: h / 5,
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
                                    "assets/images/seller_logo.png",
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                  ),
                                  Text(
                                    "Seller",
                                    style: TextStyle(
                                      color: Color(0xff020301),
                                      fontSize: 24,
                                      fontFamily: "Ember_Display_Medium",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 90,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: _isShowSellerCheck
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isShowSellerCheck = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.check_circle,
                                    color: logocolo,
                                    size: 35,
                                  ),
                                )
                              : SizedBox(), // Invisible if _isShowSellerCheck is false
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isShowDeliveryCheck = !_isShowDeliveryCheck;
                                _isShowSellerCheck = false;
                                if (_isShowDeliveryCheck) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        content: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 40),
                                              Text(
                                                "Delivery",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 40),
                                              // Add any other widgets you want in the dialog
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              });
                            },
                            child: Container(
                              height: h / 5,
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
                                  Text(
                                    "Delivery",
                                    style: TextStyle(
                                      color: Color(0xff020301),
                                      fontSize: 24,
                                      fontFamily: "Ember_Display_Medium",
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 90,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: _isShowDeliveryCheck
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isShowDeliveryCheck = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.check_circle,
                                    size: 35,
                                    color: logocolo,
                                  ),
                                )
                              : SizedBox(), // Invisible if _isShowDeliveryCheck is false
                        ),
                      ],
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
                  */
/* validator: (value) {
                                          if (value!.length < 10) {
                                            return "Invalid email address";
                                          } else {
                                            return null;
                                          }
                                        },*/ /*

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
                  // validator: (value) {
                  //   if (value!.length < 6) {
                  //     return "Wrong password";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  obscureText: passwordObscured,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
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
                ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      setState(() {
                        isloading = true;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isloading = false;
                          //Get.to(const Navgationbar());
                          //congr();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                content: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 40),
                                      Text(
                                        "Welcome",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      Text(
                                        "Devon !",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      // Add any other widgets you want in the dialog
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          Future.delayed(
                              Duration(seconds: 2),
                              () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DashboardScreenVendor(),
                                    ),
                                    (route) => false,
                                  )
                              //Get.to(const Navgationbar()),
                              );
                          //Navigator.pop(context);
                        });
                      });
                    },
                    child: isloading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text("Sign in", style: A_style_text_inside_button)),
                */
/*   ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      setState(() {
                        isloading = true;
                      });
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isloading = false;
                          Get.to(() => ());
                        });
                      });
                    },
                    child: isloading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text("Sign in", style: A_style_text_inside_button)),*/ /*

                SizedBox(
                  height: h / 20,
                ),
                InkWell(
                    onTap: () {
                      Get.to(Forgot_Password());
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
                        Get.to(() => SignUpScreenVendor());
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

                */
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
                        ),*/ /*

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
*/
