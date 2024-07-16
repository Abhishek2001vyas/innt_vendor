/*
import 'package:demo_innt/view/screen/bottom_navigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/color.dart';
import '../auth/signwithphone.dart';
import 'home_screen.dart';

showMyDialog(BuildContext context) async {
  bool isLoading = false;
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Your Order Successfully',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Ember_Bold"),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading = !isLoading;
                  });
                  Get.offAll(() => const HomeScreen());
                },
                child: Container(
                  width: w / 5,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    style: buttonWhite,
                    onPressed: () => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardScreen()),
                          (route) => false)
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          color: isLoading ? Colors.black : Colors.white,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const HomeScreen());
                },
                child: Container(
                  width: w / 5,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: TextButton(
                    style: buttonWhite,
                    onPressed: () => {
                      setState(() {
                        isLoading = !isLoading;
                      }),
                      Get.back()
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          color: isLoading ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
*/
