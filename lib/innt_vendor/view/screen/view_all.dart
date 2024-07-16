import 'package:flutter/material.dart';

import '../../../innt_delivery/Controllers/text2.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

List categoryAll = [
  {
    "image": "assets/images/img.png",
    "title": "Women's heels",
    "sold": "2 Sold"
  },
  {
    "image": "assets/images/books.png",
    "title": "General book",
    "sold": "3 Sold"
  },
  {"image": "assets/images/bag.png", "title": "Women's bag", "sold": "4 Sold"},
  {
    "image": "assets/images/bag.png",
    "title": "Women's shoes",
    "sold": "1 Sold"
  },
  {
    "image": "assets/images/shoes.png",
    "title": "Women's shoes",
    "sold": "5 Sold"
  },
];

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text("Top Selling Products"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            itemBuilder: (context, index) {
              return Container(
                  height: h / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                      ]),
                  child: Column(
                    children: [
                      Image.asset(
                        categoryAll[index]["image"],
                        fit: BoxFit.fill,
                        height: h / 5,
                        width: w / 2,
                      ),
                      Text(
                        "Women's shoes",
                        style: A_style_order,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red.shade700),
                        child: const Text(
                          "5 Sold",
                          style: TextStyle(
                              //letterSpacing: 1.5,
                              //color: Colors.white,
                              color: Colors.white,
                              fontFamily: "Amazon_med",
                              fontSize: 14),
                        ),
                      )
                    ],
                  ));
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categoryAll.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
            )),
      ),
    );
  }
}
