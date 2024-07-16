import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:demo_innt/innt_vendor/view/screen/view_all.dart';
import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import '../Api/Homepage_api.dart';
import '../api_constant/get_vendorprofile_api.dart';
import '../models/shopOrder_count.dart';
import 'order/my_order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getVendorProfile = Get.put(fetchVendorProfile());

  final List<String> _dropdownItems = [
    'This week',
    'This month',
    'This year',
  ];

  final List<String> _dropdownBusinessItems = [
    'All',
    'Today',
    'This week',
    'This month',
    'This year',
  ];
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  final homepageapi = Get.put(homepageeList());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: FutureBuilder(
              future: getVendorProfile.vendorProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for the data
                  return Center(
                      child: Image.asset(
                    "assets/images/spinner.gif",
                    color: logocolo,
                  ));
                } else if (snapshot.hasError) {
                  // Display an error message if the future throws an error
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.hello,
                          ),
                          SizedBox(
                            width: w / 80,
                          ),
                          Text(
                            "${vendorProfileList[0]["firstName"]} ${vendorProfileList[0]["lastName"]}",
                            style: A_style_text_inside_button,
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                          ))
                    ],
                  );
                }
              }),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                     AppLocalizations.of(context)!.ongoing_orders,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black12, width: 1)),
                    child: Obx(
                      () => DropdownButton<String>(
                        dropdownColor: Colors.white,
                        underline: SizedBox(),
                        value: homepageapi.selectedBusinessItem.value,
                        items: _dropdownBusinessItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          homepageapi.selectedBusinessItem.value = newValue!;
                          setState(() {});
                        },
                      ),
                    ),
                  )
                ],
              ),
              StreamBuilder<List<ShopOrderCount>>(
                stream: Stream.fromFuture(homepageapi.ShopOrderCountList()),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? SizedBox()
                      : homepageapi.homelist1.isEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  SizedBox(
                                    height: h / 50,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.confirmed,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff024aac),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/confirm.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.packing,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xffe863c9),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/packing.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: h / 90),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.pending,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xffa6a6a6),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/pending.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.shipped,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xffec7c31),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/shipped.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: h / 50),
                                  Text(
                                    AppLocalizations.of(context)!.complete_orders,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  SizedBox(height: h / 50),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.delivered,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff00b150),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/delivered.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.not_delivered,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xffffc000),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/not_delivered.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: h / 90),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.cancelled,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xffff0000),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/cancel.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(() => OrderScreen());
                                        },
                                        child: Container(
                                          width: w / 2.2,
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                            top: 6,
                                            right: 8,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.grey.shade300),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("0",
                                                      style: Text_Lit_Bold),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(  AppLocalizations.of(context)!.returned,
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Color(0xff7030a0),
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16))
                                                ],
                                              ),
                                              Image.asset(
                                                "assets/images/return.png",
                                                height: 25,
                                                width: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ])
                          : Column(
                              children: [
                                SizedBox(
                                  height: h / 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.confirm}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.confirmed,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff024aac),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/confirm.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.packing}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.packing,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffe863c9),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/packing.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: h / 90),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.pending}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.pending,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffa6a6a6),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/pending.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.shipped}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.shipped,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffec7c31),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/shipped.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: h / 50),
                                Text(
                                  AppLocalizations.of(context)!.complete_orders,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(height: h / 50),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.delivered}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.delivered,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff00b150),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/delivered.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.notDelivered}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.not_delivered,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffffc000),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/not_delivered.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: h / 90),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.cancel}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.cancelled,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xffff0000),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/cancel.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => OrderScreen());
                                      },
                                      child: Container(
                                        width: w / 2.2,
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 6,
                                          right: 8,
                                          bottom: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${homepageapi.homelist1.elementAt(0).data!.returns}",
                                                    style: Text_Lit_Bold),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(  AppLocalizations.of(context)!.returned,
                                                    style: TextStyle(
                                                        //letterSpacing: 1.5,
                                                        //color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xff7030a0),
                                                        fontFamily:
                                                            "Amazon_med",
                                                        fontSize: 16))
                                              ],
                                            ),
                                            Image.asset(
                                              "assets/images/return.png",
                                              height: 25,
                                              width: 25,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                },
              ),
              Container(
                  color: Colors.white,
                  child: Column(children: [
                    Row(
                      children: [
                         Text(
                           AppLocalizations.of(context)!.earning_statistics,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                          child: Obx(() => DropdownButton<String>(
                                underline: const SizedBox(),
                                value: homepageapi.selectedItem.value,
                                items: _dropdownItems.map((String item) {
                                  return DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  homepageapi.selectedItem.value = newValue!;
                                  setState(() {});
                                },
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h / 90,
                    ),
                    FutureBuilder(
                      future: homepageapi.earminggragh(),
                      builder: (context, snapshot) {
                        return homepageapi.earninglist.isNotEmpty
                            ? SfCartesianChart(
                                legend: Legend(isVisible: true),
                                primaryXAxis: CategoryAxis(
                                  labelRotation: 90,
                                  title: AxisTitle(
                                      text:
                                          "${homepageapi.selectedItem.value}"),

                                  //rangePadding: ChartRangePadding.additional,
                                  labelStyle: TextStyle(
                                    // color: Colors.deepOrange,
                                    fontFamily: 'Roboto',
                                    fontSize: 8,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                primaryYAxis: NumericAxis(),
                                palette: [logocolo, Colors.deepOrangeAccent],
                                series: [
                                  ColumnSeries(
                                      name:   AppLocalizations.of(context)!.totalsales,
                                      dataSource: homepageapi
                                          .earninglist[0]["data"].entries
                                          .toList(),
                                      xValueMapper: (datum, _) => datum.key,
                                      yValueMapper: (datum, _) =>
                                          datum.value['totalSales'],
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: false,
                                        labelPosition:
                                            ChartDataLabelPosition.outside,
                                        textStyle: TextStyle(fontSize: 12),

                                      )

                                      // Custom data label

                                      //           //dataLabelSettings: DataLabelSettings(isVisible: true),
                                      ),
                                  ColumnSeries(
                                      name: 'Commission',
                                      dataSource: homepageapi
                                          .earninglist[0]["data"].entries
                                          .toList(),
                                      xValueMapper: (datum, _) => datum.key,
                                      yValueMapper: (datum, _) =>
                                          datum.value['commission'],
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: false,
                                        labelPosition:
                                            ChartDataLabelPosition.outside,
                                        textStyle: TextStyle(fontSize: 12),

                                      )
                                  )
                                ],
                                tooltipBehavior: TooltipBehavior(
                                  enable: true,
                                 ),
                              )
                            : Center(
                                child: Container(
                                    height: h / 3,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.shade300,
                                              blurRadius: 2)
                                        ]),
                                    child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        series: <LineSeries<_SalesData,
                                            String>>[
                                          LineSeries<_SalesData, String>(
                                              dataSource: <_SalesData>[
                                                _SalesData('Jan', 35),
                                                _SalesData('Feb', 28),
                                                _SalesData('Mar', 34),
                                                _SalesData('Apr', 32),
                                                _SalesData('May', 40)
                                              ],
                                              xValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.sales)
                                        ])));
                      },
                    ),
                  ])),
              SizedBox(
                height: h / 50,
              ),
              FutureBuilder(
                  future: homepageapi.topSale_productList(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? SizedBox()
                        : homepageapi.homelist3.isEmpty
                            ? SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                     Text(
                                       AppLocalizations.of(context)!.top_selling_products,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => const ViewAll());
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.view_all,
                                        style: TextStyle(
                                            //letterSpacing: 1.5,
                                            //color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                            color: kSecondryColor,
                                            fontFamily: "Amazon_med",
                                            fontSize: 16),
                                      ),
                                    )
                                  ]),
                                  SizedBox(
                                    height: h / 50,
                                  ),
                                  GridView.builder(
                                      itemBuilder: (context, index) {
                                        return Container(
                                            height: h / 3,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.grey.shade300,
                                                      blurRadius: 3)
                                                ]),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  "$image_url${homepageapi.homelist3.elementAt(0)["data"][index]["image"].toString()}",
                                                  fit: BoxFit.fitHeight,
                                                  height: h / 5,
                                                  width: w / 2,
                                                ),
                                                Text(
                                                  homepageapi.homelist3
                                                          .elementAt(0)["data"]
                                                      [index]["product_name"],
                                                  style: A_style_order,
                                                ),
                                                SizedBox(
                                                  height: h / 100,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: kSecondryColor),
                                                  child: Text(
                                                    "${homepageapi.homelist3.elementAt(0)["data"][index]["sold"]} ${AppLocalizations.of(context)!.sold}",
                                                    style: A_style_medium_White,
                                                  ),
                                                )
                                              ],
                                            ));
                                      },
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: homepageapi.homelist3
                                          .elementAt(0)["data"]
                                          .length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio:
                                            MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    1.5),
                                      )),
                                ],
                              );
                  }),
              SizedBox(
                height: h / 50,
              ),
              Text(
                AppLocalizations.of(context)!.shop_highlights,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              SizedBox(
                height: h / 50,
              ),
              StreamBuilder(
                  stream: Stream.fromFuture(homepageapi.shopHigh_lightList()),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? SizedBox()
                        : homepageapi.homelist2.isEmpty
                            ? SizedBox()
                            : IntrinsicHeight(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: w / 3.5,
                                        height: h / 7,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.grey.shade300)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.rating,
                                              style: A_style_mid_black,
                                            ),
                                            SizedBox(
                                              height: h / 60,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    size: 20,
                                                    color:
                                                        Colors.yellow.shade800),
                                                Icon(Icons.star,
                                                    size: 20,
                                                    color:
                                                        Colors.yellow.shade800),
                                                Icon(Icons.star,
                                                    size: 20,
                                                    color:
                                                        Colors.yellow.shade800),
                                                Icon(Icons.star,
                                                    size: 20,
                                                    color:
                                                        Colors.yellow.shade800),
                                                Icon(Icons.star,
                                                    size: 20,
                                                    color:
                                                        Colors.yellow.shade800),
                                              ],
                                            ),
                                            SizedBox(
                                              height: h / 60,
                                            ),
                                            Text(
                                              "1356",
                                              style: A_style_mid_black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: w / 3.5,
                                        height: h / 7,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.grey.shade300)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.products,
                                              style: A_style_mid_black,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Image.asset(
                                              "assets/images/products.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Text(
                                              "${homepageapi.homelist2.elementAt(0)["data"]["products_count"]}",
                                              style: A_style_mid_black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: w / 3.5,
                                        height: h / 7,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.grey.shade300)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.sales,
                                              style: A_style_mid_black,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Image.asset(
                                              "assets/images/sales.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Text(
                                              "${homepageapi.homelist2.elementAt(0)["data"]["sales_count"]}",
                                              style: A_style_mid_black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: w / 3.5,
                                        height: h / 7,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.grey.shade300)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.page_views,
                                              style: A_style_mid_black,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Image.asset(
                                              "assets/images/eyes.png",
                                              height: 20,
                                              width: 20,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Text(
                                              "${homepageapi.homelist2.elementAt(0)["data"]["view_count"]}",
                                              style: A_style_mid_black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: w / 3.5,
                                        height: h / 7,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: Colors.grey.shade300)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)!.liked_items,
                                              style: A_style_mid_black,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Icon(
                                              Icons.favorite,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            Text(
                                              "${homepageapi.homelist2.elementAt(0)["data"]["like_count"]}",
                                              style: A_style_mid_black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                  }),
            ],
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
