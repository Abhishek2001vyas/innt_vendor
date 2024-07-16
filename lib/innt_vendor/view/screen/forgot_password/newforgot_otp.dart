import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../innt_delivery/Controllers/button.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';

var one;

class newforgot_password extends StatefulWidget {
  //final String otp;

  //Verify({required this.otp, required id});

  @override
  State<newforgot_password> createState() => _Verify_LoginState();
}

class _Verify_LoginState extends State<newforgot_password> {
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

  String errorMessage = '';
  String existingOTP = "3284";

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  final newpasswordddd = TextEditingController();
  final ccnewpasswordddd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.only(right: 2),
      width: 65,
      height: 65,
      textStyle: TextStyle(
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text("Enter your new password", style: TextStyle()),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                child: TextFormField(
                  controller: newpasswordddd,
                  /* validator: (value) {
                                          if (value!.length < 10) {
                                            return "Invalid email address";
                                          } else {
                                            return null;
                                          }
                                        },*/
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
                  ),
                ),
              ),
              Text("Confirm your new password", style: TextStyle()),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                child: TextFormField(
                  controller: ccnewpasswordddd,
                  /* validator: (value) {
                                          if (value!.length < 10) {
                                            return "Invalid email address";
                                          } else {
                                            return null;
                                          }
                                        },*/
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      setState(() {
                        isloading = true;
                      });

                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isloading = false;

                          _showAnimatedPopup(context);
                          //Get.to(const Navgationbar());
                          //congr();
                          // Future.delayed(
                          //     const Duration(seconds: 2),
                          //         () => Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => Login_email(),
                          //         )));
                          //Get.to(Verify_Login());
                        });
                      });
                    },
                    child: isloading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text("Continue", style: A_style_text_inside_button)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_showAnimatedPopup(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final h = MediaQuery.of(context).size.height;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.white,
        content: Image.asset(
          "assets/images/successfully-unscreen.gif",
          height: 100,
          width: 100,
          color: logocolo,
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Success!!!",
                  style: A_style_heading,
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Text(
                "Congratulations Amit Your account has\nbeen created.!",
                style: A_style_order,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: h / 70,
              ),
              Container(
                width: w / 5,
                height: h / 23,
                // padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                decoration: BoxDecoration(
                    color: logocolo, borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    "Ok",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Amazon_bold",
                        fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
            ],
          )
        ],
      );
    },
  );
}
