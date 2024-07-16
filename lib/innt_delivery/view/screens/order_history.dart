import 'package:demo_innt/innt_delivery/view/screens/order_status_delivered.dart';
import 'package:demo_innt/innt_delivery/view/screens/pending_delivery_map_screen.dart';
import 'package:demo_innt/innt_delivery/view/screens/viewmaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../ulits/constant.dart';
import '../../Api/orderlist.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';
import 'accepted_order_map_screen.dart';
import 'home_screen.dart';
import 'order_status_cancelled.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

dynamic empty1 = [0];
List order1 = [
  "New orders",
  "Accepted orders",
  "Pending delivery",
  "Delivered",
  "Cancelled",
  "Returns",
];

final orderlist = Get.put(orderapi());

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // forceMaterialTransparency: true,
        // automaticallyImplyLeading: false,
        title:  Center(
          child: Text(
            AppLocalizations.of(context)!.orderstatus,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: "Ember"),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: w / 50,
                ),
                SizedBox(
                  height: h / 16,
                  child: ListView.builder(
                      itemCount: order1.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              empty1.clear();
                              empty1.add(index);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                color: empty1.contains(index)
                                    ? logocolo
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 3,
                                  )
                                ]),
                            child: Center(
                              child: Text(
                                order1[index].toString(),
                                style: empty1.contains(index)
                                    ? const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)
                                    : const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                empty1[0] == 0
                    ? newOrder(h, w)
                    :
                    // : empty1[0] == 1
                    //     ?
                    acceptedOrders(h, w)
                // : empty1[0] == 2
                //     ? pendingDelivery(h, w)
                //     : empty1[0] == 3
                //         ? delivery(h, w)
                //         : cancelled(h, w)
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView cancelled(double h, double w) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(const OrderStatusCancelled());
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                ],
                border: Border.all(
                  color: Colors.grey.shade200,
                )),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/bag.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: w / 90,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order ID: 100181",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/store.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Fashion shop elite",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            "(view on map)",
                            style: TextStyle(
                                color: Color(0xff1455ac),
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/maps.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Indhore Madhya Pradesh",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            "(view on map)",
                            style: TextStyle(
                                color: Color(0xff1455ac),
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/money.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Cash on delivery",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/fast_delivery.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            " January 23, 2024 16:54",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListView delivery(double h, double w) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(OrderStatusDelivered());
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                ],
                border: Border.all(
                  color: Colors.grey.shade200,
                )),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/bag.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: w / 90,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order ID: 100181",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/store.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Fashion shop elite",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            "(view on map)",
                            style: TextStyle(
                                color: Color(0xff1455ac),
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/maps.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Indhore Madhya Pradesh",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            "(view on map)",
                            style: TextStyle(
                                color: Color(0xff1455ac),
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/money.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Cash on delivery",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/fast_delivery.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            " January 23, 2024 16:54",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListView pendingDelivery(double h, double w) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            // Get.to(const PendingDeliveryMapScreen(
            //   destination: 'indore',ordeid: ,
            // ));
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                ],
                border: Border.all(
                  color: Colors.grey.shade200,
                )),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/bag.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: w / 90,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order ID: 100181",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/store.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Fashion shop elite",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            "(view on map)",
                            style: TextStyle(
                                color: Color(0xff1455ac),
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/maps.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Indhore Madhya Pradesh",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            "(view on map)",
                            style: TextStyle(
                                color: Color(0xff1455ac),
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/money.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 70,
                          ),
                          Text(
                            " Cash on delivery",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h / 120,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/fast_delivery.png",
                            width: 25.0,
                            height: 25.0,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            " January 23, 2024 16:54",
                            style: A_style_order_status,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  acceptedOrders(double h, double w) {
    return FutureBuilder(
      future: orderlist.orderfilter(empty1[0]),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(color: logocolo),
              )
            : snapshot.hasError
                ? Center(
                    child: Text("No data"),
                  )
                : Obx(() => orderlist.orderlistfiter[0]["data"].isNotEmpty
                    ? ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: orderlist.orderlistfiter[0]["data"].length,
                        itemBuilder: (BuildContext context, int index) {
                          var dataa =
                              orderlist.orderlistfiter[0]["data"][index];
                          return InkWell(
                            onTap: () {
                              empty1[0] == 1
                                  ? Get.to(AcceptedOrderMapScreen(
                                      destination: 'indore',
                                      orderid: dataa["_id"],
                                    ))
                                  : empty1[0] == 2
                                      ? Get.to(PendingDeliveryMapScreen(
                                          destination: 'indore',
                                          ordeid: dataa["_id"],
                                        ))
                                      : empty1[0] == 3
                                          ? Get.to(OrderStatusDelivered(
                                              orderid: dataa["_id"],
                                            ))
                                          : Get.to(
                                              const OrderStatusCancelled());

                              ;
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        blurRadius: 2)
                                  ],
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                  )),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.network(
                                      "${image_url}${dataa["products"][0]["image"]}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 90,
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${  AppLocalizations.of(context)!.order_id}: ${dataa["orderId"]}",
                                          style: TextStyle(
                                            fontFamily: "Ember_Bold",
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h / 120,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/store.png",
                                              width: 25.0,
                                              height: 25.0,
                                            ),
                                            SizedBox(
                                              width: w / 70,
                                            ),
                                            Text(
                                              " ${dataa["products"][0]["shop_name"]}",
                                              style: A_style_order_status,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              width: w / 80,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(Viewmap(
                                                  lat: dataa["shop_lat"],
                                                  lon: dataa["shop_lon"],
                                                  name: "Store Location",
                                                  shopname: dataa["products"][0]
                                                      ["shop_name"],
                                                ));
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!.view_on_map,
                                                style: TextStyle(
                                                    color: Color(0xff1455ac),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: "Amazon_med",
                                                    fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 120,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/maps.png",
                                              width: 25.0,
                                              height: 25.0,
                                            ),
                                            SizedBox(
                                              width: w / 70,
                                            ),
                                            Text(
                                              " ${dataa["village_name"] ?? " N/A"}",
                                              style: A_style_order_status,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            SizedBox(
                                              width: w / 80,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(Viewmap(
                                                  lat: dataa["user_address"]
                                                          ["location"]
                                                      ["coordinates"][1],
                                                  lon: dataa["user_address"]
                                                          ["location"]
                                                      ["coordinates"][0],
                                                  name: "Delivery Location",
                                                  shopname:
                                                      "${dataa["userFname"]} ${dataa["userLname"]}",
                                                ));
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)!.view_on_map,
                                                style: TextStyle(
                                                    color: Color(0xff1455ac),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: "Amazon_med",
                                                    fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 120,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/money.png",
                                              width: 25.0,
                                              height: 25.0,
                                            ),
                                            SizedBox(
                                              width: w / 70,
                                            ),
                                            Text(
                                              "  ${dataa["paymentMode"] ?? dataa["products"][0]["payment_status"]}",
                                              style: A_style_order_status,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: h / 120,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/fast_delivery.png",
                                              width: 25.0,
                                              height: 25.0,
                                            ),
                                            SizedBox(
                                              width: w / 80,
                                            ),
                                            Text(
                                              " ${dataa["products"][0]["createdAt"].toString().substring(0, 10)} ${dataa["products"][0]["createdAt"].toString().substring(11, 16)}",
                                              style: A_style_order_status,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                        'No order',
                        style: TextStyle(color: Colors.black),
                      )));
      },
    );
  }

  StreamBuilder<dynamic> newOrder(double h, double w) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(
        milliseconds: 0,
      )).asyncMap((i) => orderlist.Orderlists()),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(color: logocolo),
              )
            : snapshot.hasError
                ? Center(
                    child: Text("No data"),
                  )
                : Obx(() => orderlist.orderlist[0]["data"].isNotEmpty
                    ? ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: orderlist.orderlist[0]['data'].length,
                        itemBuilder: (BuildContext context, int index) {
                          var dataa = orderlist.orderlist[0]['data'][index];
                          return Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      blurRadius: 2)
                                ],
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                )),
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "${  AppLocalizations.of(context)!.earrnhalf} ${dataa["delivery_charge"]} CFA ${  AppLocalizations.of(context)!.for_completing}",
                                  style: const TextStyle(
                                    fontFamily: "Ember_Bold",
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: h / 80,
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 50),
                                        child: Image.network(
                                          "${image_url}${dataa["products"][0]["image"]}",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 90,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: Text(
                                              "${  AppLocalizations.of(context)!.order_id}: ${dataa['orderId']}",
                                              style: const TextStyle(
                                                fontFamily: "Ember_Bold",
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: h / 120,
                                                  ),
                                                  Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration:
                                                          BoxDecoration(
                                                        color: logocolo,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Image.asset(
                                                          "assets/images/check.png",
                                                          fit: BoxFit.fill,
                                                          color: Colors.white,
                                                        ),
                                                      )),
                                                  Image.asset(
                                                    "assets/images/track_down_arrow.png",
                                                    height: 70,
                                                    width: 30,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .grey.shade400,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: w / 90,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: h / 120,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${dataa["products"][0]["shop_name"]}",
                                                        style:
                                                            A_style_order_status,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                      SizedBox(
                                                        width: w / 80,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(Viewmap(
                                                            lat: dataa[
                                                                "shop_lat"],
                                                            lon: dataa[
                                                                "shop_lon"],
                                                            name:
                                                                "Store Location",
                                                            shopname: dataa[
                                                                    "products"]
                                                                [
                                                                0]["shop_name"],
                                                          ));
                                                        },
                                                        child: Text(
                                                          AppLocalizations.of(context)!.view_on_map,
                                                          style:
                                                              A_style_order_status_blue,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${dataa['products'][0]["createdAt"].toString().substring(0, 10)}",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 11),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  Text(
                                                    "${dataa['products'][0]["createdAt"].toString().substring(11, 16)}",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 11),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  SizedBox(
                                                    height: h / 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${dataa["userFname"]} ${dataa["userLname"]}",
                                                        style:
                                                            A_style_order_status,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                      SizedBox(
                                                        width: w / 80,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(Viewmap(
                                                            lat: dataa["user_address"]
                                                                    [
                                                                    "location"]
                                                                [
                                                                "coordinates"][1],
                                                            lon: dataa["user_address"]
                                                                    [
                                                                    "location"]
                                                                [
                                                                "coordinates"][0],
                                                            name:
                                                                "Delivery Location",
                                                            shopname:
                                                                "${dataa["userFname"]} ${dataa["userLname"]}",
                                                          ));
                                                        },
                                                        child: Text(
                                                          AppLocalizations.of(context)!.view_on_map,
                                                          style:
                                                              A_style_order_status_blue,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "${dataa['products'][0]["createdAt"].toString().substring(0, 10)}",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 11),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  Text(
                                                    "${dataa['products'][0]["createdAt"].toString().substring(11, 16)}",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 11),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  Text(
                                                    "${dataa["paymentMode"]}",
                                                    //"Cash on delivery",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "Ember_Bold",
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                left: 10.0,
                                                right: 10.0),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await orderlist
                                                        .acceptorreject(
                                                            dataa['_id'],
                                                            "1");
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 5.0),
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      color: logocolo,
                                                    ),
                                                    child:  Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      AppLocalizations.of(context)!.accept,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            "Ember_Bold",
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: w / 30,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    orderRejectDialog(context,
                                                        dataa["_id"] );
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 5.0),
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      color: Colors.red,
                                                    ),
                                                    child:  Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      AppLocalizations.of(context)!.reject,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Ember_Bold",
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(child: Text('No order')));
      },
    );
  }
}
