import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/orderlist.dart';
import 'order_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

dynamic empty = [0];
List order = [
  "All",
  "Pending",
  "Confirmed",
  "Packing",
  "Shipped",
  "Delivered",
  "Not Delivered",
  "Cancelled",
  "Return",
];

class _OrderScreenState extends State<OrderScreen> {
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
        title:  Text(
          AppLocalizations.of(context)!.my_order,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: h / 16,
              child: ListView.builder(
                  itemCount: order.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          empty.clear();
                          empty.add(index);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                            color:
                            empty.contains(index) ? logocolo : Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 3,
                              )
                            ]),
                        child: Text(
                          order[index].toString(),
                          style: empty.contains(index)
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
            empty.contains(0) ?

            FutureBuilder(
              future: orderlist.orderlist(),
              builder: (context, snapshot) {
                return
                  snapshot.connectionState == ConnectionState.waiting ?
                  Center(child: CircularProgressIndicator(color: logocolo),) :
                  Obx(() =>
                  orderlist.orderlistt
                      // .elementAt(0)
                      // .data!
                      .isEmpty ?
                  Text("No order")
                      :
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderlist.orderlistt
                          .elementAt(0)
                          .data!
                          .length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var dataa = orderlist.orderlistt
                            .elementAt(0)
                            .data!;
                        return
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 3,
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h / 80,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: const Color(0xD7E2F1FF),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "${  AppLocalizations.of(context)!.order}#${dataa
                                          .elementAt(index)
                                          .orderId}",
                                      style: const TextStyle(
                                          color: Color(0xff1455ac),
                                          fontSize: 17,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 2,
                                    )),
                                SizedBox(
                                  height: h / 100,
                                ),
                                Text("${ AppLocalizations.of(context)!.orderdate} : ${dataa
                                    .elementAt(index)
                                    .orderDate!
                                    .substring(0, 10)} ${dataa
                                    .elementAt(index)
                                    .orderDate!
                                    .substring(11, 16)}",
                                    style: A_style_medium),
                                SizedBox(
                                  height: h / 100,
                                ),
                                Text("${ AppLocalizations.of(context)!.payment_method}: ${dataa
                                    .elementAt(index)
                                    .paymentMode ?? "Online"}",
                                    style: A_style_medium),
                                SizedBox(
                                  height: h / 70,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                  dataa
                                      .elementAt(index)
                                      .products!
                                      .length,
                                  itemBuilder: (context, indexx) {
                                    return

                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            orderlist.orderdeatils(dataa
                                                .elementAt(index)
                                                .sId!, dataa
                                                .elementAt(index)
                                                .products!
                                                .elementAt(indexx)
                                                .productId);
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  "$image_url${dataa
                                                      .elementAt(index)
                                                      .products!
                                                      .elementAt(indexx)
                                                      .image}",
                                                  fit: BoxFit.fill,
                                                  height: h / 10,
                                                  width: w / 6,
                                                ),
                                                SizedBox(
                                                  width: w / 50,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: h / 100,
                                                    ),
                                                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(width: w/4,
                                                          child: Text("${ AppLocalizations.of(context)!.orderstatus} : ",maxLines: 3,
                                                              style: TextStyle(
                                                                //letterSpacing: 1.5,
                                                                //color: Colors.white,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black,
                                                                  fontFamily: "Amazon_med",
                                                                  fontSize: 16)),
                                                        ),
                                                         Text(
                                                           dataa.elementAt(index).products!.elementAt(indexx).orderStatus.toString()=="0"?
                                                           AppLocalizations.of(context)!.pending:
                                                           dataa.elementAt(index).products!.elementAt(indexx).orderStatus.toString()=="2"?
                                                           AppLocalizations.of(context)!.confirmed:
                                                           dataa.elementAt(index).products!.elementAt(indexx).orderStatus.toString()=="3"?
                                                           AppLocalizations.of(context)!.packing:
                                                           dataa.elementAt(index).products!.elementAt(indexx).orderStatus.toString()=="4"?
                                                           AppLocalizations.of(context)!.shipped:
                                                           dataa.elementAt(index).products!.elementAt(indexx).orderStatus.toString()=="6"?
                                                           AppLocalizations.of(context)!.delivered:
                                                           dataa.elementAt(index).products!.elementAt(indexx).orderStatus.toString()=="5"?
                                                           AppLocalizations.of(context)!.not_delivered:
                                                           dataa.elementAt(index).products!.elementAt(indexx).orderStatus.toString()=="1"?
                                                           AppLocalizations.of(context)!.cancelled:

                                                           AppLocalizations.of(context)!.returned,


                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey,
                                                              fontSize: 17,
                                                              overflow: TextOverflow
                                                                  .ellipsis),
                                                          maxLines: 2,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                    Container(
                                                      padding:
                                                      const EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                        color:
                                                        const Color(0xff1455ac),
                                                      ),
                                                      child: Text(
                                                        "\$ ${dataa
                                                            .elementAt(index)
                                                            .products!
                                                            .elementAt(indexx)
                                                            .total}",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right),
                                                ),
                                                SizedBox(
                                                  height: h / 100,
                                                ),
                                              ]),
                                        ),
                                      );
                                  },
                                ),
                              ],
                            ),
                          );
                      }));
              },
            )
                :
            FutureBuilder(
              future: orderlist.orderlistfilter(empty[0]),
              builder: (context, snapshot) {
                return
                  snapshot.connectionState == ConnectionState.waiting ?
                  Center(child: CircularProgressIndicator(color: logocolo),) :
                  Obx(() =>
                  orderlist.orderlistt.isEmpty ?
                  Text("No order")
                      :
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderlist.orderlistt
                          .elementAt(0)
                          .data!
                          .length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var dataa = orderlist.orderlistt
                            .elementAt(0)
                            .data!;
                        return
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 3,
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h / 80,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: const Color(0xD7E2F1FF),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "${  AppLocalizations.of(context)!.order}#${dataa
                                          .elementAt(index)
                                          .orderId}",
                                      style: const TextStyle(
                                          color: Color(0xff1455ac),
                                          fontSize: 17,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 2,
                                    )),
                                SizedBox(
                                  height: h / 100,
                                ),
                                Text("${  AppLocalizations.of(context)!.orderdate} : ${dataa
                                    .elementAt(index)
                                    .orderDate!
                                    .substring(0, 10)} ${dataa
                                    .elementAt(index)
                                    .orderDate!
                                    .substring(11, 16)}",
                                    style: A_style_medium),
                                SizedBox(
                                  height: h / 100,
                                ),
                                Text("${  AppLocalizations.of(context)!.payment_method}: ${dataa
                                    .elementAt(index)
                                    .paymentMode ?? "Online"}",
                                    style: A_style_medium),
                                SizedBox(
                                  height: h / 70,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                  dataa
                                      .elementAt(index)
                                      .products!
                                      .length,
                                  itemBuilder: (context, indexx) {
                                    return

                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            orderlist.orderdeatils(dataa
                                                .elementAt(index)
                                                .sId!, dataa
                                                .elementAt(index)
                                                .products!
                                                .elementAt(indexx)
                                                .productId);
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  "$image_url${dataa
                                                      .elementAt(index)
                                                      .products!
                                                      .elementAt(indexx)
                                                      .image}",
                                                  fit: BoxFit.fill,
                                                  height: h / 10,
                                                  width: w / 6,
                                                ),
                                                SizedBox(
                                                  width: w / 50,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: h / 100,
                                                    ),
                                                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(width: w/4,
                                                          child: Text("${  AppLocalizations.of(context)!.orderstatus} : ",maxLines: 2,
                                                              style: TextStyle(
                                                                //letterSpacing: 1.5,
                                                                //color: Colors.white,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.black,
                                                                  fontFamily: "Amazon_med",
                                                                  fontSize: 16)),
                                                        ),
                                                        Text(
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "0"
                                                              ?
                                                          AppLocalizations.of(context)!.pending
                                                              :
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "1"
                                                              ?
                                                          AppLocalizations.of(context)!.cancel
                                                              :
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "2"
                                                              ?
                                                          AppLocalizations.of(context)!.confirmed
                                                              :
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "3"
                                                              ?
                                                          AppLocalizations.of(context)!.packing
                                                              :
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "4"
                                                              ?
                                                          AppLocalizations.of(context)!.shipped
                                                              :
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "5"
                                                              ?
                                                          AppLocalizations.of(context)!.not_delivered
                                                              :
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "6"
                                                              ?
                                                          AppLocalizations.of(context)!.delivered
                                                              :
                                                          dataa
                                                              .elementAt(index)
                                                              .products!
                                                              .elementAt(indexx)
                                                              .orderStatus
                                                              .toString() == "7"
                                                              ?
                                                          AppLocalizations.of(context)!.returned
                                                              : "",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey,
                                                              fontSize: 17,
                                                              overflow: TextOverflow
                                                                  .ellipsis),
                                                          maxLines: 2,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                    Container(
                                                      padding:
                                                      const EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                        color:
                                                        const Color(0xff1455ac),
                                                      ),
                                                      child: Text(
                                                        "\$ ${dataa
                                                            .elementAt(index)
                                                            .products!
                                                            .elementAt(indexx)
                                                            .total}",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: h / 80,
                                                    ),
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right),
                                                ),
                                                SizedBox(
                                                  height: h / 100,
                                                ),
                                              ]),
                                        ),
                                      );
                                  },
                                ),
                              ],
                            ),
                          );
                      }));
              },
            )

          ],
        ),
      ),
    );
  }
}
