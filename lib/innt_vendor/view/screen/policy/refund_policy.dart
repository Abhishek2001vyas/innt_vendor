import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/return.dart';
import '../request_order.dart';

class RefundPolicy extends StatefulWidget {
  const RefundPolicy({super.key});

  @override
  State<RefundPolicy> createState() => _RefundPolicyState();
}

dynamic empty = [0];
List refund = ["Pending", "Approved",  "Refunded", "Rejected"];

class _RefundPolicyState extends State<RefundPolicy> {

  final returnn =Get.put(Seller_retunorder_api());
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
            AppLocalizations.of(context)!.refund_requests
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 16,
              child: ListView.builder(
                  itemCount: refund.length,
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
                          refund[index].toString(),
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
            SizedBox(
              height: h / 90,
            ),
FutureBuilder(future: returnn.return_list(empty[0]), builder: (context, snapshot) {
  return
    snapshot.connectionState == ConnectionState.waiting ?
    Center(child: CircularProgressIndicator(color: logocolo),) :
    Obx(() =>
    returnn.retunorderlist.isEmpty ?
  Text("No order"):

    ListView.builder(
      physics: const ScrollPhysics(),
      itemCount: 15,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              Get.to(() => const RequestOrder());
            },
            child: Container(
              padding: const EdgeInsets.all(4),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${AppLocalizations.of(context)!.order}",
                                  style: TextStyle(
                                      color: logocolo,
                                      fontSize: 17,
                                      overflow:
                                      TextOverflow.ellipsis),
                                  maxLines: 2,
                                ),
                                Text(
                                  " 100134",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      overflow:
                                      TextOverflow.ellipsis),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/images/bag.png",
                              fit: BoxFit.fill,
                              height: h / 10,
                              width: w / 6,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h / 40,
                            ),
                            Text("Women bag", style: A_style_medium),
                            SizedBox(
                              height: h / 80,
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(4),
                                color: const Color(0xff1455ac),
                              ),
                              child: const Text(
                                "\$380.00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              height: h / 80,
                            ),
                            Row(
                              children: [
                                Text("${  AppLocalizations.of(context)!.status} : ",
                                    style: A_style_medium),
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      overflow:
                                      TextOverflow.ellipsis),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                  Divider(),
                  Text("Reason: There are many variations of …….",
                      style: A_style_medium),
                ],
              ),
            ));
      }));
},)

          ],
        ),
      ),
    );
  }
}
