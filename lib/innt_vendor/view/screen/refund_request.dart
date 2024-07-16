import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'request_order.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

dynamic refundRequest = [0];
List refund = [
  "Pending",
  "Approved",
  "Rejected",
  "Return",
  "Refunded",
];

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Refund Request",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 16,
              child: ListView.builder(
                  itemCount: refund.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          refundRequest.clear();
                          refundRequest.add(index);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                            color: refundRequest.contains(index)
                                ? const Color(0xff1455ac)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 3,
                              )
                            ]),
                        child: Text(
                          refund[index].toString(),
                          style: refundRequest.contains(index)
                              ? const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)
                              : const TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: h / 80,
            ),
            SizedBox(
              height: h / 80,
            ),
            const Text(
              "   12 Oct,2022 01:42 AM",
              style: TextStyle(fontSize: 17, fontFamily: "Hey"),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: h / 80,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const RequestOrder());
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                      )
                    ],
                    border: Border.all(color: Colors.grey.shade200, width: 1)),
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: w / 60,
                          ),
                          Text("Order#",
                              style: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Hey",
                                  fontSize: 17)),
                          SizedBox(
                            width: w / 50,
                          ),
                          const Text(
                            "100134",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Hey",
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/books.png",
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Premium Business",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Hey",
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: h / 110,
                            ),
                            Text(
                              "\$ 6,000.00",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Hey",
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: h / 110,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Get.theme.primaryColor,
                                ),
                                SizedBox(
                                  width: w / 90,
                                ),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontSize: 17),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w / 60,
                        ),
                        Text("Reason:",
                            style: TextStyle(
                                fontFamily: "Hey",
                                color: Get.theme.primaryColor,
                                fontSize: 17)),
                        const Expanded(
                          child: Text(
                            "There are many variations of passages lorem ipsum",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Hey",
                              letterSpacing: 1,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h / 80,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const RequestOrder());
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                      )
                    ],
                    border: Border.all(color: Colors.grey.shade200, width: 1)),
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: w / 60,
                          ),
                          Text("Order#",
                              style: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Hey",
                                  fontSize: 17)),
                          SizedBox(
                            width: w / 50,
                          ),
                          const Text(
                            "100134",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Hey",
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/books.png",
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Premium Business",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Hey",
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: h / 110,
                            ),
                            Text(
                              "\$ 6,000.00",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Hey",
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: h / 110,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Get.theme.primaryColor,
                                ),
                                SizedBox(
                                  width: w / 90,
                                ),
                                Text(
                                  "Pickup",
                                  style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontSize: 17),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w / 60,
                        ),
                        Text("Reason:",
                            style: TextStyle(
                                fontFamily: "Hey",
                                color: Get.theme.primaryColor,
                                fontSize: 17)),
                        const Expanded(
                          child: Text(
                            "There are many variations of passages lorem ipsum",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Hey",
                              letterSpacing: 1,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h / 80,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const RequestOrder());
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                      )
                    ],
                    border: Border.all(color: Colors.grey.shade200, width: 1)),
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: w / 60,
                          ),
                          Text("Order#",
                              style: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "Hey",
                                  fontSize: 17)),
                          SizedBox(
                            width: w / 50,
                          ),
                          const Text(
                            "100134",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Hey",
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/books.png",
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Premium Business",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Hey",
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: h / 110,
                            ),
                            Text(
                              "\$ 6,000.00",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Hey",
                                color: Get.theme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: h / 110,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: Get.theme.primaryColor,
                                ),
                                SizedBox(
                                  width: w / 90,
                                ),
                                Text(
                                  "Delivery",
                                  style: TextStyle(
                                      color: Get.theme.primaryColor,
                                      fontSize: 17),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w / 60,
                        ),
                        Text("Reason:",
                            style: TextStyle(
                                fontFamily: "Hey",
                                color: Get.theme.primaryColor,
                                fontSize: 17)),
                        const Expanded(
                          child: Text(
                            "There are many variations of passages lorem ipsum",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Hey",
                              letterSpacing: 1,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h / 80,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
