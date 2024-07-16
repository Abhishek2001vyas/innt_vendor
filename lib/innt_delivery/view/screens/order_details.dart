import 'package:flutter/material.dart';

import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Order Id:",
                        style: A_style_medium,
                      ),
                      SizedBox(
                        width: w / 70,
                      ),
                      Text(
                        "#5667309",
                        style: A_style_mid_black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amit Jain:",
                        style: A_style_medium,
                      ),
                      Text(
                        "8 January 2023, 11:30 AM",
                        style: A_style_mid_black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 100,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: primaryColor,
                      ),
                      Text(
                        "Indore Madhya Pradesh",
                        style: A_style_medium,
                      ),
                      Spacer(),
                      Icon(
                        Icons.call,
                        color: primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: whiteColor,
                  // borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 2)
                  ]),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 7,
                      child: Image.asset(
                        "assets/images/jeans3.jpg",
                      )),
                  SizedBox(
                    width: w / 70,
                  ),
                  Text(
                    "#5667309",
                    style: A_style_mid_black,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
