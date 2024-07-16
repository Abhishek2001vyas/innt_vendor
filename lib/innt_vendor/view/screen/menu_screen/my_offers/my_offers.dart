import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../Api/offer.dart';
import '../menu.dart';
import 'add_offers.dart';
import 'edit_offer.dart';

class MyOffers extends StatefulWidget {
  const MyOffers({super.key});

  @override
  State<MyOffers> createState() => _MyOffersState();
}

class _MyOffersState extends State<MyOffers> {
  late bool isDarkMode = false;

  final myoffer = Get.put(Seller_offer_api());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.my_offers),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AddOffers());
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: h / 20,
            //   width: w,
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.all(8),
            //         hintText: "Search in product list",
            //         prefixIcon: Icon(Icons.search, color: Colors.black),
            //         filled: true,
            //         border: OutlineInputBorder(
            //             borderSide: BorderSide.none,
            //             borderRadius: BorderRadius.circular(7))),
            //   ),
            // ),
            // SizedBox(
            //   height: h / 100,
            // ),
            FutureBuilder(
              future: myoffer.offer_list(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: myoffer.offerlist[0]["data"].length,
                        itemBuilder: (BuildContext context, int index) {
                          var dataa = myoffer.offerlist[0]["data"][index];

                          return InkWell(
                            onTap: () {
                              //  Get.to(() => const ProductDetails());
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 4.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            "$image_url${dataa["productId"]["image1"]}",
                                            height: 100,
                                            width: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: w / 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: h / 90,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: w / 2,
                                                child: Text(
                                                  "${dataa["productId"]["product_name"]}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Ember",
                                                    fontSize: 17,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              FlutterSwitch(
                                                width: 40.0,
                                                height: 22.0,
                                                valueFontSize: 12.0,
                                                toggleSize: 15.0,
                                                value: dataa["offer_status"]
                                                            .toString() ==
                                                        "0"
                                                    ? false
                                                    : true,
                                                borderRadius: 30.0,
                                                padding: 2.0,
                                                showOnOff: false,
                                                inactiveColor: Colors.grey,
                                                activeColor: logocolo,
                                                onToggle: (bool value) async {
                                                  await myoffer.offer_status(
                                                      dataa["_id"]);
                                                  setState(() {});
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h / 90,
                                          ),
                                          Text(
                                            dataa["offerType"],
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Ember",
                                              fontSize: 17,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 2,
                                          ),
                                          SizedBox(
                                            height: h / 80,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .approved,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontFamily: "Ember_Bold"),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(
                                                width: w / 3.7,
                                              ),
                                              Container(
                                                child: PopupMenuButton(
                                                  color: Colors.white,
                                                  surfaceTintColor:
                                                      Colors.white,
                                                  icon: Icon(
                                                    Icons.more_horiz,
                                                    color: Colors.black,
                                                  ),
                                                  itemBuilder: (_) {
                                                    return <PopupMenuEntry<
                                                        String>>[
                                                      PopupMenuItem<String>(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              EditOffer());
                                                        },
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        value: 'Edit',
                                                        child: Row(
                                                          children: [
                                                            Text(AppLocalizations
                                                                    .of(context)!
                                                                .edit),
                                                            Spacer(),
                                                            Icon(
                                                              Icons.edit,
                                                              size: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      PopupMenuDivider(),
                                                      PopupMenuItem<String>(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        value: 'Share',
                                                        child: Row(
                                                          children: [
                                                            Text(AppLocalizations
                                                                    .of(context)!
                                                                .share),
                                                            Spacer(),
                                                            Image.asset(
                                                              "assets/images/share.png",
                                                              height: 20,
                                                              width: 20,
                                                              fit: BoxFit.cover,
                                                              color:
                                                                  Colors.black,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      PopupMenuDivider(),
                                                      PopupMenuItem<String>(
                                                        onTap: () async {
                                                          //  Navigator.pop(context);
                                                          await myoffer
                                                              .offer_delete(
                                                                  dataa["_id"]);
                                                          setState(() {});
                                                        },
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        value: 'Delete',
                                                        child: Row(
                                                          children: [
                                                            Text(AppLocalizations
                                                                    .of(context)!
                                                                .delete),
                                                            Spacer(),
                                                            Icon(
                                                              Icons.delete,
                                                              size: 20,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ];
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
              },
            ),
            SizedBox(
              height: h / 70,
            ),
          ],
        ),
      ),
    );
  }
}
