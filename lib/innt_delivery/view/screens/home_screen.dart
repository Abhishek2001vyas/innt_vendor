import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Api/getprofile.dart';
import '../../Api/homeapi.dart';
import '../../Api/orderlist.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import '../../auth_delivery/order_status.dart';
import '../../ulits/constant.dart';
import 'accepted_order_map_screen.dart';
import 'map_screen.dart';
import 'mywallet.dart';

class HomeScreenDel extends StatefulWidget {
  const HomeScreenDel({super.key});

  @override
  State<HomeScreenDel> createState() => _HomeScreenDelState();
}

final orderlist = Get.put(orderapi());

class _HomeScreenDelState extends State<HomeScreenDel> {
  bool isDarkMode = false;

  @override
  void initState() {
    //  getCurrentLocation();
    // _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  final getprofile = Get.put(driverProfile());
  final homepageapi = Get.put(Homepageapi());

  // late TooltipBehavior _tooltipBehavior;
  late LatLng currentLocation;
  String currentAddress = '';



  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // forceMaterialTransparency: true,
        // automaticallyImplyLeading: false,
        backgroundColor: logocolo,

        title: FutureBuilder(
          future: getprofile.driverrProfile(),
          builder: (context, snapshot) {
            return getprofile.driveprofilee.isNotEmpty
                ? Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          "${image_url}${getprofile.driveprofilee[0]["data"]["frontId_iamge"].toString()}",
                        ),
                      ),
                      SizedBox(
                        width: w / 25,
                      ),
                      Text(
                        "${  AppLocalizations.of(context)!.hello} ${getprofile.driveprofilee[0]["data"]["fname"].toString()} ${getprofile.driveprofilee[0]["data"]["lname"].toString()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ember"),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Text("");
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 90,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                   Text(
                     AppLocalizations.of(context)!.available_for_delivery,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontFamily: "Amazon_med",
                        fontSize: 18),
                  ),
                  const Spacer(),
                  StreamBuilder(
                      stream: Stream.periodic(Duration(
                        milliseconds: 0,
                      )).asyncMap((i) => getprofile.driverrProfile()),
                      builder: (context, snapshot) {
                        return FlutterSwitch(
                          width: 55.0,
                          height: 25.0,
                          valueFontSize: 15.0,
                          toggleSize: 15.0,
                          value: getprofile.driveprofilee[0]["data"]
                                          ["active_status"]
                                      .toString() ==
                                  '0'
                              ? false
                              : true,
                          borderRadius: 30.0,
                          padding: 4.0,
                          showOnOff: true,
                          activeColor: logocolo,
                          inactiveColor: Colors.grey,
                          onToggle: (bool value) {
                            getprofile.activestatus();
                          },
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              height: h / 90,
            ),
            FutureBuilder(
              future: homepageapi.homepagefunction(),
              builder: (context, snapshot) {
                return Obx(() => homepageapi.homepagelist.isNotEmpty
                    ? Column(children: [
                        Container(
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
                                     AppLocalizations.of(context)!.main_balance,
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
                                                    AppLocalizations.of(context)!.cash_in_hand,
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
                                                    AppLocalizations.of(context)!.pending_withdrawal,
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
                              SizedBox(
                                height: h / 90,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const MyWallet());
                                },
                                child: Row(
                                  children: [
                                    const Spacer(),
                                     Text(
                                       AppLocalizations.of(context)!.go_to_wallet,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white,
                                          fontFamily: "Amazon_med",
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: w / 90,
                                    ),
                                    Image.asset(
                                      "assets/images/wallet_check.png",
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h / 90,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h / 90,
                        ),
                        Container(
                          height: h / 2.1,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300, blurRadius: 3)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                textAlign: TextAlign.start,
                                 AppLocalizations.of(context)!.orderstatus,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ember"),
                              ),
                              SizedBox(
                                height: h / 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                        //  Get.to(const OrderStatus());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: color1,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!.delivered,
                                                style: A_style_medium,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Image.asset(
                                                "assets/images/delivered.png",
                                                width: 30,
                                                height: 30,
                                                // color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text(
                                                "${homepageapi.homepagelist[0]['data']["deliveredCount"]}",
                                                style: Text_Lit_Bold,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 50,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                         // Get.to(const OrderStatus());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: color2,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!.pending_delivery,
                                                style: A_style_medium,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Image.asset(
                                                "assets/images/pending.png",
                                                width: 30,
                                                height: 30,
                                                // color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text(
                                                "${homepageapi.homepagelist[0]['data']["pendingCount"]}",
                                                style: Text_Lit_Bold,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h / 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          //Get.to(const OrderStatus());
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(2),
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: color3,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!.cancelled,
                                                  style: A_style_medium,
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: h / 90,
                                                ),
                                                Image.asset(
                                                  "assets/images/cancel.png",
                                                  width: 30,
                                                  height: 30,
                                                  // color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: h / 90,
                                                ),
                                                Text(
                                                  "${homepageapi.homepagelist[0]['data']["cancelCount"]}",
                                                  style: Text_Lit_Bold,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 50,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: color4,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!.returns,
                                                style: A_style_medium,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Image.asset(
                                                "assets/images/return.png",
                                                width: 30,
                                                height: 30,
                                                // color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text(
                                                "${homepageapi.homepagelist[0]['data']["returnCount"]}",
                                                style: Text_Lit_Bold,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])
                    : Column(children: [
                        Container(
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
                                    AppLocalizations.of(context)!.main_balance,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontFamily: "Amazon_med",
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: h / 70,
                                  ),
                                  const Text(
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
                                                    AppLocalizations.of(context)!.cash_in_hand,
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
                                                    AppLocalizations.of(context)!.pending_withdrawal,
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
                              SizedBox(
                                height: h / 90,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const MyWallet());
                                },
                                child: Row(
                                  children: [
                                    const Spacer(),
                                     Text(
                                      AppLocalizations.of(context)!.go_to_wallet,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white,
                                          fontFamily: "Amazon_med",
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: w / 90,
                                    ),
                                    Image.asset(
                                      "assets/images/wallet_check.png",
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h / 90,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: h / 90,
                        ),
                        Container(
                          height: h / 2.1,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300, blurRadius: 3)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                textAlign: TextAlign.start,
                                 AppLocalizations.of(context)!.orderstatus,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ember"),
                              ),
                              SizedBox(
                                height: h / 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                        //  Get.to(const OrderStatus());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: color1,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!.delivered,
                                                style: A_style_medium,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Image.asset(
                                                "assets/images/delivered.png",
                                                width: 30,
                                                height: 30,
                                                // color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text(
                                                "0",
                                                style: Text_Lit_Bold,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 50,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                        //  Get.to(const OrderStatus());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: color2,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!.pending_delivery,
                                                style: A_style_medium,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Image.asset(
                                                "assets/images/pending.png",
                                                width: 30,
                                                height: 30,
                                                // color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text(
                                                "0",
                                                style: Text_Lit_Bold,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: h / 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                        //  Get.to(const OrderStatus());
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.all(2),
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: color3,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!.cancelled,
                                                  style: A_style_medium,
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                  height: h / 90,
                                                ),
                                                Image.asset(
                                                  "assets/images/cancel.png",
                                                  width: 30,
                                                  height: 30,
                                                  // color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: h / 90,
                                                ),
                                                Text(
                                                  "0",
                                                  style: Text_Lit_Bold,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 50,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: color4,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppLocalizations.of(context)!.returns,
                                                style: A_style_medium,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Image.asset(
                                                "assets/images/return.png",
                                                width: 30,
                                                height: 30,
                                                // color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: h / 90,
                                              ),
                                              Text(
                                                "0",
                                                style: Text_Lit_Bold,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]));
              },
            ),
            SizedBox(
              height: h / 70,
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                textAlign: TextAlign.start,
                AppLocalizations.of(context)!.new_orders,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Ember"),
              ),
            ),
            newOrder(h, w),
          ],
        ),
      ),
    );
  }

  _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        double w = MediaQuery.of(context).size.width;
        double h = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: const Center(child: Text('Do you want to proceed order')),
          titleTextStyle: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          content: const Text(
            'Do you want to proceed order',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const MapScreen(
                          destination: 'Indore',
                        ));
                  },
                  child: Container(
                      height: h / 20,
                      width: w / 4,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                          child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      height: h / 20,
                      width: w / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: const Center(
                          child: Text(
                        'No',
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ))),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

StreamBuilder newOrder(double h, double w) {
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
                        return InkWell(
                          onTap: () {
                            // Get.to(const AcceptedOrderMapScreen(
                            //   destination: 'indore',
                            // ));
                            // if(index == 0){
                            //   Get.to(() => const OrderStatusDelivered());
                            //
                            // }else if(index == 1) {
                            //   Get.to(() => const MapScreen(destination: 'indore',));
                            // }else if(index == 2) {
                            //   Get.to(() => const OrderStatusCancelled());
                            // }
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 50),
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
                                                      decoration: BoxDecoration(
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
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
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
                                                      Text(
                                                        AppLocalizations.of(context)!.view_on_map,
                                                        style:
                                                            A_style_order_status_blue,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
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
                                                      Text(
                                                        AppLocalizations.of(context)!.view_on_map,
                                                        style:
                                                            A_style_order_status_blue,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
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
                                                      fontFamily: "Ember_Bold",
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
                                                            dataa['_id'], "1");
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
                                                      style: TextStyle(
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
                                                    orderRejectDialog(
                                                        context, dataa["_id"]);
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
                          ),
                        );
                      },
                    )
                  : Center(
                    child: SizedBox(
                              height: h/20,
                              child: Text('No new order')),
                  ));
    },
  );
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class StepData {
  final String title;
  final String? subtitle;
  final String date;

  final String? assetImage;

  StepData({
    required this.title,
    this.subtitle,
    required this.date,
    this.assetImage,
  });
}

void showOrderCancelDialog(BuildContext context) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Cancel Order')),
        titleTextStyle: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        content: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: "Are you sure you\'d like to cancel this order? ",
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                text: 'This action cannot be undone.',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  //  Get.to(() => const Navgationbar());

                  // String res = await serviceProvider.orderCancelApi(data);
                  // if (res.toString() == "done") {
                  //   Fluttertoast.showToast(
                  //       msg: "Order successfully Cancelled");
                  //   Navigator.of(context).pop(); // Close the dialog
                  // } else {
                  //   Fluttertoast.showToast(
                  //       msg: "Somthing went wrong try again letter");
                  //   Navigator.of(context).pop(); // Close the dialog
                  // }
                },
                child: Container(
                    height: h / 20,
                    width: w / 3,
                    decoration: BoxDecoration(
                      color: logocolo,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Text(
                      'Yes, Cancel',
                      style: TextStyle(color: Colors.white),
                    ))),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    height: h / 20,
                    width: w / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: logocolo,
                        )),
                    child: const Center(
                        child: Text(
                      'No',
                      style: TextStyle(
                        color: logocolo,
                      ),
                    ))),
              ),
            ],
          )
        ],
      );
    },
  );
}

orderRejectDialog(BuildContext context, id) async {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: h / 5,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Are you sure you want to reject this order?',
                style: A_style_medium,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
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
                  width: w / 4,
                  height: 40,
                  decoration: BoxDecoration(
                      color: logocolo, borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await orderlist.acceptorreject(id, "2");
                  orderRejectedDialog(context);

                  Get.back();
                  Future.delayed(
                    Duration(seconds: 2),
                    () {
                      Get.back();
                    },
                  );
                },
                child: Container(
                  width: w / 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: customColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Ember_Bold",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 80,
          )
        ],
      );
    },
  );
}

orderRejectedDialog(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final h = MediaQuery.of(context).size.height;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.white,
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 40,
              ),
              Center(
                child: Text(
                  "Order rejected",
                  style: A_style_medium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: h / 40,
              ),
              Image.asset(
                "assets/images/successfully-unscreen.gif",
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              SizedBox(
                height: h / 40,
              ),
            ],
          )
        ],
      );
    },
  );
}
