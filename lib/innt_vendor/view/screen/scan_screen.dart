import 'package:flutter/material.dart';

import '../../../innt_delivery/Controllers/text2.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Product detail",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h / 15,
            ),
            GestureDetector(
              onTap: () {
                //  Get.to(() => SignInScreen());
              },
              child: Center(
                child: Icon(
                  Icons.qr_code_2_outlined,
                  size: 200,
                ),
              ),
            ),
            SizedBox(
              height: h / 80,
            ),
            Text(
              "General book",
              style: Black_Text_Bold_Large,
            ),
            SizedBox(
              height: h / 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/download.png",
                      height: 42,
                      width: 42,
                    ),
                    SizedBox(
                      height: h / 100,
                    ),
                    Text(
                      "Save",
                      style: A_style_medium,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/share.png",
                      height: 42,
                      width: 42,
                    ),
                    SizedBox(
                      height: h / 100,
                    ),
                    Text(
                      "Share",
                      style: A_style_medium,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
