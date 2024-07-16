import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../innt_delivery/base/custom_button.dart';
import '../../../../ulits/utils.dart';
import '../../Api/Add_product_api.dart';
import 'add_product_other.dart';
import 'addproduct_attribute.dart';

class AddProductVariant extends StatefulWidget {
  const AddProductVariant({
    super.key,
  });

  @override
  State<AddProductVariant> createState() => _AddProductVariantState();
}

class _AddProductVariantState extends State<AddProductVariant> {
  bool _isDarkMode = false;
  bool _isChecked = false;
  final MultiSelectController colorController = MultiSelectController();
  final MultiSelectController sizeController = MultiSelectController();

  List<String> CategoryItem = [
    "Exclude",
    "Include",
  ];
  String? valueChooseDiscountType;
  List<String> DiscountItem = [
    "Amount",
    "Percent",
  ];
  String? valueChooseTime;
  List<String> time = [
    "Minutes",
    "Hours",
    "Days",
  ];
  List<String> duration = [
    "Day(s)",
    "Week(s)",
    "Month(s)",
    "Year(s)",
  ];

  @override
  void dispose() {
    addproduct.priceController.clear();
    addproduct.taxname = null;
    addproduct.taxController.clear();
    addproduct.discountcontroller.clear();
    addproduct.valueChooseDiscountType = null;
    addproduct.stock = null;
    // addproduct.size.clear();
    addproduct.delivery = null;
    addproduct.Minorder.clear();

    super.dispose();
  }

  bool? isChecked2 = false;
  bool isExpanded = false;
  final addproduct = Get.put(Seller_product_api());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title:  Text(
            AppLocalizations.of(context)!.add_product,
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h / 60,
                    ),
                    Text(
                      AppLocalizations.of(context)!.productvariation,
                      style: A_style_medium,
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    Obx(() => ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: addproduct.selectedattributelist.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Container(
                                width: w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        addproduct.selectedattributelist[index]
                                                ["attribute_name"]
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                          width: w,
                                          height: h / 20,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: addproduct
                                                .selectedattributelist[index]
                                                    ["attribute_values"]
                                                .length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, indexx) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: logocolo,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3.0,
                                                            right: 15,
                                                            left: 15,
                                                            bottom: 3),
                                                    child: Center(
                                                        child: Row(
                                                      children: [
                                                        Text(
                                                          addproduct.selectedattributelist[
                                                                      index][
                                                                  "attribute_values"]
                                                              [indexx],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        SizedBox(
                                                          width: w / 50,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              if (addproduct
                                                                      .selectedattributelist[
                                                                          index]
                                                                          [
                                                                          "attribute_values"]
                                                                      .length ==
                                                                  1) {
                                                                addproduct
                                                                    .selectedattributelist
                                                                    .removeAt(
                                                                        index);
                                                              } else {
                                                                addproduct
                                                                    .selectedattributelist[
                                                                        index][
                                                                        "attribute_values"]
                                                                    .removeAt(
                                                                        indexx);
                                                              }
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .xmark,
                                                              color: Colors.red,
                                                              size: 15,
                                                            ))
                                                      ],
                                                    )),
                                                  ),
                                                ),
                                              );
                                            },
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                    GestureDetector(
                      onTap: () {
                        Get.to(Addproduct_attributee());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child: Text("+ ${  AppLocalizations.of(context)!.addvariation} "),
                      ),
                    ),

                    SizedBox(
                      height: h / 60,
                    ),
                    Text(  AppLocalizations.of(context)!.productspecifications, style: A_style_medium),
                    SizedBox(
                      height: h / 60,
                    ),
                    Text(  AppLocalizations.of(context)!.main_composition, style: A_style_medium),
                    SizedBox(
                      height: h / 100,
                    ),
                    TextFormField(
                      controller: addproduct.compostion,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "please entre main compostion";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
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
                        //   hintText: "Enter description",
                      ),
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    Text(  AppLocalizations.of(context)!.warranty, style: A_style_medium),
                    SizedBox(
                      height: h / 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 10, bottom: 3),
                          width: w / 2.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: TextFormField(
                            controller: addproduct.warrantyno,
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return "please entre number";
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Select number",
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 10, bottom: 3),
                          width: w / 2.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            underline: const SizedBox(),
                            // Initial Value
                            value: addproduct.valueChooseDuration,
                            hint: Text(
                              'Select duration',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey.shade600),
                            // Array list of items
                            items: duration.map((String items) {
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
                                addproduct.valueChooseDuration = newvalue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    Text(  AppLocalizations.of(context)!.additional_note, style: A_style_medium),
                    SizedBox(
                      height: h / 100,
                    ),
                    TextFormField(
                      controller: addproduct.note,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "please entre note";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      maxLines: null,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      // maxLines: 1,
                      decoration: InputDecoration(
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
                      ),
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    Text(  AppLocalizations.of(context)!.doyouacceptreturns, style: A_style_medium),
                    SizedBox(
                      height: h / 100,
                    ),
                    SizedBox(
                      height: h / 100,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: addproduct.isChecked,
                          activeColor: const Color(0xff1455ac),
                          onChanged: (newBool) {
                            setState(() {
                              addproduct.rettype = 1;
                              addproduct.isChecked2 = false;
                              addproduct.isChecked = newBool;
                            });
                          },
                        ),
                        Text(
                          AppLocalizations.of(context)!.yes,
                          style: A_style_medium,
                        ),
                      ],
                    ),
                    addproduct.isChecked == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.untilhowmanyday,
                                  style: A_style_medium,
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 0, left: 20, right: 10, bottom: 3),
                                  width: w / 2.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  child: TextFormField(
                                    controller: addproduct.returnday,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "please entre days";
                                      } else {
                                        return null;
                                      }
                                    },
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Ex: 7",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    Row(
                      children: [
                        Checkbox(
                          shape: CircleBorder(),
                          value: addproduct.isChecked2,
                          activeColor: const Color(0xff1455ac),
                          onChanged: (newBool) {
                            setState(() {
                              addproduct.rettype = 0;
                              addproduct.isChecked = false;
                              addproduct.isChecked2 = newBool;
                            });
                          },
                        ),
                        Text(
                          AppLocalizations.of(context)!.no,
                          style: A_style_medium,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h / 60,
                    ),
                    CustomButton(
                        title:  AppLocalizations.of(context)!.continuee,
                        onTap: () {
                          if (addproduct.rettype == null) {
                            Utils()
                                .sendMassage("Please selected return type ?");
                          }
                          // else if (addproduct.colorselected.isEmpty ||
                          //     addproduct.sizeselected.isEmpty) {
                          //   Utils().sendMassage("Please fill all data");
                          // }
                          else if (formKey.currentState!.validate()) {
                            Get.to(() => AddProductOther());
                          }
                        }
                        ),
                    SizedBox(
                      height: h / 90,
                    ),
                  ])),
        ));
  }
// bool? isChecked = false;
//bool? isChecked2 = false;
}
