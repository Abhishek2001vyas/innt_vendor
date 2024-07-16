import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';

class OrderStatusCancelled extends StatefulWidget {
  const OrderStatusCancelled({super.key});

  @override
  State<OrderStatusCancelled> createState() => _OrderStatusCancelledState();
}

class _OrderStatusCancelledState extends State<OrderStatusCancelled> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // forceMaterialTransparency: true,
        // automaticallyImplyLeading: true,
        foregroundColor: logocolo,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.orderstatus,
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Ember"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color(0xffe5f0fc),
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: logocolo)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${  AppLocalizations.of(context)!.orderstatus}:", style: A_style_medium),
                       Text(
                         AppLocalizations.of(context)!.cancelled,
                        style: TextStyle(
                            //letterSpacing: 1.5,
                            //color: Colors.white,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Amazon_med",
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${  AppLocalizations.of(context)!.order_verification_code}: ", style: A_style_medium),
                      const Text(
                        "863092",
                        style: TextStyle(
                            //letterSpacing: 1.5,
                            //color: Colors.white,
                            color: logocolo,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Amazon_med",
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${  AppLocalizations.of(context)!.expected_delivery_time}:", style: A_style_medium),
                      const Text(
                        "18:42",
                        style: TextStyle(
                            //letterSpacing: 1.5,
                            //color: Colors.white,
                            color: color1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Amazon_med",
                            fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${  AppLocalizations.of(context)!.deliverytime}:  ", style: A_style_medium),
                      const Text(
                        "18:35",
                        style: TextStyle(
                            //letterSpacing: 1.5,
                            //color: Colors.white,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Amazon_med",
                            fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 70,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                  ]),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: logocolo),
                    ),
                    child: Image.asset(
                      "assets/images/user.png",
                      height: 40,
                    ),
                  ),
                  SizedBox(
                    width: w / 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Digital House", style: A_style_medium),
                      const Text(
                        "Seller",
                        style: TextStyle(
                            //letterSpacing: 1.5,
                            //color: Colors.white,
                            color: logocolo,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: "Amazon_med",
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: const Icon(
                      Icons.message,
                      color: logocolo,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: w / 100,
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Icon(
                      Icons.call,
                      color: Colors.green.shade800,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h / 70,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                  ]),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.customer, style: Blue_Text_Bold),
                      SizedBox(
                        height: h / 80,
                      ),
                      Row(
                        children: [
                          Text(
                            "Name : ",
                            style: A_style_order,
                          ),
                          Text(
                            "Amit Jain",
                            style: A_style_order,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                      Row(
                        children: [
                          Text(
                            "${  AppLocalizations.of(context)!.address} : ",
                            style: A_style_order,
                          ),
                          Text(
                            "Indore Madhaya",
                            style: A_style_order,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 1,
                    top: 1,
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                          )),
                      child: Icon(
                        Icons.call,
                        color: Colors.green.shade800,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 70,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                  ]),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.order_information, style: Blue_Text_Bold),
                      SizedBox(
                        height: h / 80,
                      ),
                      Row(
                        children: [
                          Text(
                            "${  AppLocalizations.of(context)!.order_id} : ",
                            style: A_style_order,
                          ),
                          Text(
                            "100189",
                            style: A_style_order,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                      Row(
                        children: [
                          Text(
                            "${  AppLocalizations.of(context)!.orderdate} : ",
                            style: A_style_order,
                          ),
                          Text(
                            "11 Jan 2024 16:24 PM",
                            style: A_style_order,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                      Row(
                        children: [
                          Text(
                            "${  AppLocalizations.of(context)!.payment} : ",
                            style: A_style_order,
                          ),
                          Text(
                            "Cash On Delivery",
                            style: A_style_medium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 80,
                      ),
                      Row(
                        children: [
                          Text(
                            "${  AppLocalizations.of(context)!.products} : ",
                            style: A_style_order,
                          ),
                          Text(
                            "Item 1",
                            style: A_style_order,
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Image.asset(
                      "assets/images/qr-code.png",
                      height: 70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(
                    "Cancellation Reason : ",
                    style: A_style_order,
                  ),
                  Text(
                    "Technical issues",
                    style: A_style_order,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
