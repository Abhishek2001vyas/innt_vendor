import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 1,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: const Text(
          "WishList",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 1)
                  ]),
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 1)
                          ]),
                      child: Image.asset(
                        "assets/images/makeup.png",
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      )),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MAKEUP COMBO",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Ember"),
                      ),
                      Row(
                        children: [
                          Text(
                            "Brand:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Ember"),
                          ),
                          Text(
                            "Estha dot",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Ember"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "\$2,500.00",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                decoration: TextDecoration.lineThrough,
                                fontFamily: "Ember"),
                          ),
                          Text(
                            "\$2,480.00",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Ember"),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 1)
                        ]),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent.shade400,
                      ),
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
