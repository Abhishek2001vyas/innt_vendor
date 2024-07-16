import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 1,
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          title: const Text(
            "My Order",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Container(
                padding: EdgeInsets.all(8),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 1)
                    ]),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Order List:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Ember_Display_Medium"),
                          ),
                          SizedBox(
                            height: h / 15,
                          ),
                          SizedBox(
                            height: h / 20,
                          ),
                          const Text(
                            "Status",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Ember_Display_Medium"),
                          ),
                          SizedBox(
                            height: h / 40,
                          ),
                          Text(
                            "Total: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Ember_Display_Medium"),
                          ),
                          SizedBox(
                            height: h / 40,
                          ),
                          Text(
                            "Action:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Ember_Display_Medium"),
                          ),
                        ],
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/img_1.png",
                              height: 30,
                              width: 30,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              "ID: 100185",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Ember_Bold"),
                            ),
                            const Text(
                              "11 Dec, 2023 09:06 PM",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontFamily: "Ember_Display_Medium"),
                            ),
                            SizedBox(
                              height: h / 40,
                            ),
                            SizedBox(
                              height: h / 40,
                            ),
                            Text(
                              "Pending",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Ember_Display_Medium"),
                            ),
                            SizedBox(
                              height: h / 40,
                            ),
                            Text(
                              "\$4750.00",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Ember_Display_Medium"),
                            ),
                            SizedBox(
                              height: h / 40,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                ),
                                Icon(
                                  Icons.download,
                                  color: Colors.green,
                                )
                              ],
                            ),
                          ]),
                    ]))));
  }
}
