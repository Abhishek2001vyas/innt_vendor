import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../innt_delivery/view/dashboard/dashboard_delivery.dart';
import '../Api/maincategory.dart';
import '../auth_vendor/seller_login.dart';
import 'bottom_navigationbar.dart';
import 'option_screen.dart';

class SplashScreenVender extends StatefulWidget {
  const SplashScreenVender({super.key});

  @override
  State<SplashScreenVender> createState() => _SplashScreenVenderState();
}

class _SplashScreenVenderState extends State<SplashScreenVender> {
  final maincateapi = Get.put(fetchmaintCategoryList());

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      //  Get.to(() => const Signin_email_vendor());
      await _handle(Permission.notification);
      await _handle(Permission.camera);
      await _handle(Permission.unknown);
      await _handle(Permission.location);
      await _handle(Permission.storage);
      await _handle(Permission.manageExternalStorage);
      await _handle(Permission.photos);

      var shared_preferences = await SharedPreferences.getInstance();
      var sessions = shared_preferences.getString("Session");

      sessions == "1"
          ? Get.offAll(DashboardDelivery())
          : sessions == "0"
              ? Get.offAll(DashboardScreenVendor())
              : Get.to(() => SellerLogin());
    });
  }

  _handle(Permission permission) async {
    final sstatus = await permission.request();
    var status = await permission.status;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h / 2.5,
            ),
            Center(
              child: Image.asset("assets/images/innt-animation-unscreen.gif",
                  fit: BoxFit.cover),
            ),
            // const Text(
            //   "Seller App",
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 30,
            //       fontWeight: FontWeight.bold,
            //       fontFamily: "Hey"),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
