import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import 'bank_details.dart';

class BankInfo extends StatelessWidget {
  const BankInfo({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Bank Information",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Edit Info",
                  style: TextStyle(
                      color: logocolo, fontSize: 20, fontFamily: "Ember_Bold"),
                ),
                IconButton(
                    onPressed: () {
                      Get.to(() => const BankDetails());
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: logocolo,
                    ))
              ],
            ),
            SizedBox(
              height: h / 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: logocolo,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "A/C Holder:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Ember_Display_Medium",
                          ),
                        ),
                        const Text(
                          "Fatema",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Ember_Bold",
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          "assets/images/atm_card.png",
                          fit: BoxFit.cover,
                          height: 40,
                          width: 60,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bank: City Bank",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Ember_Display_Medium",
                          ),
                        ),
                        SizedBox(
                          height: h / 60,
                        ),
                        const Text(
                          "Branch: Mirpur- 12",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Ember_Display_Medium",
                          ),
                        ),
                        SizedBox(
                          height: h / 60,
                        ),
                        const Text(
                          "A/C No.: 1234567809",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Ember_Display_Medium",
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
