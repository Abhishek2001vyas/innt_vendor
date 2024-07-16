import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';

class RequestOrder extends StatefulWidget {
  const RequestOrder({super.key});

  @override
  State<RequestOrder> createState() => _RequestOrderState();
}

class _RequestOrderState extends State<RequestOrder> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Order # 100134"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/books.png",
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Premium Business", style: A_style_order),
                          SizedBox(
                            height: h / 100,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: logocolo,
                            ),
                            child: const Text(
                              "\$600.00",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            height: h / 100,
                          ),
                          Row(
                            children: [
                              Text("Order Status : ", style: A_style_medium),
                              Text(
                                "Not delivered",
                                style: TextStyle(
                                    color: Color(0xffffc000),
                                    fontSize: 17,
                                    overflow: TextOverflow.ellipsis),
                                maxLines: 2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h / 100,
                          ),
                          Text("Payment method :", style: A_style_medium),
                          SizedBox(
                            height: h / 100,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 60,
            ),
            Text("Refund Reason:", style: A_style_medium),
            SizedBox(
              height: h / 60,
            ),
            Container(
              padding: const EdgeInsets.all(4),
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
                    height: h / 100,
                  ),
                  const Text(
                    ": There are many variations of ……. : There are many variations of. There are many variations of . : There are many variations of ……. : There are many variations of …. : There are many variations of…. : There are many variations of….",
                    style: TextStyle(
                        letterSpacing: 1,
                        //color: Colors.white,
                        color: Colors.black,
                        fontFamily: "Amazon_med",
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14),
                    maxLines: 8,
                  ),
                  SizedBox(
                    height: h / 80,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 60,
            ),
            Container(
              padding: const EdgeInsets.all(4),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price (x1)",
                        style: A_style_mid,
                      ),
                      Text(
                        "+\$6,000.00",
                        style: A_style_mid,
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
                        "Discount",
                        style: A_style_mid,
                      ),
                      Text(
                        "-\$10.00",
                        style: A_style_mid,
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
                        "Coupon",
                        style: A_style_mid,
                      ),
                      Text(
                        "+\$6,000.00",
                        style: A_style_mid,
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
                        "Sub Total",
                        style: A_style_mid,
                      ),
                      Text(
                        "+\$6,290.00",
                        style: A_style_mid,
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 100,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total refundable amount",
                        style: A_style_order,
                      ),
                      Text(
                        "+\$6,290.00",
                        style: TextStyle(
                            //letterSpacing: 2.5,
                            //color: Colors.white,
                            color: logocolo,
                            fontFamily: "Amazon_bold",
                            fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 60,
            ),
            Container(
              padding: const EdgeInsets.all(4),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Customer information",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Ember_Bold",
                          fontSize: 17)),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.person,
                                    color: logocolo,
                                  )),
                              Text("Amit Jain", style: A_style_mid),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.call,
                                    color: logocolo,
                                  )),
                              Text("+91 7876689867", style: A_style_mid),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mail,
                                    color: logocolo,
                                  )),
                              Text("customer@customer.com", style: A_style_mid),
                            ],
                          ),
                        ],
                      ),
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
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(4),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                showRejectDialog(context);
              },
              child: Container(
                width: w / 2.4,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red.shade700,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                      )
                    ],
                    border: Border.all(color: Colors.grey.shade200, width: 1)),
                child: Text(
                  "Reject",
                  style: TextStyle(
                      //letterSpacing: 2,
                      color: Colors.white,
                      fontFamily: "Amazon_med",
                      fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showApproveDialog(context);
              },
              child: Container(
                width: w / 2.4,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: logocolo,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                      )
                    ],
                    border: Border.all(color: Colors.grey.shade200, width: 1)),
                child: Text(
                  "Approve",
                  style: TextStyle(
                      //letterSpacing: 2,
                      color: Colors.white,
                      fontFamily: "Amazon_med",
                      fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showRejectDialog(BuildContext context) async {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
              child: Icon(
            Icons.cancel,
            size: 40,
            color: customColor,
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Confirm rejection?',
                      style: A_style_text_head2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: w / 5,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         const SignInWithPhoneNumber()),
                        //         (route) => false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Ember_Bold"),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: w / 5,
                    decoration: BoxDecoration(
                        color: logocolo,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                            color: Colors.white,
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

  showApproveDialog(BuildContext context) async {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Center(
              child: Icon(
            Icons.check_circle,
            size: 40,
            color: logocolo,
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Confirm approval?',
                      style: A_style_text_head2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: w / 5,
                    decoration: BoxDecoration(
                        color: customColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         const SignInWithPhoneNumber()),
                        //         (route) => false);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Ember_Bold"),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: w / 5,
                    decoration: BoxDecoration(
                        color: logocolo,
                        borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                            color: Colors.white,
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
}
