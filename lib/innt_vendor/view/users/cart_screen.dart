import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String _selectedItem = 'Size 9';
  final List<String> _dropdownItems = [
    'Size 9',
    'Size 10',
    'Size 11',
    'Size 12',
    'Size 13',
    'Size 14',
    'Size 15',
    'Size 16',
    'Size 17',
  ];
  String _selectedQuantity = 'Qty 1';
  final List<String> _dropdownQuantity = [
    'Qty 1',
    'Qty 2',
    'Qty 3',
    'Qty 4',
    'Qty 5',
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Row(
          children: [
            Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Spacer(),
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300, blurRadius: 3)
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        "assets/images/jeans.jpg",
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: w / 40,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Jock & Jones",
                                        style: TextStyle(
                                          fontFamily: "Ember",
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "Low Rise Straight Fit Jeans",
                                        style: TextStyle(
                                          fontFamily: "Ember_Light",
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "Brand Size",
                                        style: TextStyle(
                                          fontFamily: "Ember_Light",
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: h / 20,
                                            padding:
                                                const EdgeInsets.only(left: 4),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1)),
                                            child: DropdownButton<String>(
                                              underline: const SizedBox(),
                                              value: _selectedItem,
                                              items: _dropdownItems
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  _selectedItem = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: w / 40,
                                          ),
                                          Container(
                                            height: h / 20,
                                            padding:
                                                const EdgeInsets.only(left: 4),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1)),
                                            child: DropdownButton<String>(
                                              underline: const SizedBox(),
                                              value: _selectedQuantity,
                                              items: _dropdownQuantity
                                                  .map((String item) {
                                                return DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  _selectedQuantity = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: w / 100,
                                          ),
                                          Text(
                                            "6 left",
                                            style: TextStyle(
                                              fontFamily: "Ember_Bold",
                                              color: Colors.redAccent.shade700,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h / 100,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "\u20b9 1200",
                                            style: TextStyle(
                                              fontFamily: "Ember_Bold",
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: w / 40,
                                          ),
                                          const Text(
                                            "\u20b9 3900",
                                            style: TextStyle(
                                                fontFamily: "Ember_Light",
                                                color: Colors.black,
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          SizedBox(
                                            width: w / 40,
                                          ),
                                          const Text(
                                            "50%",
                                            style: TextStyle(
                                              fontFamily: "Ember_Bold",
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "You save \u20b9 47,899.00",
                                        style: TextStyle(
                                          fontFamily: "Ember_Bold",
                                          color: Colors.green,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey.shade400,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Remove",
                                  style: TextStyle(
                                    color: Colors.redAccent.shade700,
                                    fontFamily: "Ember_Bold",
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h / 70,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h / 70,
                      ),
                    ],
                  );
                }),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order Details",
                    style: TextStyle(
                      fontFamily: "Ember_Bold",
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bag Total",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "\u20b9 18,999.00",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bag Savings",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "\u20b9 55,19.00",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Coupon Savings",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Apply Coupon",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Get.theme.primaryColor,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Convenience Fee",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: w / 70,
                      ),
                      Text(
                        "What's this?",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Get.theme.primaryColor,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Delivery Fee",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Fee",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: w / 70,
                      ),
                      const Text(
                        "\u20b9 99.00",
                        style: TextStyle(
                            fontFamily: "Ember_Light",
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fulfilment Fee",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "\u20b9 29.00",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "AJIO Wallet",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "+\u20b9 100.00",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.green,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Delivery Fee",
                        style: TextStyle(
                          fontFamily: "Ember_Light",
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Fee",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: w / 70,
                      ),
                      const Text(
                        "\u20b9 99.00",
                        style: TextStyle(
                            fontFamily: "Ember_Light",
                            color: Colors.black,
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h / 150,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount Payable",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "\u20b9 13,418.00",
                        style: TextStyle(
                          fontFamily: "Ember_Bold",
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 70,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Refund/Return Policy",
                    style: TextStyle(
                      fontFamily: "Ember_Bold",
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: h / 100,
                  ),
                  const Text(
                    "In Case Refund Return Policy but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: TextStyle(
                        fontFamily: "Ember_Light",
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 3,
                  ),
                  Text(
                    "Read Policy",
                    style: TextStyle(
                      fontFamily: "Ember_Bold",
                      color: Get.theme.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h / 70,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                  ]),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/coupon2.png",
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: w / 70,
                  ),
                  const Text(
                    "Apply Coupon",
                    style: TextStyle(
                        fontFamily: "Ember_Light",
                        color: Colors.black,
                        fontSize: 20,
                        letterSpacing: 1,
                        overflow: TextOverflow.ellipsis),
                    maxLines: 3,
                  ),
                  const Spacer(),
                  Text(
                    "Select",
                    style: TextStyle(
                      fontFamily: "Ember_Bold",
                      color: Get.theme.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        height: h / 10,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "\u20b9 55,19.00",
                    style: TextStyle(
                      fontFamily: "Ember_Bold",
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "View Details",
                    style: TextStyle(
                      fontFamily: "Ember_Bold",
                      color: Get.theme.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                width: w / 2,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () {
                    // Get.to(() => EmailLoginScreen());
                  },
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Ember_Bold"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
