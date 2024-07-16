import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../innt_delivery/Controllers/button.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../Api/seller_forgot_api.dart';

var one;

class forgototpp extends StatefulWidget {
  final otp;
  final mobile;

  const forgototpp({required this.otp, required this.mobile});

  @override
  State<forgototpp> createState() => _Verify_LoginState();
}

class _Verify_LoginState extends State<forgototpp> {
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
  final forgotVerifyapi = Get.put(Seller_forgot_api());
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
        centerTitle: true,
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
              SizedBox(
                height: h / 20,
              ),
              Center(
                child: Text(
                  "Verify your email or phone",
                  style: Black_Text_Bold_Large,
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              Center(
                  child: Text('Please enter the code send to',
                      style: A_style_mid)),
              SizedBox(
                height: h / 20,
              ),
              Center(
                child: Text('${widget.mobile}', style: A_style_mid),
              ),
              SizedBox(
                height: h / 28,
              ),
              Obx(() => forgotVerifyapi.newotp.value == ""
                  ? Center(
                      child: Text('OTP : ${widget.otp}', style: A_style_mid),
                    )
                  : Center(
                      child: Text('OTP : ${forgotVerifyapi.newotp.value}',
                          style: A_style_mid),
                    )),
              SizedBox(
                height: h / 28,
              ),
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
              /*    Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '  $_remainingTime seconds',
                    style: A_style_mid,
                  ),
                ),
              ),*/
              SizedBox(
                height: h / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !_isTimerActive
                      ? Text(" ")
                      : Text("Resend in", style: A_style_mid),
                  !_isTimerActive
                      ? GestureDetector(
                          onTap: () async {
                            resendOTP();
                            await forgotVerifyapi
                                .forgotresend_otpmobile(widget.mobile);
                          },
                          child: Center(
                            child: Text(
                              'Resend code',
                              style: TextStyle(
                                  //letterSpacing:  1.5,
                                  //color: Colors.white,
                                  color: Colors.blue.shade700,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: "Amazon_med",
                                  fontSize: 14),
                            ),
                          ),
                        )
                      : Text(
                          '  $_remainingTime seconds',
                          style: A_style_mid,
                        ),
                ],
              ),
              Obx(
                () => forgotVerifyapi.isloading.value == true
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                        child: ElevatedButton(
                            style: buttonPrimary,
                            onPressed: _isVerifyButtonEnabled
                                ? () async {
                                    Map body = {
                                      'mobile_number': widget.mobile.toString(),
                                      "otp": _otpController.text.toString()
                                    };
                                    forgotVerifyapi.forgotverify(body);
                                  }
                                : null,
                            child: Text("Verify",
                                style: A_style_text_inside_button)),
                      ),
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
