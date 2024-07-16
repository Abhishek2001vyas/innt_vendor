import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../innt_delivery/base/custom_button.dart';
import '../../Api/orderlist.dart';
import 'order_setup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrderDetails extends StatefulWidget {
  final orderid;
  final productid;

  const OrderDetails({super.key, this.orderid, this.productid});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final orderlist = Get.put(Seller_orderlist_api());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${  AppLocalizations.of(context)!.order}#${orderlist.orderdeatilsbyprod[0]["data"]["orderId"]}",
        ),
      ),
      body: SingleChildScrollView(
          child:
          Obx(() =>
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${  AppLocalizations.of(context)!.orderverificationcode} : ",
                                style: A_style_para),
                            Text(
                              "${orderlist
                                  .orderdeatilsbyprod[0]["data"]["orderVerification_code"]}",
                              style: TextStyle(
                                //letterSpacing: 1.5,
                                //color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  color: logocolo,
                                  fontFamily: "Amazon_med",
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${  AppLocalizations.of(context)!.orderstatus} : ", style: A_style_medium),
                            Text(
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "0" ?
                              AppLocalizations.of(context)!.pending :
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "1" ?
                              AppLocalizations.of(context)!.cancel:
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "2" ?
                              AppLocalizations.of(context)!.confirmed:
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "3" ?
                              AppLocalizations.of(context)!.packing :
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "4" ?
                              AppLocalizations.of(context)!.shipped :
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "5" ?
                              AppLocalizations.of(context)!.not_delivered :
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "6" ?
                              AppLocalizations.of(context)!.delivered :
                              orderlist
                                  .orderdeatilsbyprod[0]["data"]["order_status"]
                                  .toString() == "7" ?
                              AppLocalizations.of(context)!.returned: "",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Text("${  AppLocalizations.of(context)!.payment_method}: ${orderlist
                            .orderdeatilsbyprod[0]["data"]["paymentMode"] ??
                            "Online" }",
                            style: A_style_medium),
                        SizedBox(
                          height: h / 90,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: logocolo,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderlist.orderdeatilsbyprod[0]["data"]["paymentMode"]
                              .toString() != "Pay at store" ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${  AppLocalizations.of(context)!.shippingmethod} : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.delivery,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: logocolo,
                                          // Assuming logocolo is a color variable
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.person,
                                          color: Color(0xffc3d8fd)),
                                      SizedBox(width: 8),
                                      Text(
                                        "${
                                            orderlist.orderdeatilsbyprod[0]
                                            ["data"]["first_name"]
                                                .toString()
                                        } ${ orderlist
                                            .orderdeatilsbyprod[0]["data"]["last_name"]
                                            .toString()}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                          Icons.call, color: Color(0xffc3d8fd)),
                                      SizedBox(width: 8),
                                      Text(
                                        "${ orderlist
                                            .orderdeatilsbyprod[0]["data"]["mobile_number"]
                                            .toString()}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: Color(0xffc3d8fd)),
                                      SizedBox(width: 8),
                                      SizedBox(width: w / 2,
                                        child: Text(
                                          "${ orderlist
                                              .orderdeatilsbyprod[0]["data"]["building_no"]},${ orderlist
                                              .orderdeatilsbyprod.elementAt(
                                              0)["data"]["village_name"]},${ orderlist
                                              .orderdeatilsbyprod.elementAt(
                                              0)["data"]["landmark"]},${ orderlist
                                              .orderdeatilsbyprod.elementAt(
                                              0)["data"]["city_name"]},${ orderlist
                                              .orderdeatilsbyprod.elementAt(
                                              0)["data"]["state"]}, ${ orderlist
                                              .orderdeatilsbyprod.elementAt(
                                              0)["data"]["pin_code"]}",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),

                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                              Icon(Icons.qr_code_2_sharp,
                                  size: 90, color: Colors.black)
                            ],
                          )
                              :
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${  AppLocalizations.of(context)!.shippingmethod} : ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.pickup,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: logocolo,
                                          // Assuming logocolo is a color variable
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                              Icon(Icons.qr_code_2_sharp,
                                  size: 80, color: Colors.black)
                            ],
                          )
                          ,
                          const Divider(),
                          Text(
                            "Order note: please deliver during the day",
                            style: A_style_medium,
                          ),
                          const Divider(),
                          Text(
                            "Source: Online",
                            style: A_style_medium,
                          ),
                          const Divider(),
                          Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${  AppLocalizations.of(context)!.ordersummary}",
                                  style: Black_Text_Bold_Large,
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    // Text(
                                    //   "Size",
                                    //   style: A_style_mid,
                                    // ),
                                    Text(
                                      "Unit",
                                      style: A_style_mid,
                                    ),
                                    Text(
                                      "100g",
                                      style: A_style_mid,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Quantity",
                                      style: A_style_mid,
                                    ),
                                    Text(
                                      "${orderlist
                                          .orderdeatilsbyprod[0]["data"]["qty"]}",
                                      style: TextStyle(
                                        //letterSpacing:  1.5,
                                        //color: Colors.white,
                                          color: logocolo,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: "Amazon_med",
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Sub Total",
                                      style: A_style_mid,
                                    ),
                                    Text(
                                      "+\$ ${orderlist
                                          .orderdeatilsbyprod[0]["data"]["subtotal"]}",
                                      style: A_style_mid,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Tax",
                                      style: A_style_mid,
                                    ),
                                    Text(
                                      "\$ ${orderlist
                                          .orderdeatilsbyprod[0]["data"]["tax"]}",
                                      style: A_style_mid,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Discount",
                                      style: A_style_mid,
                                    ),
                                    Text(
                                      "+\$6,000.00",
                                      style: A_style_mid,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                orderlist
                                    .orderdeatilsbyprod[0]["data"]["paymentMode"]
                                    .toString() != "Pay at store" ?
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping Fee",
                                      style: A_style_mid,
                                    ),
                                    Text(
                                      "\$ ${orderlist
                                          .orderdeatilsbyprod[0]["data"]["shipping_charge"]}",
                                      style: A_style_mid,
                                    )
                                  ],
                                ) :
                                SizedBox()
                                ,


                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: A_style_medium,
                                    ),
                                    Text(
                                      "\$ ${orderlist
                                          .orderdeatilsbyprod[0]["data"]["total"]}",
                                      style: TextStyle(
                                        //letterSpacing: 2.5,
                                        //color: Colors.white,
                                          color: logocolo,
                                          fontFamily: "Amazon_bold",
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      "Payment Status",
                                      style: A_style_medium,
                                    ),
                                    Text(
                                      "${orderlist
                                          .orderdeatilsbyprod[0]["data"]["payment_status"]}",
                                      style: TextStyle(
                                        //letterSpacing: 2.5,
                                        //color: Colors.white,
                                          color: Colors.green.shade700,
                                          fontFamily: "Amazon_bold",
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.payment_method,
                                      style: A_style_medium,
                                    ),
                                    Text(
                                      " ${orderlist
                                          .orderdeatilsbyprod[0]["data"]["paymentMode"] ??
                                          "Online" }",
                                      style: A_style_medium,
                                      maxLines: 2,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                        border: Border.all(
                            color: Colors.grey.shade200, width: 1)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h / 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: w / 40,),
                            Image.network(
                              "$image_url${orderlist
                                  .orderdeatilsbyprod[0]["data"]["image"]}",
                              height: 115,
                              fit: BoxFit.fitHeight,
                            ),
                            SizedBox(width: w / 40,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: w / 1.8,
                                    child: Text("${orderlist
                                        .orderdeatilsbyprod[0]["data"]["product_name"]}",
                                        style: TextStyle(
                                          //letterSpacing: 2.5,
                                          //color: Colors.white,
                                            color: Colors.grey.shade900,
                                            fontFamily: "Amazon_bold",
                                            fontSize: 17))),
                                SizedBox(
                                  height: h / 110,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xff1455ac),
                                  ),
                                  child: Text(
                                    "\$ ${orderlist
                                        .orderdeatilsbyprod[0]["data"]["total"]}",
                                    style:
                                    TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                                SizedBox(
                                  height: h / 110,
                                ),


                                Row(
                                  children: [
                                    const Text(
                                      "Status: ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: w / 90,
                                    ),
                                    Text(
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "0" ?
                                      "Pending" :
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "1" ?
                                      "Cancel" :
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "2" ?
                                      "confirmed" :
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "3" ?
                                      "packing" :
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "4" ?
                                      "shipped" :
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "5" ?
                                      "not delivered" :
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "6" ?
                                      "delivered" :
                                      orderlist
                                          .orderdeatilsbyprod[0]["data"]["order_status"]
                                          .toString() == "7" ?
                                      "return" : "",
                                      style: TextStyle(
                                          color: Color(0xffa6a6a6),
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h / 110,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Payment: ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: w / 90,
                                    ),
                                    Text(
                                      "Stripe",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: h / 60,
                                ),
                                SizedBox(width: w/3,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:  orderlist
                                        .orderdeatilsbyprod[0]["data"]["attributes"].length,
                                    itemBuilder: (context, indext) {
                                      return Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          "${ orderlist
                                              .orderdeatilsbyprod[0]["data"]["attributes"][indext]["name"]}: ${orderlist
                                              .orderdeatilsbyprod[0]["data"]["attributes"][indext]["value"]} ",
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 17),
                                        ),
                                      );
                                    },),
                                )
                              ],
                            ),

                          ],
                        ),


                      ],
                    ),
                  ),
                ],
              ),
          )
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.all(4),
        color: Colors.white,
        child: CustomButton(
          title: 'Order Setup',
          onTap: () {
            Get.to(() =>
                OrderSetup(productid: orderlist
                    .orderdeatilsbyprod[0]["data"]["productId"],
                  orderisd: orderlist.orderdeatilsbyprod[0]["data"]["_id"],));
          },
        ),
      ),
    );
  }
}
