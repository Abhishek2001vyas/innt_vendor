import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import 'order_cancel_deletion_reason.dart';

class OrderCancelDeletion extends StatefulWidget {
  const OrderCancelDeletion({super.key});

  @override
  State<OrderCancelDeletion> createState() => _OrderCancelDeletionState();
}

class _OrderCancelDeletionState extends State<OrderCancelDeletion> {
  bool? isChecked;

  bool isloading = false;
  Set<int> selectedIndexes = Set<int>();

  // final deleteseller = Get.put(Seller_delete_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            " Order ID: 100181",
          ),
        ),
        body: AlertDialog(
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
                Icon(
                  Icons.check,
                  color: Colors.grey.shade400,
                  size: 60,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  'Are you sure you want to cancel this\norder?',
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
                        color: logocolo,
                        borderRadius: BorderRadius.circular(8)),
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
                  onTap: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OrderCancelDeletionReason(),
                        ),
                      );
                    });
                  },
                  child: Container(
                    width: w / 4,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
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
        ));
  }

  TextEditingController textdeleteController = TextEditingController();
}
