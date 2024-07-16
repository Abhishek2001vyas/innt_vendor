import 'package:demo_innt/innt_vendor/view/screen/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../innt_delivery/base/custom_button.dart';
import '../../Api/orderlist.dart';

class OrderSetup extends StatefulWidget {
  final orderisd;
  final productid;

  const OrderSetup({super.key, this.orderisd, this.productid});

  @override
  State<OrderSetup> createState() => _OrderSetupState();
}

class _OrderSetupState extends State<OrderSetup> {
  List listitem = [
    "Pending",
    "Confirmed",
    "Packing",
  ];

  List listitemPayment = [
    "Paid",
    "Unpaid",
  ];

  final orderlist = Get.put(Seller_orderlist_api());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order Setup"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order Status',
                  style: A_style_medium // Set text color to black
                  ),
              SizedBox(
                height: h / 90,
              ),
              Container(
                  width: w,
                  padding: const EdgeInsets.only(
                      top: 0, left: 20, right: 10, bottom: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Obx(
                    () => DropdownButton(
                      dropdownColor: Colors.white,
                      underline: const SizedBox(),
                      // Initial Value
                      value: orderlist.valueChoose.value.toString(),
                      hint: Text('Select',
                          style: A_style_medium // Set text color to black
                          ),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      // Array list of items
                      items: listitem.map((items) {
                        return DropdownMenuItem(
                          value: items.toString(),
                          child: Text(items, style: A_style_medium),
                        );
                      }).toList(),
                      onChanged: (newvalue) {
                        orderlist.valueChoose!.value = newvalue!;
                      },
                    ),
                  )),
              SizedBox(
                height: h / 70,
              ),
              Text('Payment Status',
                  style: A_style_medium // Set text color to black
                  ),
              SizedBox(
                height: h / 90,
              ),
              Container(
                width: w,
                padding: const EdgeInsets.only(
                    top: 0, left: 20, right: 10, bottom: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Obx(() => DropdownButton(
                      dropdownColor: Colors.white,
                      underline: const SizedBox(),
                      value: orderlist.valueChoosePayment.value,
                      // Using value from GetX controller
                      hint: Text('Select', style: A_style_medium),
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: listitemPayment.map((items) {
                        print(items);
                        return DropdownMenuItem(
                          value: items.toString(),
                          child: Text(items.toString(), style: A_style_medium),
                        );
                      }).toList(),
                      onChanged: (newvalue) {
                        orderlist.valueChoosePayment.value = newvalue!;
                        print(orderlist.valueChoosePayment.value);
                      },
                    )),
              ),
              SizedBox(
                height: h / 30,
              ),
              CustomButton(
                title: 'Confirm',
                onTap: () {
                  print(widget.orderisd);
                  print(widget.productid);
                  orderlist.orderstatusupdate(
                    order_id: widget.orderisd,
                    productId: widget.productid,
                  );
                  setState(() {
                    currentTab = 1;
                  });
                  Get.offAll(DashboardScreenVendor());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_showAnimatedPopup(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final h = MediaQuery.of(context).size.height;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),
              Text(
                "Confirmed",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40),
              Image.asset(
                "assets/images/successfully-unscreen.gif",
                height: 100,
                width: 100,
                color: logocolo,
              ),
              SizedBox(height: 40),
              // Add any other widgets you want in the dialog
            ],
          ),
        ),
      );
    },
  );
}
