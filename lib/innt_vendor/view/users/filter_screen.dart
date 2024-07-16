import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

List<String> filter = [
  "Category",
  "Gender",
  "Brands",
  "Occasion",
  "Discount",
  "Color",
  "Size & Fit",
  "Style Type",
  "Pattern",
  "Wash",
];

class _FilterScreenState extends State<FilterScreen> {
  bool isChecked = false;
  bool isChecked1 = true;
  bool isChecked2 = false;
  bool isChecked3 = true;
  bool isChecked4 = false;
  bool isChecked5 = true;
  bool isChecked6 = false;
  int selectedItemIndex = 0;
  var type = "Category";

  @override
  void initState() {
    type = "Category";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Filter Products",
          style: TextStyle(
            fontFamily: "Ember_Display_Medium",
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: Get.height,
                width: 120,
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: ListView.builder(
                    itemCount: filter.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            type = "Category";
                          } else if (index == 1) {
                            type = "Gender";
                          } else if (index == 2) {
                            type = "Brands";
                          } else if (index == 3) {
                            type = "Occasion";
                          } else if (index == 4) {
                            type = "Discount";
                          } else if (index == 5) {
                            type = "Color";
                          } else if (index == 6) {
                            type = "Size";
                          } else if (index == 7) {
                            type = "Pattern";
                          } else if (index == 8) {
                            type = "Wash";
                          }
                          setState(() {
                            selectedItemIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          height: 50,
                          decoration: BoxDecoration(
                            color: index == selectedItemIndex
                                ? Colors.grey.shade300
                                : Colors.grey.shade200,
                          ),
                          child: Text(
                            filter[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: index == selectedItemIndex
                                    ? "Ember_Bold"
                                    : "Ember_Light",
                                overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          ),
                        ),
                      );
                    })),
            type == "Category"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Below Rs.500 (241)",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Below Rs.500 (241)",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Below Rs.500 (241)",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Below Rs.500 (241)",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Below Rs.500 (241)",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Below Rs.500 (241)",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked6,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked6 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Below Rs.500 (241)",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Gender"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Female",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Male",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Other",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Brands"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Zara",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Adidas",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Levi's",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Tokyo Talkies",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Killer",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Spykar",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked6,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked6 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Pepe Jeans",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Occasion"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "10% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "20% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "30% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "40% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "60% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "70% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Discount"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "10% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "20% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "30% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "40% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "60% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "70% or more",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Color"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Yellow",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Pink",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Purple",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Black",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "White",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Green",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Size"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Boot-Leg",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Flared",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Regular",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Super Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Slim",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Style"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Boot-Leg",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Flared",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Regular",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Super Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Slim",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Pattern"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Boot-Leg",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Flared",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Regular",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Super Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Slim",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text(""),
            type == "Wash"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Boot-Leg",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked1 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Flared",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked2 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Regular",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked3,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked3 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked4,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked4 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Super Skinny",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked5,
                            activeColor: const Color(0xff1455ac),
                            onChanged: (newBool) {
                              setState(() {
                                isChecked5 = newBool!;
                              });
                            },
                          ),
                          const Text(
                            "Slim",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )
                : const Text("")
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        height: h / 10,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: w / 2.5,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)),
              child: const Text(
                'Reset',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: "Ember_Bold"),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: w / 2,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'Apply Filter',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Ember_Bold"),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
