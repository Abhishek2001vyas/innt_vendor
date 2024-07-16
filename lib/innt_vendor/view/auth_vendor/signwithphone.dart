// import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/country_picker_dialog.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import '../../../innt_delivery/Controllers/text2.dart';
// import '../../../innt_delivery/base/custom_button.dart';
// import 'seller_login.dart';
// import 'forget_password.dart';
// import 'otp_screen.dart';
// import 'signup_screen.dart';
//
// class SignInWithPhoneNumberVendor extends StatefulWidget {
//   const SignInWithPhoneNumberVendor({super.key});
//
//   @override
//   State<SignInWithPhoneNumberVendor> createState() =>
//       _SignInWithPhoneNumberVendorState();
// }
//
// var ll;
//
// class _SignInWithPhoneNumberVendorState
//     extends State<SignInWithPhoneNumberVendor> {
//   final codeController = TextEditingController();
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//     //primary: Colors.black87,
//     minimumSize: const Size(88, 36),
//     padding: const EdgeInsets.symmetric(horizontal: 16),
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(2)),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//     final w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         foregroundColor: logocolo,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             color: logocolo,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.only(left: 30, right: 30),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                     child: Image.asset(
//                   "assets/images/innt-animation-unscreen.gif",
//                   scale: 3,
//                 )),
//                 SizedBox(
//                   height: h / 80,
//                 ),
//                 const Text(
//                   "SignIn with Phone Number \nto continue",
//                   style: TextStyle(
//                       color: Color(0xff020301),
//                       fontSize: 24,
//                       fontFamily: "Ember_Bold"),
//                 ),
//                 SizedBox(
//                   height: h / 30,
//                 ),
//                 IntlPhoneField(
//                   dropdownDecoration: BoxDecoration(shape: BoxShape.circle),
//                   initialCountryCode: "IN",
//                   onCountryChanged: (value) {
//                     setState(() {
//                       ll = value.maxLength;
//                     });
//                   },
//                   controller: codeController,
//                   validator: (value) {
//                     if (value == null) {
//                       return "please mobile";
//                     }
//                     return null;
//                   },
//                   pickerDialogStyle: PickerDialogStyle(
//                     backgroundColor: Color(0xffffffff),
//                   ),
//                   flagsButtonPadding: const EdgeInsets.all(5),
//                   dropdownIconPosition: IconPosition.trailing,
//                   decoration: InputDecoration(
//                       fillColor: Colors.white,
//                       contentPadding: EdgeInsets.all(12),
//                       filled: true,
//                       counterText: "",
//                       hintText: 'Mobile Number',
//                       hintStyle: A_style_mid,
//                       //labelStyle: TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide:
//                             const BorderSide(color: Colors.grey, width: 0),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Color(0xff1455ac), width: 1),
//                           borderRadius: BorderRadius.circular(10))
//                       // focusedBorder: OutlineInputBorder(
//                       //     borderSide:
//                       //     BorderSide(color: Colors.redAccent.shade700, width: 1),
//                       //borderRadius: BorderRadius.circular(10)),
//                       ),
//                 ),
//                 SizedBox(
//                   height: h / 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(() => const Signin_email_vendor());
//                       },
//                       child: const Text(
//                         "SignIn with Email Address",
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: "Ember_Medium",
//                             fontWeight: FontWeight.w500,
//                             decoration: TextDecoration.underline),
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                     InkWell(
//                         onTap: () {
//                           // Get.to(Verify_Login());
//                           Get.to(Forgot_Password());
//                         },
//                         child: Text("Forgot Password ?",
//                             style: A_style_text_button)),
//                   ],
//                 ),
//                 SizedBox(
//                   height: h / 30,
//                 ),
//
//                 // CustomButton(
//                 //     title: "Continue",
//                 //     onTap: () {
//                 //       Get.to(() => const OtpScreen());
//                 //     }),
//                 CustomButton(
//                     title: "Continue",
//                     onTap: () {
//                       Get.to(() => otp_vendor());
//                     }),
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     Get.to(() => OtpScreen());
//                 //   },
//                 //   child: Container(
//                 //     width: Get.width,
//                 //     decoration: BoxDecoration(
//                 //         color: Get.theme.primaryColor,
//                 //         borderRadius: BorderRadius.circular(5)),
//                 //     child: TextButton(
//                 //       onPressed: () {
//                 //         Get.to(() => OtpScreen());
//                 //       },
//                 //       child: const Text(
//                 //         'Continue',
//                 //         style: TextStyle(
//                 //             color: Colors.white,
//                 //             fontSize: 18,
//                 //             fontFamily: "Ember_Bold"),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: h / 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Already have an account?",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w500,
//                           fontFamily: "Ember_Light",
//                           fontSize: 14),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(() => SignUpScreenVendor());
//                       },
//                       child: const Text(
//                         "SignUp",
//                         style: TextStyle(
//                             color: Color(0xff1455ac),
//                             fontSize: 16,
//                             fontFamily: 'Ember_Display_Medium'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
