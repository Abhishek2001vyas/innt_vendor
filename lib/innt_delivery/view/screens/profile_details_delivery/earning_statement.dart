import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../../../../innt_vendor/view/screen/order/order_details.dart';
import '../../../Api/earning.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/text2.dart';
import '../../../ulits/constant.dart';

class EarningStatement extends StatefulWidget {
  const EarningStatement({super.key});

  @override
  State<EarningStatement> createState() => _EarningStatementState();
}



class _EarningStatementState extends State<EarningStatement> {
  dynamic empty = [0];
  List order = [
    "All order",
    "Today's",
    "This week",
    "This month",
  ];
 final earningdriverr= Get.put(earningdriver());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: true,
          foregroundColor: logocolo,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.earning_statement,
            style: Text_Bold,
          )),
      body: SingleChildScrollView(
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
                            borderRadius: BorderRadius.circular(25),
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
            empty[0]!=0?
            FutureBuilder(future: earningdriverr.earninglistsfiter(empty[0]), builder: (context, snapshot) {
              return
                snapshot.connectionState==ConnectionState.waiting?
                Center(child: CircularProgressIndicator(),):
                Obx(() =>
                earningdriverr.earninglistfiter.isEmpty?
                Text("No earning"):
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: earningdriverr.earninglistfiter[0]["data"].length,
                  itemBuilder: (BuildContext context, int index) {
                    var dataa=earningdriverr.earninglistfiter[0]["data"][index];
                    return InkWell(
                      onTap: () {
                        //Get.to(() => const OrderDetails());
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${AppLocalizations.of(context)!.order_id}: ${dataa["orderId"]}",
                                  style: TextStyle(
                                    fontFamily: "Ember_Bold",
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  dataa["paymentMode"],
                                  style: TextStyle(
                                    fontFamily: "Ember_Bold",
                                    color: logocolo,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 18,
                                  color: logocolo,
                                ),
                                SizedBox(
                                  width: w / 80,
                                ),
                                Text(
                                  dataa["date"].toString().substring(0,10)+" "+dataa["date"].toString().substring(11,16),
                                  style: TextStyle(
                                    fontFamily: "Ember",
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "\$${dataa["earn_amount"]}",
                                  style: TextStyle(
                                    fontFamily: "Ember",
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: const Color(0xffedf2f8),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: logocolo, width: 1)),
                                child: Text(
                                  "View Details",
                                  style: A_style_mid_black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ));
            },)
            :
            FutureBuilder(future: earningdriverr.earninglists(), builder: (context, snapshot) {
              return
              snapshot.connectionState==ConnectionState.waiting?
              Center(child: CircularProgressIndicator(),):
              Obx(() =>
                  earningdriverr.earninglist.isEmpty?
                      Text("No earning"):
                ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: earningdriverr.earninglist[0]["data"].length,
                itemBuilder: (BuildContext context, int index) {
                  var dataa=earningdriverr.earninglist[0]["data"][index];
                  return InkWell(
                    onTap: () {
                       //Get.to(() => const OrderDetails());
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               Text(
                                "${AppLocalizations.of(context)!.order_id}: ${dataa["orderId"]}",
                                style: TextStyle(
                                  fontFamily: "Ember_Bold",
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                               Text(
                                 dataa["paymentMode"],
                                style: TextStyle(
                                  fontFamily: "Ember_Bold",
                                  color: logocolo,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 18,
                                color: logocolo,
                              ),
                              SizedBox(
                                width: w / 80,
                              ),
                              Text(
                               dataa["date"].toString().substring(0,10)+" "+dataa["date"].toString().substring(11,16),
                                style: TextStyle(
                                  fontFamily: "Ember",
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "\$${dataa["earn_amount"]}",
                                style: TextStyle(
                                  fontFamily: "Ember",
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: const Color(0xffedf2f8),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: logocolo, width: 1)),
                              child: Text(
                                "View Details",
                                style: A_style_mid_black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
            },)

          ],
        ),
      ),
    );
  }
}
