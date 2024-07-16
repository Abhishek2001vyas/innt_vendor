import 'package:demo_innt/innt_delivery/view/screens/withdrawal_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Api/homeapi.dart';
import '../../Api/wallet.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../ulits/constant.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final homepageapi = Get.put(Homepageapi());
  final walletapi = Get.put(Delivery_wallet_api());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // forceMaterialTransparency: true,
          // centerTitle: true,
          backgroundColor: logocolo,
          title: Center(
            child: Text(
              "My Wallet",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: "Ember"),
              textAlign: TextAlign.center,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: h / 90,
              ),
              FutureBuilder(
                future: homepageapi.homepagefunction(),
                builder: (context, snapshot) {
                  return Obx(() => homepageapi.homepagelist.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: logocolo,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300, blurRadius: 3)
                              ]),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Main Balance",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontFamily: "Amazon_med",
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: h / 70,
                                  ),
                                  Text(
                                    "${homepageapi.homepagelist[0]['data']["balance"] ?? "00"} CFA",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontFamily: "Amazon_med",
                                        fontSize: 22),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h / 50,
                              ),
                              SizedBox(
                                height: h / 9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    blurRadius: 2)
                                              ],
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${homepageapi.homepagelist[0]['data']["delivereCash_collect"]} CFA",
                                                    style: Text_Lit_Bold,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: h / 90,
                                                  ),
                                                  Text(
                                                    " Cash in hand",
                                                    style: A_style_medium,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    blurRadius: 2)
                                              ],
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "${homepageapi.homepagelist[0]['data']["Withdraw_Pending_amount"]} CFA",
                                                    style: Text_Lit_Bold,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: h / 90,
                                                  ),
                                                  Text(
                                                    " Pending withdrawal",
                                                    style: A_style_medium,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: logocolo,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300, blurRadius: 3)
                              ]),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Main Balance",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontFamily: "Amazon_med",
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: h / 70,
                                  ),
                                  Text(
                                    "000 CFA",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontFamily: "Amazon_med",
                                        fontSize: 22),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h / 50,
                              ),
                              SizedBox(
                                height: h / 9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    blurRadius: 2)
                                              ],
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "00.00 CFA",
                                                    style: Text_Lit_Bold,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: h / 90,
                                                  ),
                                                  Text(
                                                    " Cash in hand",
                                                    style: A_style_medium,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade200,
                                                    blurRadius: 2)
                                              ],
                                              border: Border.all(
                                                color: Colors.grey.shade200,
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "00.00 CFA",
                                                    style: Text_Lit_Bold,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: h / 90,
                                                  ),
                                                  Text(
                                                    " Pending withdrawal",
                                                    style: A_style_medium,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                },
              ),
              SizedBox(
                height: h / 90,
              ),
              InkWell(
                onTap: () {
                  Get.to(WithdrawalRequest());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    height: 50.0,
                    width: w,
                    decoration: BoxDecoration(
                        color: logocolo,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: const Center(
                      child: Text(
                        "Send a Withdraw Request",
                        style: TextStyle(
                            fontFamily: "Ember_Light",
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 90,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  textAlign: TextAlign.start,
                  "Transaction history",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontFamily: "Amazon_med",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: h / 90,
              ),
              FutureBuilder(
                future: walletapi.transactionhistroy(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(color: logocolo),
                        )
                      : snapshot.hasError
                          ? Center(
                              child: Text("No data"),
                            )
                          : Obx(() => walletapi.wallethistroy.isNotEmpty
                              ? ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      walletapi.wallethistroy[0]['data'].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var dataa = walletapi.wallethistroy[0]
                                        ['data'][index];
                                    return Column(
                                      children: [
                                        Container(
                                          // margin: const EdgeInsets.all(5) ,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 10),
                                          margin: const EdgeInsets.only(
                                              left: 5, right: 5, top: 5),
                                          // padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5.0),
                                                  topRight:
                                                      Radius.circular(5.0)),
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 2)),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Transaction ID: $index",
                                                style: A_style_order_status,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              Spacer(),
                                              Container(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFd9e4f2),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.0)),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 3.0),
                                                    child: Text(
                                                      'CAF ${dataa["amount"]}',
                                                      style:
                                                          A_style_order_status_blue,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 10),
                                          margin: const EdgeInsets.only(
                                              left: 5, right: 5, bottom: 5),
                                          // padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10),
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(5.0),
                                                  bottomRight:
                                                      Radius.circular(5.0)),
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 2)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Date : ",
                                                    style: A_style_order_status,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    "${dataa["createdAt"].toString().substring(0, 10)}  ${dataa["createdAt"].toString().substring(11, 16)}",
                                                    style: A_style_order_status,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: h / 120,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Transaction type : ",
                                                    style: A_style_order_status,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    "Withdrawal",
                                                    style: A_style_order_status,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: h / 120,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Status : ",
                                                    style: A_style_order_status,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                  const Spacer(),
                                                  const Text(
                                                    "Accepted",
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 13),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              : Text("No histroy"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
