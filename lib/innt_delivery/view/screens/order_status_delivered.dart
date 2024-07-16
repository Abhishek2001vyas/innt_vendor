import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../Api/orderlist.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';

class OrderStatusDelivered extends StatefulWidget {
  final orderid;

  const OrderStatusDelivered({super.key, this.orderid});

  @override
  State<OrderStatusDelivered> createState() => _OrderStatusDeliveredState();
}

class _OrderStatusDeliveredState extends State<OrderStatusDelivered> {
  final orderlist = Get.put(orderapi());

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
          "Order Status",
          style:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Ember"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder(
            future: orderlist.acceptdeatils(widget.orderid),
            builder: (context, snapshot) {
              return
                  // snapshot.connectionState==ConnectionState.waiting?
                  // Center(child: CircularProgressIndicator(color: logocolo),)
                  //     :
                  snapshot.hasError
                      ? Center(
                          child: Text("No data"),
                        )
                      : Obx(() {
                          var dataa;
                          late var list;
                          if (orderlist.acceptdeatilss.isNotEmpty) {
                            dataa = orderlist.acceptdeatilss[0]['data'];

                            print("lijfijg");
                          }

                          return orderlist.acceptdeatilss.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Color(0xffe5f0fc),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          border: Border.all(color: logocolo)),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Order Status:",
                                                  style: A_style_medium),
                                              const Text(
                                                "Delivered",
                                                style: TextStyle(
                                                    //letterSpacing: 1.5,
                                                    //color: Colors.white,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: "Amazon_med",
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Text("Order verification code: ", style: A_style_medium),
                                          //     const Text(
                                          //       "863092",
                                          //       style: TextStyle(
                                          //           //letterSpacing: 1.5,
                                          //           //color: Colors.white,
                                          //           color: logocolo,
                                          //           overflow: TextOverflow.ellipsis,
                                          //           fontFamily: "Amazon_med",
                                          //           fontSize: 16),
                                          //     )
                                          //   ],
                                          // ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Expected delivery time:",
                                                  style: A_style_medium),
                                              Text(
                                                dataa["expected_time"],
                                                style: TextStyle(
                                                    //letterSpacing: 1.5,
                                                    //color: Colors.white,
                                                    color: color1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: "Amazon_med",
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Delivery time:  ",
                                                  style: A_style_medium),
                                              Text(
                                                dataa["delivery_time"],
                                                style: TextStyle(
                                                    //letterSpacing: 1.5,
                                                    //color: Colors.white,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ]),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border:
                                                  Border.all(color: logocolo),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(dataa["shopName"],
                                                  style: A_style_medium),
                                              const Text(
                                                "Seller",
                                                style: TextStyle(
                                                    //letterSpacing: 1.5,
                                                    //color: Colors.white,
                                                    color: logocolo,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ]),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("Customer",
                                                  style: Blue_Text_Bold),
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
                                                    "${dataa["userFname"]} ${dataa["userlname"]}",
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
                                                    "Address : ",
                                                    style: A_style_order,
                                                  ),
                                                  Text(
                                                    "${dataa["building_no"] ?? ""} ${dataa["village_name"] ?? ""}",
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ]),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Order information",
                                                  style: Blue_Text_Bold),
                                              SizedBox(
                                                height: h / 80,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Order ID : ",
                                                    style: A_style_order,
                                                  ),
                                                  Text(
                                                    "${dataa["orderId"]}",
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
                                                    "Order date : ",
                                                    style: A_style_order,
                                                  ),
                                                  Text(
                                                    "",
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
                                                    "Payment : ",
                                                    style: A_style_order,
                                                  ),
                                                  Text(
                                                    '${dataa["paymentMethos"]}',
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
                                                    "Products : ",
                                                    style: A_style_order,
                                                  ),
                                                  Text(
                                                    "${dataa["products"].length}",
                                                    style: A_style_order,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Positioned(
                                              bottom: 2,
                                              right: 2,
                                              child: Container(
                                                width: w / 5,
                                                child: PrettyQrView.data(
                                                    data:
                                                        "${dataa['orderId']}"),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Center(child: Text('No order'));
                        });
            }),
      ),
    );
  }
}
