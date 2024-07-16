import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

List jeansCategory = [
  {
    "image": "assets/images/jeans.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 1400",
    "discount": "\u20b9 3999",
    "offer": "65% Off"
  },
  {
    "image": "assets/images/jeans2.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 2000",
    "discount": "\u20b9 9999",
    "offer": "70% Off"
  },
  {
    "image": "assets/images/jeans3.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 1500",
    "discount": "\u20b9 5999",
    "offer": "30% Off"
  },
  {
    "image": "assets/images/jeans4.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 1200",
    "discount": "\u20b9 4999",
    "offer": "50% Off"
  },
  {
    "image": "assets/images/jeans.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 1400",
    "discount": "\u20b9 3999",
    "offer": "65% Off"
  },
  {
    "image": "assets/images/jeans2.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 2000",
    "discount": "\u20b9 9999",
    "offer": "70% Off"
  },
  {
    "image": "assets/images/jeans3.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 1500",
    "discount": "\u20b9 5999",
    "offer": "30% Off"
  },
  {
    "image": "assets/images/jeans4.jpg",
    "products": "Jock & Jones",
    "types": "Low Rise Straight Fit Jeans",
    "price": "\u20b9 1200",
    "discount": "\u20b9 4999",
    "offer": "50% Off"
  },
];

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jeans",
                  style: TextStyle(
                    fontFamily: "Ember_Display_Medium",
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "2000 Products",
                  style: TextStyle(
                    fontFamily: "Ember_Light",
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            IconButton(
              color: Colors.black,
              onPressed: () {
                Get.to(() => const FilterScreen());
              },
              icon: const Icon(
                Icons.filter_list,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.2),
              ),
              itemCount: jeansCategory.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            jeansCategory[index]["image"].toString(),
                            fit: BoxFit.cover,
                            height: h / 4,
                            width: w / 2,
                          ),
                        ),
                        Text(
                          jeansCategory[index]["products"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Ember_Display_Medium",
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                        Text(
                          jeansCategory[index]["types"],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "Ember_Light",
                              overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              jeansCategory[index]["price"],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Ember_Display_Medium",
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: w / 60,
                            ),
                            Text(
                              jeansCategory[index]["discount"],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Ember_Light",
                                  decoration: TextDecoration.lineThrough,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: w / 60,
                            ),
                            Text(
                              jeansCategory[index]["offer"],
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontFamily: "Ember_Display_Medium",
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                          ],
                        )
                      ],
                    ),
                    Positioned(
                        child: Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.black,
                      ),
                      child: Text(
                        "Regular",
                        style: TextStyle(color: Get.theme.cardColor),
                      ),
                    )),
                    Positioned(
                        bottom: h / 8,
                        left: 1,
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.copy,
                            size: 13,
                            color: Colors.grey.shade800,
                          ),
                        )),
                    Positioned(
                        bottom: h / 8,
                        right: 1,
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            size: 13,
                            Icons.favorite_border,
                            color: Colors.grey.shade800,
                          ),
                        ))
                  ]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
