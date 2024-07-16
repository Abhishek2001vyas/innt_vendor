import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

String _selectedItem = 'Transaction';
final List<String> _dropdownItems = [
  'Transaction',
  'Order Transaction',
  'Order Refund',
  'Converted From Loyalty',
  'Added Via Payment Method',
  'Add FUnd By Admin',
];

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 1,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Wallet",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: h / 4,
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Get.theme.primaryColor,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 3),
                  ],
                  border: Border.all(color: Colors.grey.shade200, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wallet\nAmount",
                            style: TextStyle(
                                fontFamily: "Ember_Display_Medium",
                                fontSize: 25,
                                color: Get.theme.cardColor),
                          ),
                          Row(
                            children: [
                              Text(
                                "\$0.00",
                                style: TextStyle(
                                    fontFamily: "Ember_Bold",
                                    fontSize: 40,
                                    color: Get.theme.cardColor),
                              ),
                              SizedBox(
                                width: w / 50,
                              ),
                              Icon(
                                Icons.help_outline,
                                color: Get.theme.cardColor,
                                size: 40,
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 12),
                        decoration: BoxDecoration(
                            color: Get.theme.cardColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: const Color(0xD7E2F1FF), width: 1)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Get.theme.primaryColor,
                            ),
                            Text(
                              "Add Fund",
                              style: TextStyle(
                                  fontFamily: "Ember_Display_Medium",
                                  fontSize: 20,
                                  color: Get.theme.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transaction",
                  style: TextStyle(
                      fontFamily: "Ember_Display_Medium", color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: _selectedItem,
                    items: _dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: h / 10,
            ),
            Image.asset(
              "assets/images/img_2.png",
              height: 80,
              width: 80,
            ),
            SizedBox(
              height: h / 40,
            ),
            const Text(
              "You do not have any\nTransaction yet",
              style: TextStyle(
                  fontFamily: "Ember_Bold", fontSize: 28, color: Colors.grey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
