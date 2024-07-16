import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/constant.dart';

class ReferEarn extends StatefulWidget {
  const ReferEarn({super.key});

  @override
  State<ReferEarn> createState() => _ReferEarnState();
}

class _ReferEarnState extends State<ReferEarn> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Refer & Earn",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffe3dff3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h / 50,
                  ),
                  Text(
                    "Earn cash upto Rs.150 for\n every friend you refer",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Roboto_thin",
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0x3cc999f1),
                                borderRadius: BorderRadius.circular(50)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/images/invite.png",
                                  fit: BoxFit.cover, height: 50, width: 50),
                            ),
                          ),
                          SizedBox(
                            width: w / 5,
                            child: Text(
                              "Invite A Friend",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontFamily: "Roboto_thin"),
                            ),
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_sharp,
                        size: 18,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0x3cc999f1),
                                borderRadius: BorderRadius.circular(50)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/images/order.png",
                                  fit: BoxFit.cover, height: 50, width: 50),
                            ),
                          ),
                          SizedBox(
                            width: w / 4,
                            child: Text(
                              "Friend Places Order",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Roboto_thin",
                                color: Colors.grey.shade800,
                              ),
                            ),
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_sharp,
                        size: 18,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0x3cc999f1),
                                borderRadius: BorderRadius.circular(50)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/images/cash.png",
                                  fit: BoxFit.cover, height: 50, width: 50),
                            ),
                          ),
                          SizedBox(
                            width: w / 5,
                            child: Text(
                              "You Earn Cash",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Roboto_thin",
                                color: Colors.grey.shade800,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                            color: const Color(0xffe3dff3), width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: Colors.yellow.shade800,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "You earn",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Roboto_thin",
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              "RS.150 cash reward for\neach friend you refer",
                              maxLines: 2,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey.shade800,
                                  fontSize: 13,
                                  fontFamily: "Roboto_thin"),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.celebration,
                                  color: Colors.yellow.shade800,
                                ),
                                SizedBox(
                                  width: w / 50,
                                ),
                                Text(
                                  "Your friend gets",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontFamily: "Roboto_thin",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Text(
                              " 20% discount on 1st\norder (Max.Rs.50 off).",
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 13,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: "Roboto_thin"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: logocolo,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: w / 50,
                            ),
                            const Text(
                              'Refer a Friend',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Ember_Bold"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h / 70,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: logocolo,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'System generates the code ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Ember_Bold"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Text(
                    "10,000+ users have earned up to Rs.5000",
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 15,
                        fontFamily: "Roboto_thin"),
                  ),
                  Divider(color: Colors.grey.shade400),
                  SizedBox(
                    height: h / 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "How it works?",
                        style: TextStyle(
                          fontFamily: "Ember_Display_Medium",
                          color: logocolo,
                        ),
                      ),
                      Text(
                        "Referral history",
                        style: TextStyle(
                          fontFamily: "Ember_Display_Medium",
                          color: logocolo,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
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