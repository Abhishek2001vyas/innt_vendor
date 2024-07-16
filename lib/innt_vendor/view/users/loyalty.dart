import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loyalty extends StatefulWidget {
  const Loyalty({super.key});

  @override
  State<Loyalty> createState() => _LoyaltyState();
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

class _LoyaltyState extends State<Loyalty> {
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
          "Loyalty Point",
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
            Row(
              children: [
                Container(
                  height: h / 4.5,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Get.theme.primaryColor,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 1)
                      ]),
                  child: Center(
                    child: Text(
                      "Total Loyalty Point",
                      style: TextStyle(
                          fontFamily: "Ember_Bold",
                          fontSize: 20,
                          color: Get.theme.cardColor),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: h / 4.5,
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Get.theme.cardColor,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "How To Use",
                          style: TextStyle(
                              fontFamily: "Ember_Bold",
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: h / 70,
                        ),
                        const Text(
                          "Convert your loyalty point to wallet money.",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: h / 70,
                        ),
                        const Text(
                          "Minimum 200 Points required to convert into currency",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
