import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../innt_vendor/view/screen/bottom_navigationbar.dart';
import '../Controllers/button.dart';
import '../Controllers/constant.dart';
import '../Controllers/text2.dart';

var one;

class Verify_Login extends StatefulWidget {
  //final String otp;

  //Verify({required this.otp, required id});

  @override
  State<Verify_Login> createState() => _Verify_LoginState();
}

class _Verify_LoginState extends State<Verify_Login> {
  TextEditingController _otpController = TextEditingController();
  bool _isVerifyButtonEnabled = false;
  bool isloading = false;
  String otp = '';
  String otpResendValue = '';
  String mobiles = '';
  bool showCenter = false;
  int _remainingTime = 5;
  bool _isTimerActive = false;
  Timer? _timerr;

  bool? isChecked = false;

  bool _onEditing = true;
  String? _code;

  generateOTP() {
    setState(() {
      one = (1000 + Random().nextInt(9000)).toString();
    });
  }

  void startTimer() {
    setState(() {
      _isTimerActive = true;
    });

    _timerr = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        stopTimer();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void stopTimer() {
    setState(() {
      _isTimerActive = false;
    });
    if (_timerr != null) {
      _timerr!.cancel();
    }
  }

  void resendOTP() {
    setState(() {
      _remainingTime = 30;
    });
    startTimer();
  }

  int _secondsRemaining = 30;
  late Timer _timer;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startTimer();
    //otp = widget.otp;
  }

