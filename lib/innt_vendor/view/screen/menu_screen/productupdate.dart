import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/button.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/productlist_api.dart';

class Productupdate extends StatefulWidget {
  final productid;

  const Productupdate({super.key, this.productid});

  @override
  State<Productupdate> createState() => _ProductupdateState();
}

class _ProductupdateState extends State<Productupdate> {
  final productupdate = Get.put(productlist_api());
  List<String> DiscountItem = [
    "Unit",
    "Percent",
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Product update",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Unit price", style: A_style_medium),
                SizedBox(
                  width: w / 100,
                ),
                Text(
                  "*",
                  style: TextStyle(
                      color: customColor,
                      fontSize: 14,
                      fontFamily: "Ember_Medium",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: h / 90,
            ),
            TextFormField(
              controller: productupdate.priceController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please entre";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                helperMaxLines: 3,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                //   hintText: "Ex: 456565",
              ),
            ),
            SizedBox(
              height: h / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Discount type", style: A_style_medium),
                    SizedBox(
                      height: h / 90,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 0, left: 20, right: 10, bottom: 3),
                      width: w / 2.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: DropdownButton(
                        dropdownColor: Colors.white,
                        underline: const SizedBox(),
                        // Initial Value
                        value: productupdate.valueChooseDiscountType,
                        hint: Text(
                          'Unit',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        isExpanded: true,
                        // Down Arrow Icon
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Colors.grey.shade600),
                        // Array list of items
                        items: DiscountItem.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: A_style_medium,
                            ),
                          );
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            productupdate.valueChooseDiscountType = newvalue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Discount amount", style: A_style_medium),
                    SizedBox(
                      height: h / 90,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                      width: w / 2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        controller: productupdate.discountcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please entre data";
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          helperMaxLines: 3,
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          hintText: "0",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: h / 20,
            ),
            Obx(() => productupdate.isloading1 == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      productupdate.productupdate(widget.productid, context);
                    },
                    child: const Text("Update",
                        style: A_style_text_inside_button))),
          ],
        ),
      ),
    );
  }
}
