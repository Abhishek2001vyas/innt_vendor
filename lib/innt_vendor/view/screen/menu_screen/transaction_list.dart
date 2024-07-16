import 'package:flutter/material.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../order/my_order_screen.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

List order = [
  "All",
  "Pending",
  "Approved",
  "Denied",
];

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text(
          "Transaction",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
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
                            horizontal: 20, vertical: 8),
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
            SizedBox(
              height: h / 90,
            ),
            Container(
              // padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 3),
                  ],
                  border: Border.all(color: Colors.grey.shade200, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Transaction# 11", style: A_style_mid_black),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xD7E2F1FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "\$500.00",
                            style: TextStyle(
                                //letterSpacing: 1.5,
                                //color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color: logocolo,
                                fontFamily: "Amazon_med",
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("12 oct, 2022 01:31 AM", style: A_style_mid),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.cancel,
                          color: Colors.red.shade800,
                        ),
                        SizedBox(
                          width: w / 80,
                        ),
                        Text("Denied",
                            style: TextStyle(
                                //letterSpacing: 1.5,
                                //color: Colors.white,
                                color: Colors.red.shade800,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 14))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h / 90,
            ),
            Container(
              // padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 3),
                  ],
                  border: Border.all(color: Colors.grey.shade200, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction# 10",
                          style: A_style_mid_black,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xD7E2F1FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "\$600.00",
                            style: TextStyle(
                                //letterSpacing: 1.5,
                                //color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color: logocolo,
                                fontFamily: "Amazon_med",
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("12 oct, 2022 01:31 AM", style: A_style_mid),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: w / 50,
                        ),
                        Text("Approved",
                            style: TextStyle(
                                //letterSpacing: 1.5,
                                //color: Colors.white,
                                color: Colors.green.shade700,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 14))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h / 90,
            ),
            Container(
              // padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 3),
                  ],
                  border: Border.all(color: Colors.grey.shade200, width: 2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction# 9",
                          style: A_style_mid_black,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xD7E2F1FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "\$500.00",
                            style: TextStyle(
                                //letterSpacing: 1.5,
                                //color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                color: logocolo,
                                fontFamily: "Amazon_med",
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("12 oct, 2022 01:31 AM", style: A_style_mid),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.watch_later,
                          color: logocolo,
                        ),
                        SizedBox(
                          width: w / 50,
                        ),
                        const Text("Pending",
                            style: TextStyle(
                                //letterSpacing: 1.5,
                                //color: Colors.white,
                                color: logocolo,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: "Amazon_med",
                                fontSize: 14))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
