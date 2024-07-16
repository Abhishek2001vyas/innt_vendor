import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../innt_delivery/base/custom_button.dart';
import '../menu.dart';

class EditOffer extends StatefulWidget {
  const EditOffer({super.key});

  @override
  State<EditOffer> createState() => _EditOfferState();
}

class _EditOfferState extends State<EditOffer> {
  TextEditingController endDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();

  DateTime? selectedDate;

  Future<void> _showEndDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        // Format the selected date and update the controller's text
        endDateController.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  Future<void> _showStartDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        // Format the selected date and update the controller's text
        startDateController.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  String _selectedItem = 'Select';
  String? valuedropDownBrandsChoose;
  List<String> listdropDownBranditem = [];
  final List<String> _dropdownItems = [
    'Select',
    'Store front',
    'Specific product',
  ];
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: const Text("Edit offer")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 80,
            ),
            Text("Select directory", style: smallText),
            SizedBox(
              height: h / 100,
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4.0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: SizedBox(),
                //alignment: Alignment.centerRight,
                value: _selectedItem,
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    // alignment: AlignmentDirectional.,
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
              height: h / 60,
            ),
            Text("Select product", style: A_style_medium),
            SizedBox(
              height: h / 90,
            ),
            GestureDetector(
              onTap: () {
                showMyDropdownProductsDialog(context);
              },
              child: Container(
                width: w,
                height: h / 13,
                padding: const EdgeInsets.only(
                  top: 0,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  underline: const SizedBox(),
                  // Initial Value
                  value: valuedropDownBrandsChoose,
                  hint: Text(
                    'Select brands',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  isExpanded: true,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  // Array list of items
                  items: listdropDownBranditem.map((String items) {
                    return DropdownMenuItem(
                      onTap: () {
                        showMyDropdownProductsDialog(context);
                      },
                      value: items,
                      child: Text(items, style: A_style_medium),
                    );
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      valuedropDownBrandsChoose = newvalue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: h / 60,
            ),
            Text("Offer type", style: A_style_medium),
            SizedBox(
              height: h / 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  value: isChecked,
                  activeColor: const Color(0xff1455ac),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
                Text("Percentage", style: A_style_medium),
                Container(
                  padding: const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                  width: w / 1.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    // controller: taxController,
                    /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      helperMaxLines: 3,
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: "Ex: 20%",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  shape: CircleBorder(),
                  value: isChecked,
                  activeColor: const Color(0xff1455ac),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
                Text("Buy", style: A_style_medium),
                Container(
                  padding: const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                  width: w / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    // controller: taxController,
                    /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      helperMaxLines: 3,
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: "Ex: 1",
                    ),
                  ),
                ),
                Text("get", style: A_style_medium),
                Container(
                  padding: const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                  width: w / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    // controller: taxController,
                    /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      helperMaxLines: 3,
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: "Ex: 1",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 60,
            ),
            Text("Limit per user", style: A_style_medium),
            SizedBox(
              height: h / 90,
            ),
            TextFormField(
              // controller: taxController,
              /* validator: (value) {
                                      if (value!.length < 10) {
                                        return "Invalid email address";
                                      } else {
                                        return null;
                                      }
                                    },*/
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
                hintText: "Ex: 3",
              ),
            ),
            SizedBox(
              height: h / 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start date", style: A_style_medium),
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
                        controller: startDateController,
                        onTap: () {
                          _showStartDatePicker(context);
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.grey.shade400,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "mm/dd/yyyy",
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("End date", style: A_style_medium),
                    SizedBox(
                      height: h / 90,
                    ),
                    GestureDetector(
                      onTap: () {
                        //_showDatePicker(context);
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 0, left: 2, bottom: 3),
                        width: w / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: endDateController,
                          onTap: () {
                            _showEndDatePicker(context);
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey.shade400,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "mm/dd/yyyy",
                          ),
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
            CustomButton(
              title: 'Update',
              onTap: () {
                Navigator.pop(context);
                _showEditOfferPopup(context);

                Future.delayed(Duration(seconds: 2), () {
                  Get.to(Menu());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

_showEditOfferPopup(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final h = MediaQuery.of(context).size.height;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.white,
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 40,
              ),
              Center(
                child: Text(
                  "Your offer has been updated",
                  style: A_style_order,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: h / 70,
              ),
              Center(
                child: Text(
                  "and is waiting for approval!",
                  style: A_style_order,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: h / 70,
              ),
              Image.asset(
                "assets/images/successfully-unscreen.gif",
                height: 100,
                width: 100,
                color: logocolo,
              ),
              SizedBox(
                height: h / 40,
              ),
            ],
          )
        ],
      );
    },
  );
}

showMyDropdownProductsDialog(BuildContext context) async {
  List<String> dropdownItems = [
    "General Book",
    "Jeans",
    "General Book",
    "Jeans",
    "General Book",
    "Jeans",
    "General Book",
    "Jeans",
    "General Book",
    "Jeans",
    "General Book",
    "Jeans",
  ];
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return ListView(
        children: [
          AlertDialog(
            contentPadding: EdgeInsets.all(0),
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: h / 70,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search in products",
                        focusColor: Colors.white,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        border: InputBorder.none, // Remove the underline
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              SizedBox(
                height: h / 1.4,
                child: ListView.builder(
                    itemCount: dropdownItems.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300, blurRadius: 3)
                            ]),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dropdownItems[index],
                              style: TextStyle(
                                  //letterSpacing: 1.5,
                                  //color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  // fontFamily: "Amazon_med",
                                  fontSize: 16),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ],
      );
    },
  );
}