  void getMobileFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mobiles = prefs.getString('mobile') ?? '';
    });
  }

  // Future<bool> verifyOTP(mobiles, String otp) async {
  //   final Uri url = Uri.parse('http://103.104.74.215:3026/needoo/digital/Verifyotp');
  //
  //   final Map<String, String> requestBody = {
  //     'mobile': mobiles,
  //     'otp': otp,
  //   };
  //
  //   try {
  //     final http.Response response = await http.post(
  //       url,
  //       body: requestBody,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = json.decode(response.body);
  //       if (responseData['result'] == 'true') {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     } else {
  //       print('HTTP Error: Status Code ${response.statusCode}');
  //       if (response.body.isNotEmpty) {
  //         print('Response Body: ${response.body}');
  //       }
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }

  String errorMessage = '';
  String existingOTP = "3284";

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.only(right: 2),
      width: 65,
      height: 65,
      textStyle: const TextStyle(
          fontSize: 20, color: Color(0xff1455ac), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 20,
              ),
              Center(
                child:
                    Text("Verify Your Mobile Number", style: Textcagehometitle),
              ),
              SizedBox(
                height: h / 20,
              ),
              Center(
                  child: Text('Please enter the code send to',
                      style: A_style_mid)),
              SizedBox(
                height: h / 50,
              ),
              Center(
                child: Text('+91 - 1234567890', style: A_style_mid),
              ),
              /* Row(
                children: [
                  Text(
                      '+91 - 1234567890',
                      style: A_style_mid
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Text(
                          'Edit number',
                          style: A_style_text_button
                      ),
                    ),
                  ),
                ],
              ),*/
              SizedBox(
                height: h / 28,
              ),

              //           Center(
              //           child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              // children: [
              // // OTP input fields
              // Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // children: [
              // buildOtpTextField(1),
              // buildOtpTextField(2),
              // buildOtpTextField(3),
              // buildOtpTextField(4),
              // ],
              // ),
              //
              // SizedBox(height: 20),
              //
              // // Verify button
              // // ElevatedButton(
              // // onPressed: _isVerifyButtonEnabled ? () => _verifyOtp() : null,
              // // child: Text('Verify'),
              // // ),
              // ],
              // ),
              // ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: h / 14.8,
                  width: w / 1.3,
                  child: Pinput(
                      controller: _otpController,
                      onChanged: (value) {
                        setState(() {
                          _isVerifyButtonEnabled = value.length == 4;
                        });
                      },
                      //controller: off,
                      separatorBuilder: (index) => const SizedBox(width: 22),
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      // focusedPinTheme: focusedPinTheme,
                      // submittedPinTheme: submittedPinTheme,
                      showCursor: true,
                      onCompleted: (pin) {
                        setState(() {
                          otp = pin;
                        });
                      }),
                ),
              ),
              SizedBox(height: h / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !_isTimerActive
                      ? Text(" ")
                      : Text("Resend in", style: A_style_mid),
                  // Text(" ", style: TextStyle(color: Colors.black, fontFamily: "Roboto_med", fontSize: 17),),
                  !_isTimerActive
                      ? Column(
                          children: [
                            Text("Resend OTP via ", style: A_style_mid),
                            SizedBox(
                              height: h / 40,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.square(40),
                                    maximumSize: Size.square(150),
                                    elevation: 1,
                                    //primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side:
                                          BorderSide(color: Color(0xff1455ac)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/email.png",
                                          color: Color(0xff1455ac), scale: 45),
                                      SizedBox(
                                        width: w / 60,
                                      ),
                                      Text("Email",
                                          textAlign: TextAlign.center,
                                          style: A_style_text_button),
                                    ],
                                  ),
                                  // Container(
                                  //   width: w/3,
                                  //   // margin: EdgeInsets.only(
                                  //   //     left: 3, right: 3, top: 8, bottom: 8),
                                  //   padding: EdgeInsets.all(16),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       border: Border.all(
                                  //         width: 1,
                                  //         color: const Color(0xffab0d07),
                                  //       )),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       Image.asset("assets/images/whatsapp-glyph-black-logo-svgrepo-com (1).png", scale: 40, color: Colors.redAccent.shade700),
                                  //       SizedBox(
                                  //         width: w/60,
                                  //       ),
                                  //       Text(
                                  //         "WhatsApp",
                                  //         textAlign: TextAlign.center,
                                  //         style: M_style_text_button
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                                SizedBox(
                                  width: w / 25,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.square(40),
                                    maximumSize: Size.square(150),
                                    elevation: 1,
                                    //primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side:
                                          BorderSide(color: Color(0xff1455ac)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/message.png",
                                          color: Color(0xff1455ac), scale: 45),
                                      //Image.asset("assets/messaging-lines-svgrepo-com.png", scale: 20, color: Colors.pink),
                                      SizedBox(
                                        width: w / 60,
                                      ),
                                      Text("SMS",
                                          textAlign: TextAlign.center,
                                          style: A_style_text_button),
                                    ],
                                  ),
                                  // Container(
                                  //   width: w/3,
                                  //   // margin: EdgeInsets.only(
                                  //   //     left: 3, right: 3, top: 8, bottom: 8),
                                  //   padding: EdgeInsets.all(16),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       border: Border.all(
                                  //         width: 1,
                                  //         color: const Color(0xffab0d07),
                                  //       )),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       Image.asset("assets/images/whatsapp-glyph-black-logo-svgrepo-com (1).png", scale: 40, color: Colors.redAccent.shade700),
                                  //       SizedBox(
                                  //         width: w/60,
                                  //       ),
                                  //       Text(
                                  //         "WhatsApp",
                                  //         textAlign: TextAlign.center,
                                  //         style: M_style_text_button
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                                // Container(
                                //   width: w/3,
                                //   margin: EdgeInsets.only(
                                //       left: 3, right: 3, top: 8, bottom: 8),
                                //   padding: EdgeInsets.all(16),
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(8),
                                //       border: Border.all(
                                //         width: 1,
                                //         color: const Color(0xffab0d07),
                                //       )),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Image.asset("assets/images/messaging-lines-svgrepo-com.png", scale: 40, color: Colors.redAccent.shade700),
                                //       SizedBox(
                                //         width: w/60,
                                //       ),
                                //       Text(
                                //           "SMS",
                                //           textAlign: TextAlign.center,
                                //           style: M_style_text_button
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        )
                      : Text(
                          '  $_remainingTime seconds',
                          style: A_style_mid,
                        ),
                ],
              ),
              SizedBox(
                height: h / 20,
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Color(0xff1455ac),
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool;
                      });
                    },
                  ),
                  Text(
                    "Send me course updates & remainders on WhatsApp",
                    style: TextStyle(fontFamily: "Amazon_med", fontSize: 10),
                  ),
                ],
              ),

              ElevatedButton(
                  style: buttonPrimary,
                  onPressed: _isVerifyButtonEnabled
                      ? () {
                          setState(() {
                            isloading = true;
                          });
                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              isloading = false;
                              congr();
                              Future.delayed(
                                Duration(seconds: 1),
                                () => Get.to(DashboardScreenVendor()),
                              );
                            });
                          });
                        }
                      : null,
                  child: isloading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Verify", style: A_style_text_inside_button)),
            ],
          ),
        ),
      ),
    );
  }

// Future<void> resendOTP(String mobile, String fcm) async {
//   final Uri url = Uri.parse('http://103.104.74.215:3026/needoo/digital/ResendOtp');
//   final Map<String, String> requestBody = {
//     'mobile': mobile,
//     'fcm': fcm,
//   };
//
//   try {
//     final http.Response response = await http.post(
//       url,
//       body: requestBody,
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = json.decode(response.body);
//       final int newOtpInt = responseData['data']['otp'];
//       final String newOtp = newOtpInt.toString();
//
//       setState(() {
//         otpResendValue = newOtp;
//       });
//
//       print('OTP from Response: $newOtp');
//
//     } else {
//       print('HTTP Error: Status Code ${response.statusCode}');
//       if (response.body.isNotEmpty) {
//         print('Response Body: ${response.body}');
//       }
//     }
//   } catch (e) {
//     print('Error: An exception occurred while resending OTP: $e');
//   }
// }
  void congr() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          content: Container(
              height: 200,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //     child:
                  //     Image.asset("assets/images/Screenshot__30_-removebg-preview11.png",scale: 1.7)),
                  // SizedBox(
                  //     height: 15),
                  Center(
                    child: Text(
                      "Congratulations Amit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      "assets/images/successfully-unscreen.gif",
                      height: 100,
                      width: 100,
                      color: logocolo,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Your account has been created",
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(height: 20),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )),
        );
      },
    );
  }
}
