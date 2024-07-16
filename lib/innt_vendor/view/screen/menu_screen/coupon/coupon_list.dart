import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../Api/Addcoupen_api.dart';
import '../../bottom_navigationbar.dart';

class CouponList extends StatefulWidget {
  const CouponList({super.key});

  @override
  State<CouponList> createState() => _CouponListState();
}

class _CouponListState extends State<CouponList> {
  bool isDarkMode = false;
  final addcoupen = Get.put(Add_coupen());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                currentTab = 4;
              });
              Get.offAll(DashboardScreenVendor());
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.coupon_list,
        ),
        actions: [
          IconButton(
            onPressed: () {
              addcoupen.Categories();
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            FutureBuilder(
              future: addcoupen.coupenlist(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: Image.asset(
                        "assets/images/spinner.gif",
                        color: logocolo,
                      ))
                    : Obx(() => addcoupen.coupenlistt
                            .elementAt(0)
                            .data
                            .isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                addcoupen.coupenlistt.elementAt(0).data!.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              var dataa =
                                  addcoupen.coupenlistt.elementAt(0).data!;
                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 3.0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset("assets/images/coupon.png",
                                        height: h / 20,
                                        width: w / 10,
                                        fit: BoxFit.cover),
                                    SizedBox(
                                      width: w / 100,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataa
                                                      .elementAt(index)
                                                      .discountType
                                                      .toString() ==
                                                  "Percentage % off"
                                              ? "${dataa.elementAt(index).discountAmount}% ${  AppLocalizations.of(context)!.discountonpurchase}"
                                              : "\$ ${dataa.elementAt(index).discountAmount} ${  AppLocalizations.of(context)!.discountonpurchase}",
                                          style: A_style_medium,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: h / 200,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.discountonpurchase,
                                          style: A_style_mid,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: h / 200,
                                        ),
                                        Text(
                                          "${dataa.elementAt(index).couponCode}",
                                          style: TextStyle(
                                              letterSpacing: 1,
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontFamily: "Ember_Bold"),
                                        ),
                                        SizedBox(
                                          height: h / 100,
                                        ),
                                        Text(
                                          "${dataa.elementAt(index).startDate} - ${dataa.elementAt(index).expireDate}",
                                          style: A_style_mid,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: h / 100,
                                        ),
                                      ],
                                    ),
                                    FlutterSwitch(
                                      width: 45.0,
                                      height: 25.0,
                                      valueFontSize: 15.0,
                                      toggleSize: 15.0,
                                      value: dataa.elementAt(index).actStatus ==
                                              "1"
                                          ? false
                                          : true,
                                      borderRadius: 30.0,
                                      padding: 4.0,
                                      showOnOff: true,
                                      activeText:  AppLocalizations.of(context)!.on,
                                      activeTextColor: Colors.white,
                                      inactiveText:   AppLocalizations.of(context)!.off,
                                      inactiveTextColor: Colors.black,
                                      activeColor: logocolo,
                                      // Set custom colors for light and dark mode
                                      inactiveColor: Colors.grey,
                                      onToggle: (bool value) async {
                                        await addcoupen.changePromotion_status(
                                            dataa.elementAt(index).id);
                                        // Future.delayed(Duration(seconds: 1));
                                        await addcoupen.coupenlist();
                                        setState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              );
                            })
                        : Text("No Coupen"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
