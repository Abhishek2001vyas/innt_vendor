import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../Api/getprofile.dart';
import '../../../Controllers/button.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/text2.dart';

class ModifyProfileOtp extends StatefulWidget {
  final otp;
  final mobile;
  final fname;
  final lname;
  final email;
  final dob;
  final city;
  final document;
  final vehical_iamge;
  final frontId_iamge;
  final  backId_iamge;
  const ModifyProfileOtp({super.key, this.otp, this.mobile, this.fname, this.lname, this.email,   this.dob, this.city, this.document, this.vehical_iamge, this.frontId_iamge, this.backId_iamge});

  @override
  State<ModifyProfileOtp> createState() => _ModifyProfileOtpState();
}

class _ModifyProfileOtpState extends State<ModifyProfileOtp> {
  TextEditingController _otpController = TextEditingController();
  bool _isVerifyButtonEnabled = false;
  final getprofile = Get.put(driverProfile());
  bool isloading = false;
  String otp = '';
  String otpResendValue = '';
  String mobiles = '';
  bool showCenter = false;
  int _remainingTime = 5;
  bool _isTimerActive = false;
  Timer? _timerr;

  bool? isChecked = false;

  // final forgotVerifyapi = Get.put(Seller_forgot_api());
  bool _onEditing = true;
  String? _code;

  // generateOTP() {
  //   setState(() {
  //     one = (1000 + Random().nextInt(9000)).toString();
  //   });
  // }

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
      appBar: AppBar(),
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
                  "Verify your phone number",
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
                child: Text( '${widget.mobile}', style: A_style_mid),
              ),
              SizedBox(
                height: h / 28,
              ),
              Center(
                child: Text('OTP :${widget.otp} ', style: A_style_mid),
              ),

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

              SizedBox(
                height: h / 20,
              ),


              Obx(
                () => getprofile.isloading.value == true
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                        child: ElevatedButton(
                            style: buttonPrimary,
                            onPressed: _isVerifyButtonEnabled
                                ? () async {

                              getprofile.verify(_otpController.text.toString(),
                               widget.fname.toString(),
                                widget.lname.toString(),
                                widget.email.toString(),
                                widget.mobile.toString(),
                                widget.dob.toString(),
                                widget.city.toString(),
                                widget.document.toString(),
                                widget.vehical_iamge.toString(),
                                widget.frontId_iamge.toString(),
                                widget.backId_iamge.toString(),
                              );
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
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 40,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Your information has been updated",
                    style: A_style_medium,
                  ),
                ),
              ),
              SizedBox(
                height: h / 40,
              ),
              Image.asset(
                "assets/images/successfully-unscreen.gif",
                height: 100,
                width: 100,
                color: logocolo,
              ),
              SizedBox(
                height: h / 40,
              ),
            ],
          )
        ],
      );
    },
  );
}
