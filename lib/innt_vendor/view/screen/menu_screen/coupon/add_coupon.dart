import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../Api/Addcoupen_api.dart';

class AddCoupon extends StatefulWidget {
  const AddCoupon({super.key});

  @override
  State<AddCoupon> createState() => _AddCouponState();
}

class _AddCouponState extends State<AddCoupon> {
  bool? isChecked = false;
  bool? isChecked2 = false;
  DateTime? selectedDate;

  final addcoupen = Get.put(Add_coupen());

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
      });
      addcoupen.endDateController.text =
          "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
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
        addcoupen.startDateController.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  List<String> brandItem = [
    "Select type",
    "Crave",
    "JK",
    "Fashion",
    "i Bird",
  ];

  List<String> CategoryItem = [
    "Percentage % off",
    "Money off",
  ];
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
          AppLocalizations.of(context)!.add_coupon,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(  AppLocalizations.of(context)!.coupon_type, style: A_style_medium),
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
              Container(
                  padding: const EdgeInsets.only(
                      top: 0, left: 10, right: 10, bottom: 3),
                  width: w,
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
                      value: addcoupen.cupon_type.value,
                      hint: Text(
                        'Select ${  AppLocalizations.of(context)!.coupon_type}',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey.shade600),
                      // Array list of items
                      items: brandItem.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items, style: A_style_medium),
                        );
                      }).toList(),
                      onChanged: (newvalue) {
                        addcoupen.cupon_type.value = newvalue!;
                      },
                    ),
                  )),
              SizedBox(
                height: h / 60,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.coupon_title,
                    style: A_style_medium,
                  ),
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
                height: h / 100,
              ),
              TextFormField(
                controller: addcoupen.cupon_title,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre ${  AppLocalizations.of(context)!.coupon_title}";
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
                  hintText: "Title",
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.coupon_code,
                    style: A_style_medium,
                  ),
                  Text(
                    AppLocalizations.of(context)!.generate,
                    style: TextStyle(
                        //letterSpacing: 1.5,
                        //color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        color: logocolo,
                        fontFamily: "Amazon_med",
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
                controller: addcoupen.cupon_code,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre ${  AppLocalizations.of(context)!.coupon_code}";
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
                  hintText: "Ex: EID100",
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              Text(
                AppLocalizations.of(context)!.number_of_coupons,
                style: A_style_medium,
              ),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
                controller: addcoupen.numberOfcoupon,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre Number of coupons";
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
                  hintText: "Ex 100",
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              Text(
                AppLocalizations.of(context)!.limit_per_user,
                style: A_style_medium,
              ),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
                controller: addcoupen.sameUser_discountLimit,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please entre Limit per user";
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
                  hintText: "Ex 2",
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
                      Text(  AppLocalizations.of(context)!.discount_type, style: A_style_medium),
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
                          value: addcoupen.discountType!.value,
                          hint: Text(
                            'Select',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey.shade600),
                          // Array list of items
                          items: CategoryItem.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: A_style_medium,
                              ),
                            );
                          }).toList(),
                          onChanged: (newvalue) {
                            addcoupen.discountType!.value = newvalue!;
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.discount_amount, style: A_style_medium),
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
                          controller: addcoupen.discountAmount,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please entre Discount amount";
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
                            hintText: "Enter amount",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                      Text(  AppLocalizations.of(context)!.start_date, style: A_style_medium),
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
                          controller: addcoupen.startDateController,
                          onTap: () {
                            _showStartDatePicker(context);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please entre start date";
                            } else {
                              return null;
                            }
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
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(  AppLocalizations.of(context)!.end_date, style: A_style_medium),
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
                          controller: addcoupen.endDateController,
                          onTap: () {
                            _showEndDatePicker(context);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please entre end date";
                            } else {
                              return null;
                            }
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
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Text(  AppLocalizations.of(context)!.coupon_applies_to, style: A_style_medium),
              SizedBox(
                height: h / 50,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: MediaQuery.of(context).size.height * 7 / 100,
                    width: MediaQuery.of(context).size.width * 90 / 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Obx(() => DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: addcoupen.dropdownValueCoupon.value,
                            onChanged: (String? newValue) {
                              setState(() {
                                addcoupen.dropdownValueCoupon.value = newValue!;
                              });
                              addcoupen.checkselect.value = true;
                            },
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: <String>[
                              'Categories',
                              'Product',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black),
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                  )),
              SizedBox(
                height: h / 50,
              ),
              Obx(() => addcoupen.dropdownValueCoupon.value == "Categories"
                  ? Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 20 / 100,
                      width: MediaQuery.of(context).size.width * 100 / 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    10 /
                                    100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addcoupen.appliesCoupon!.value =
                                      "All categories";
                                  addcoupen.checkselect.value =
                                      !addcoupen.checkselect.value;
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      addcoupen.checkselect.value == false
                                          ? Colors.grey
                                          : Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 3 / 100,
                              ),
                              Text(  AppLocalizations.of(context)!.all_categories)
                            ],
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 2 / 100,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    10 /
                                    100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addcoupen.appliesCoupon!.value =
                                      "Select specific categories";
                                  addcoupen.checkselect.value =
                                      !addcoupen.checkselect.value;
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      addcoupen.checkselect.value == true
                                          ? Colors.grey
                                          : Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 3 / 100,
                              ),
                              Text(  AppLocalizations.of(context)!.select_category)
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 20 / 100,
                      width: MediaQuery.of(context).size.width * 100 / 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    10 /
                                    100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addcoupen.appliesCoupon!.value =
                                      "All Products";
                                  addcoupen.checkselect.value =
                                      !addcoupen.checkselect.value;
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      addcoupen.checkselect.value == false
                                          ? Colors.grey
                                          : Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 3 / 100,
                              ),
                              Text(  AppLocalizations.of(context)!.allproducts)
                            ],
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 2 / 100,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    10 /
                                    100,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addcoupen.appliesCoupon!.value =
                                      "Select specific Products";
                                  addcoupen.checkselect.value =
                                      !addcoupen.checkselect.value;
                                },
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      addcoupen.checkselect.value == true
                                          ? Colors.grey
                                          : Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 3 / 100,
                              ),
                              Text(  AppLocalizations.of(context)!.select_product)
                            ],
                          ),
                        ],
                      ),
                    )),
              Obx(() => addcoupen.checkselect.value != true &&
                      addcoupen.dropdownValueCoupon.value.toString() ==
                          "Categories"
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: MultiSelectDropDown(
                        onOptionSelected: (options) {
                          addcoupen.selectedOptions.clear();
                          addcoupen.selectedOptions
                              .addAll(options.map((e) => e.value));
                          print(addcoupen.selectedOptions);
                        },
                        options:
                            //addproduct.prodcolors.elementAt(0).data!.color!.map
                            addcoupen.cate.elementAt(0).data!.map((items) {
                          return ValueItem(
                              label: items.categoryEnglishName.toString(),
                              value: items.categoryId.toString());
                        }).toList(),
                        maxItems: 6,
                        selectionType: SelectionType.multi,
                        chipConfig: ChipConfig(
                            wrapType: WrapType.wrap,
                            backgroundColor: Colors.grey.shade400,
                            radius: 15,
                            spacing: 8,
                            runSpacing: 1,
                            padding: EdgeInsets.only(left: 5)),
                        dropdownHeight: 300,
                        optionTextStyle: const TextStyle(fontSize: 8),
                        selectedOptionIcon: const Icon(Icons.check_circle),
                      ),
                    )
                  : addcoupen.checkselect.value != true &&
                          addcoupen.dropdownValueCoupon.value.toString() !=
                              "Categories"
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: MultiSelectDropDown(
                            onOptionSelected: (options) {
                              addcoupen.selectedOptions.clear();
                              addcoupen.selectedOptions
                                  .addAll(options.map((e) => e.value));
                              print(addcoupen.selectedOptions);
                            },
                            options: addcoupen.productlisttt
                                .elementAt(0)
                                .data!
                                .map((items) {
                              return ValueItem(
                                  label: items.productName.toString(),
                                  value: items.productId.toString());
                            }).toList(),
                            maxItems: 6,
                            selectionType: SelectionType.multi,
                            chipConfig: ChipConfig(
                                wrapType: WrapType.wrap,
                                backgroundColor: Colors.grey.shade400,
                                radius: 15,
                                spacing: 8,
                                runSpacing: 1,
                                padding: EdgeInsets.only(left: 5)),
                            dropdownHeight: 300,
                            optionTextStyle: const TextStyle(fontSize: 8),
                            selectedOptionIcon: const Icon(Icons.check_circle),
                          ),
                        )
                      : SizedBox()),
              SizedBox(
                height: h / 50,
              ),
              GestureDetector(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    addcoupen.Addcoupen(context);
                    //Get.to(AddProductinnoutVariant());
                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: logocolo,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.submit,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ember_Display_Medium'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
