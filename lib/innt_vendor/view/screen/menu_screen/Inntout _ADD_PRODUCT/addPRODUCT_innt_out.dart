import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../innt_delivery/base/custom_button.dart';
import '../../../../../ulits/utils.dart';
import '../../../Api/Add_product_api.dart';
import 'addproduct2_innout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class AddProductinnout extends StatefulWidget {
  const AddProductinnout({super.key});

  @override
  State<AddProductinnout> createState() => _AddProductinnoutState();
}

class _AddProductinnoutState extends State<AddProductinnout>
    with
        AutomaticKeepAliveClientMixin<AddProductinnout>,
        TickerProviderStateMixin {
  // Changed to TickerProviderStateMixin
  final MultiSelectController<ProductSize> _controller =
      MultiSelectController();
  final MultiSelectController<ProductColor> colorController =
      MultiSelectController();

  final formKey = GlobalKey<FormState>();
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: 2, vsync: this); // Used 'this' as vsync
    super.initState();
  }

  @override
  void dispose() {
    addproduct.productNameController.clear();
    addproduct.frproductNameController.clear();
    addproduct.productDesController.clear();
    addproduct.frproductDesController.clear();
    addproduct.size.clear();
    addproduct.generateCodeController.clear();
    addproduct.brandnotfound.clear();
    addproduct.prodpreatime.clear();
    addproduct.produweigth.clear();
    addproduct.producttype = null;
    addproduct.brand = null;
    addproduct.categoriesid = null;
    addproduct.subcategoriesid = null;
    addproduct.subsubcategoriesid = null;
    addproduct.subsubcatename.value = "";

    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  final addproduct = Get.put(Seller_product_api());
  List<String> sizeItem = ["Select", "Free size", "S", "M", "L", "XL", "XXL"];

  String? valueChooseBrand;
  List<String> brandItem = [
    "Select type",
    "Crave",
    "JK",
    "Fashion",
    "i Bird",
  ];

  List<String> weigth = [
    "KG",
    "Gram",
  ];

  // String? valueChooseOtherBrand;

  List<String> time = [
    "Minutes",
    "Hours",
    "Days",
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    super.build(context);
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.add_product,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 60,
              ),
              Text(
                AppLocalizations.of(context)!.product_setup,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Ember_Display_Medium'),
              ),
              SizedBox(
                height: h / 40,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.product_name,
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
                controller: addproduct.productNameController,

                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please entre product name";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
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
                  hintText: "Product name",
                ),
              ),
              SizedBox(
                height: h / 40,
              ),
              Row(
                children: [
                  Text(
                    "${  AppLocalizations.of(context)!.product_name}(in french)",
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
                controller: addproduct.frproductNameController,
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                // ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please entre product name";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
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
                  hintText: "Product name",
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Text(  AppLocalizations.of(context)!.product_description, style: A_style_medium),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
                controller: addproduct.productDesController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please entre description";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
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
                  hintText: "Enter description",
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Text("${  AppLocalizations.of(context)!.product_description}(in french)", style: A_style_medium),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
                controller: addproduct.frproductDesController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please entre description";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
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
                  hintText: "Enter description",
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.product_type,
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
              FutureBuilder(
                future: addproduct.producttypelist(),
                builder: (context, snapshot) {
                  return addproduct.prodtype.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.only(
                              top: 0, left: 10, right: 10, bottom: 3),
                          width: w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            underline: const SizedBox(),
                            // Initial Value
                            value: addproduct.producttype,
                            hint: Text(
                              'Select type',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey.shade600),
                            // Array list of items
                            items: addproduct.prodtype
                                .elementAt(0)
                                .data!
                                .map<DropdownMenuItem>((items) {
                              return DropdownMenuItem(
                                value: items.productType.toString(),
                                child: Text(items.productType.toString(),
                                    style: A_style_medium),
                              );
                            }).toList(),
                            onChanged: (newvalue) {
                              print("ijj$newvalue");
                              setState(() {
                                addproduct.producttype = newvalue;
                              });
                              print(
                                  "hfdhfjh${addproduct.producttype.toString()}");
                            },
                          ),
                        )
                      : TextFormField(
                          // controller: addproduct.productNameController,
                          // inputFormatters: [
                          //   FilteringTextInputFormatter.digitsOnly,
                          // ],
                          readOnly: true,
                          initialValue: 'Select Type',
                          decoration: InputDecoration(
                            filled: true,
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
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
                            //hintText: "Product name",
                          ),
                        );
                },
              ),

              SizedBox(
                height: h / 60,
              ),
              Row(
                children: [
                  Text(  AppLocalizations.of(context)!.product_category, style: A_style_medium),
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
              GestureDetector(
                onTap: () {
                  Get.dialog(
                      // title: "Select Category",
                      Padding(
                    padding: const EdgeInsets.only(
                        left: 35.0, bottom: 35, right: 35, top: 80),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: h / 1.4,
                          width: 500,
                          child: Column(
                            children: [
                              TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Search by categories",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black)))),
                              SizedBox(height: 5),
                              FutureBuilder(
                                future: addproduct.Categories(),
                                builder: (context, snapshot) {
                                  return snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Obx(() => Container(
                                            height: h / 1.5,
                                            child: ListView.builder(
                                              itemCount: addproduct.cate
                                                  .elementAt(0)
                                                  .data!
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        addproduct
                                                                .subsubcatename
                                                                .value =
                                                            addproduct.cate
                                                                .elementAt(0)
                                                                .data!
                                                                .elementAt(
                                                                    index)
                                                                .categoryEnglishName
                                                                .toString();
                                                        addproduct
                                                                .categoriesid =
                                                            addproduct.cate
                                                                .elementAt(0)
                                                                .data!
                                                                .elementAt(
                                                                    index)
                                                                .categoryId;
                                                      });
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1)),
                                                        child: Text(
                                                            "${addproduct.cate.elementAt(0).data!.elementAt(index).categoryEnglishName}")),
                                                  ),
                                                );
                                              },
                                            ),
                                          ));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ));
                  //showMyDropdownCategoryDialog(context);
                },
                child: Container(
                  width: w,
                  height: h / 13,
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Obx(() => addproduct.subsubcatename == ""
                      ? Text(
                          'Select category',
                          style: TextStyle(color: Colors.grey.shade600),
                        )
                      : Text(addproduct.subsubcatename.value.toString())),
                ),
              ),
              SizedBox(
                height: h / 60,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(  AppLocalizations.of(context)!.product_code_sku, style: A_style_medium),
                  GestureDetector(
                    onTap: () {
                      addproduct.generate6DigitAlphanumericCode();
                    },
                    child: Text(
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
                  ),
                ],
              ),
              SizedBox(
                height: h / 100,
              ),
              TextFormField(
                controller: addproduct.generateCodeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please entre code";
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
                  hintText: "Product SKU",
                ),
              ),
              SizedBox(
                height: h / 60,
              ),
              Text(  AppLocalizations.of(context)!.product_weight, style: A_style_medium),
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
                      controller: addproduct.produweigth,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please entre weight";
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Ex 10",
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
                      value: addproduct.prodweigth,
                      hint: Text(
                        'Select unit',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey.shade600),
                      // Array list of items
                      items: weigth.map((String items) {
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
                          addproduct.prodweigth = newvalue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 50,
              ),
              Text(  AppLocalizations.of(context)!.order_preparation_time, style: A_style_medium),
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
                      controller: addproduct.prodpreatime,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please entre time";
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(5)],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
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
                      value: addproduct.valueChooseTime,
                      hint: Text(
                        'Minutes',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey.shade600),
                      // Array list of items
                      items: time.map((String items) {
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
                          addproduct.valueChooseTime = newvalue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h / 60,
              ),
              CustomButton(
                  title:   AppLocalizations.of(context)!.continuee,
                  onTap: () {
                    //Get.to(AddProductinnoutVariant());
                    if (addproduct.producttype == null ||
                        addproduct.subsubcatename == "") {
                      print("oii");
                      Utils().sendMassage("Please fill all data");
                    } else if (formKey.currentState!.validate()) {
                      Get.to(AddProductinnoutVariant());
                    }
                  }),
              SizedBox(
                height: h / 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductSize {
  final String name;

  ProductSize({required this.name});

  @override
  String toString() {
    return 'Size(name: $name)';
  }
}

class ProductColor {
  final String name;

  ProductColor({required this.name});

  @override
  String toString() {
    return 'Color(name: $name)';
  }
}

showMyDropdownCategoryDialog(BuildContext context) async {
  List<String> dropdownItems = [
    "Bags & Shoes",
    "Mobiles",
    "ebook",
    "Women's Fashion",
    "Men's Fashion",
    "Toys",
    "Bags & Shoes",
    "Mobiles",
    "ebook",
    "Women's Fashion",
    "Men's Fashion",
    "Toys",
    "Bags & Shoes",
    "Mobiles",
    "ebook",
    "Women's Fashion",
    "Men's Fashion",
    "Toys"
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
                        hintText: "Search in categories",
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

Widget buildDropdownButton({
  required String value,
  required Function onChanged,
  required List<DropdownMenuItem<String>> items,
}) {
  return DropdownButton(
    value: value,
    onChanged: onChanged as void Function(String?)?,
    items: items,
  );
}

// showMyDropdownBrandDialog(BuildContext context) async {
//   List<String> dropdownItems = [
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//   ];
//   final h = MediaQuery.of(context).size.height;
//   final w = MediaQuery.of(context).size.width;
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return ListView(
//         children: [
//           AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             backgroundColor: Colors.white,
//             title: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: const Icon(
//                         Icons.close,
//                         color: Colors.black,
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: h / 70,
//                 ),
//                 Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.black),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search in brands",
//                         focusColor: Colors.white,
//                         floatingLabelBehavior: FloatingLabelBehavior.never,
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Colors.grey,
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             Icons.cancel,
//                             color: Colors.grey,
//                           ),
//                           onPressed: () {},
//                         ),
//                         border: InputBorder.none, // Remove the underline
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               SizedBox(
//                 height: h / 1.4,
//                 child: ListView.builder(
//                     itemCount: dropdownItems.length,
//                     shrinkWrap: true,
//                     physics: ScrollPhysics(),
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: const EdgeInsets.all(4),
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.shade300, blurRadius: 3)
//                             ]),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               dropdownItems[index],
//                               style: TextStyle(
//                                   //letterSpacing: 1.5,
//                                   //color: Colors.white,
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                   // fontFamily: "Amazon_med",
//                                   fontSize: 16),
//                               maxLines: 2,
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//               )
//             ],
//           ),
//         ],
//       );
//     },
//   );
//
// }

// import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:intl/intl.dart';
// import 'package:multi_dropdown/multiselect_dropdown.dart';
//
// import '../../../../innt_delivery/Controllers/text2.dart';
// import '../../../../innt_delivery/base/custom_button.dart';
// import 'add_product_variant.dart';
//
// class AddProduct extends StatefulWidget {
//   const AddProduct({super.key});
//
//   @override
//   State<AddProduct> createState() => _AddProductState();
// }
//
// class _AddProductState extends State<AddProduct>
//     with AutomaticKeepAliveClientMixin<AddProduct>, TickerProviderStateMixin {
//   // Changed to TickerProviderStateMixin
//   final MultiSelectController<ProductSize> _controller =
//       MultiSelectController();
//   final MultiSelectController<ProductColor> colorController =
//       MultiSelectController();
//
//   List<ValueItem> _selectedOptions = [];
//
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     _tabController =
//         TabController(length: 2, vsync: this); // Used 'this' as vsync
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   bool get wantKeepAlive => true;
//   TextEditingController productNameController = TextEditingController();
//   TextEditingController productDesController = TextEditingController();
//   TextEditingController productTypController = TextEditingController();
//   TextEditingController generateCodeController = TextEditingController();
//   String? valuedropDownChoose;
//   String? valuedropDownBrandsChoose;
//
//   String? valueChoose;
//   bool _isChecked = false;
//   List<String> listdropDownCategoryitem = [];
//   List<String> listdropDownBranditem = [];
//
//   List<String> listitem = [
//     "Physical",
//     "Digital",
//   ];
//   String? valueChooseSize;
//   List<String> sizeItem = ["Select", "Free size", "S", "M", "L", "XL", "XXL"];
//
//   String? valueChooseBrand;
//   List<String> brandItem = [
//     "Select type",
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//   ];
//   String? valueChooseOtherBrand;
//   // List<String> brandOtherItem = [
//   //   "Select brand",
//   //   "Crave",
//   //   "JK",
//   //   "Fashion",
//   //   "i Bird",
//   // ];
//   // String? valueChooseCategory;
//   // List<String> CategoryItem = [
//   //   "Bags & Shoes",
//   //   "Mobiles",
//   //   "ebook",
//   //   "Women's Fashion",
//   //   "Men's Fashion",
//   //   "Toys"
//   // ];
//   String? valueChooseTime;
//   List<String> time = [
//     "Minutes",
//     "Hours",
//     "Days",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//     super.build(context);
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Add Product",
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: h / 60,
//             ),
//             Text(
//               'Product set up',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontFamily: 'Ember_Display_Medium'),
//             ),
//             SizedBox(
//               height: h / 40,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Product name",
//                   style: A_style_medium,
//                 ),
//                 SizedBox(
//                   width: w / 100,
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                       color: customColor,
//                       fontSize: 14,
//                       fontFamily: "Ember_Medium",
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: h / 100,
//             ),
//             TextFormField(
//               controller: productNameController,
//               inputFormatters: [
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//               /* validator: (value) {
//                                   if (value!.length < 10) {
//                                     return "Invalid email address";
//                                   } else {
//                                     return null;
//                                   }
//                                 },*/
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.multiline,
//               maxLines: 1,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 hintText: "Product name",
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             Row(
//               children: [
//                 Text(
//                   "Product description",
//                   style: A_style_medium,
//                 ),
//                 SizedBox(
//                   width: w / 100,
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                       color: customColor,
//                       fontSize: 14,
//                       fontFamily: "Ember_Medium",
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//
//             SizedBox(
//               height: h / 100,
//             ),
//             TextFormField(
//               controller: productDesController,
//               /* validator: (value) {
//                                   if (value!.length < 10) {
//                                     return "Invalid email address";
//                                   } else {
//                                     return null;
//                                   }
//                                 },*/
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.multiline,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 helperMaxLines: 3,
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 hintText: "Enter description",
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             /*   Text(
//               "Product Name",
//               style: smallText,
//             ),
//             SizedBox(
//               height: h / 90,
//             ),
//             TextFormField(
//               controller: productNameController,
//               inputFormatters: [
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//               */ /* validator: (value) {
//                                   if (value!.length < 10) {
//                                     return "Invalid email address";
//                                   } else {
//                                     return null;
//                                   }
//                                 },*/
//             /*
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.multiline,
//               maxLines: 1,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 hintText: "Product Name (FR)",
//               ),
//             ),
//             SizedBox(
//               height: h / 50,
//             ),
//             Text("Product Description* (FR)", style: smallText),
//             SizedBox(
//               height: h / 90,
//             ),
//             TextFormField(
//               controller: productDesController,
//               */ /* validator: (value) {
//                                   if (value!.length < 10) {
//                                     return "Invalid email address";
//                                   } else {
//                                     return null;
//                                   }
//                                 },*/ /*
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.multiline,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 helperMaxLines: 3,
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 hintText: "Enter Description (FR)",
//               ),
//             ),
//             SizedBox(
//               height: h / 50,
//             ),*/
//             /*   Text("Product Type", style: A_style_medium),
//             SizedBox(
//               height: h / 90,
//             ),
//             Container(
//               width: w,
//               padding:
//                   const EdgeInsets.only(top: 0, left: 20, right: 10, bottom: 3),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Colors.grey, width: 1),
//               ),
//               child: DropdownButton(
//                 dropdownColor: Colors.white,
//                 underline: const SizedBox(),
//                 // Initial Value
//                 value: valueChoose,
//                 hint: Text('Select',
//                     style: A_style_medium // Set text color to black
//                     ),
//                 isExpanded: true,
//                 // Down Arrow Icon
//                 icon:
//                     const Icon(Icons.keyboard_arrow_down, color: Colors.black),
//                 // Array list of items
//                 items: listitem.map((String items) {
//                   return DropdownMenuItem(
//                     value: items,
//                     child: Text(items, style: A_style_medium),
//                   );
//                 }).toList(),
//                 onChanged: (newvalue) {
//                   setState(() {
//                     valueChoose = newvalue;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(
//               height: h / 50,
//             ),*/
//             Row(
//               children: [
//                 Text(
//                   "Product type",
//                   style: A_style_medium,
//                 ),
//                 SizedBox(
//                   width: w / 100,
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                       color: customColor,
//                       fontSize: 14,
//                       fontFamily: "Ember_Medium",
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: h / 100,
//             ),
//             Container(
//               padding:
//                   const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 3),
//               width: w,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Colors.grey, width: 1),
//               ),
//               child: DropdownButton(
//                 dropdownColor: Colors.white,
//                 underline: const SizedBox(),
//                 // Initial Value
//                 value: valueChooseBrand,
//                 hint: Text(
//                   'Select type',
//                   style: TextStyle(color: Colors.grey.shade600),
//                 ),
//                 isExpanded: true,
//                 // Down Arrow Icon
//                 icon: Icon(Icons.keyboard_arrow_down,
//                     color: Colors.grey.shade600),
//                 // Array list of items
//                 items: brandItem.map((String items) {
//                   return DropdownMenuItem(
//                     value: items,
//                     child: Text(items, style: A_style_medium),
//                   );
//                 }).toList(),
//                 onChanged: (newvalue) {
//                   setState(() {
//                     valueChooseBrand = newvalue;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             Row(
//               children: [
//                 Text("Product category", style: A_style_medium),
//                 SizedBox(
//                   width: w / 100,
//                 ),
//                 Text(
//                   "*",
//                   style: TextStyle(
//                       color: customColor,
//                       fontSize: 14,
//                       fontFamily: "Ember_Medium",
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: h / 100,
//             ),
//
//             GestureDetector(
//               onTap: () {
//                 showMyDropdownCategoryDialog(context);
//               },
//               child: Container(
//                 width: w,
//                 height: h / 13,
//                 padding: const EdgeInsets.only(
//                   top: 0,
//                   left: 10,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: Colors.grey, width: 1),
//                 ),
//                 child: DropdownButton(
//                   dropdownColor: Colors.white,
//                   underline: const SizedBox(),
//                   // Initial Value
//                   value: valuedropDownChoose,
//                   hint: Text(
//                     'Select category',
//                     style: TextStyle(color: Colors.grey.shade600),
//                   ),
//                   isExpanded: true,
//                   // Down Arrow Icon
//                   icon: const Icon(Icons.keyboard_arrow_down,
//                       color: Colors.black),
//                   // Array list of items
//                   items: listdropDownCategoryitem.map((String items) {
//                     return DropdownMenuItem(
//                       onTap: () {
//                         showMyDropdownCategoryDialog(context);
//                       },
//                       value: items,
//                       child: Text(items, style: A_style_medium),
//                     );
//                   }).toList(),
//                   onChanged: (newvalue) {
//                     setState(() {
//                       valuedropDownChoose = newvalue;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             Text("Size", style: A_style_medium),
//             SizedBox(
//               height: h / 100,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius:
//                     BorderRadius.circular(5), // Adjust the value as needed
//                 border: Border.all(
//                     color: Colors.grey), // Add border color if needed
//               ),
//               child: MultiSelectDropDown(
//                 borderColor: Colors.white,
//                 controller: _controller,
//                 onOptionSelected: (options) {},
//                 options: <ValueItem<ProductSize>>[
//                   ValueItem(
//                     label: 'Free Size',
//                     value: ProductSize(
//                       name: 'Product Name',
//                     ),
//                   ),
//                   ValueItem(
//                     label: 'S',
//                     value: ProductSize(
//                       name: 'Product Name',
//                     ),
//                   ),
//                   ValueItem(
//                     label: 'M',
//                     value: ProductSize(
//                       name: 'Product Name',
//                     ),
//                   ),
//                   ValueItem(
//                     label: 'L',
//                     value: ProductSize(
//                       name: 'Product Name',
//                     ),
//                   ),
//                   ValueItem(
//                     label: 'XL',
//                     value: ProductSize(
//                       name: 'Product Name',
//                     ),
//                   ),
//                 ],
//                 maxItems: 4,
//                 singleSelectItemStyle: TextStyle(color: Colors.black),
//                 padding: EdgeInsets.all(12),
//                 chipConfig: const ChipConfig(
//                   wrapType: WrapType.wrap,
//                   backgroundColor: logocolo,
//                 ),
//                 optionTextStyle: TextStyle(color: Colors.grey.shade600),
//                 selectedOptionIcon: const Icon(
//                   Icons.check_circle,
//                   color: Colors.pink,
//                 ),
//                 selectedOptionBackgroundColor: Colors.grey.shade300,
//                 selectedOptionTextColor: Colors.blue,
//                 hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
//                 focusedBorderColor: Colors.white,
//                 onOptionRemoved: (index, option) {},
//                 optionBuilder: (context, valueItem, isSelected) {
//                   return ListTile(
//                     leading: isSelected
//                         ? const Icon(Icons.check_box)
//                         : const Icon(Icons.check_box_outline_blank),
//                     title: Text(valueItem.label),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text("Product SKU", style: A_style_medium),
//                     SizedBox(
//                       width: w / 100,
//                     ),
//                     Text(
//                       "*",
//                       style: TextStyle(
//                           color: customColor,
//                           fontSize: 14,
//                           fontFamily: "Ember_Medium",
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "Generate",
//                   style: TextStyle(
//                       //letterSpacing: 1.5,
//                       //color: Colors.white,
//                       overflow: TextOverflow.ellipsis,
//                       fontWeight: FontWeight.w500,
//                       color: logocolo,
//                       fontFamily: "Amazon_med",
//                       fontSize: 16),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: h / 100,
//             ),
//             TextFormField(
//               controller: generateCodeController,
//               /* validator: (value) {
//                                   if (value!.length < 10) {
//                                     return "Invalid email address";
//                                   } else {
//                                     return null;
//                                   }
//                                 },*/
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 helperMaxLines: 3,
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 hintText: "Product SKU",
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             Text("Select brand", style: A_style_medium),
//             SizedBox(
//               height: h / 90,
//             ),
//
//             GestureDetector(
//               onTap: () {
//                 showMyDropdownBrandDialog(context);
//               },
//               child: Container(
//                 width: w,
//                 height: h / 13,
//                 padding: const EdgeInsets.only(
//                   top: 0,
//                   left: 10,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: Colors.grey, width: 1),
//                 ),
//                 child: DropdownButton(
//                   dropdownColor: Colors.white,
//                   underline: const SizedBox(),
//                   // Initial Value
//                   value: valuedropDownBrandsChoose,
//                   hint: Text(
//                     'Select brands',
//                     style: TextStyle(color: Colors.grey.shade600),
//                   ),
//                   isExpanded: true,
//                   // Down Arrow Icon
//                   icon: const Icon(Icons.keyboard_arrow_down,
//                       color: Colors.black),
//                   // Array list of items
//                   items: listdropDownBranditem.map((String items) {
//                     return DropdownMenuItem(
//                       onTap: () {
//                         showMyDropdownBrandDialog(context);
//                       },
//                       value: items,
//                       child: Text(items, style: A_style_medium),
//                     );
//                   }).toList(),
//                   onChanged: (newvalue) {
//                     setState(() {
//                       valuedropDownBrandsChoose = newvalue;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             Text("Brand not found?", style: A_style_medium),
//             SizedBox(
//               height: h / 100,
//             ),
//             TextFormField(
//               controller: productDesController,
//               /* validator: (value) {
//                                   if (value!.length < 10) {
//                                     return "Invalid email address";
//                                   } else {
//                                     return null;
//                                   }
//                                 },*/
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.grey, width: 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 hintText: "Type the brand name here",
//               ),
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             // Container(
//             //   padding:
//             //       const EdgeInsets.only(top: 0, left: 20, right: 10, bottom: 3),
//             //   width: w,
//             //   decoration: BoxDecoration(
//             //     color: Colors.white,
//             //     borderRadius: BorderRadius.circular(5),
//             //     border: Border.all(color: Colors.grey, width: 1),
//             //   ),
//             //   child: DropdownButton(
//             //     dropdownColor: Colors.white,
//             //     underline: const SizedBox(),
//             //     // Initial Value
//             //     value: valueChooseCategory,
//             //     hint: Text(
//             //       'Select',
//             //       style: TextStyle(color: Colors.grey.shade600),
//             //     ),
//             //     isExpanded: true,
//             //     // Down Arrow Icon
//             //     icon: Icon(Icons.keyboard_arrow_down,
//             //         color: Colors.grey.shade600),
//             //     // Array list of items
//             //     items: CategoryItem.map((String items) {
//             //       return DropdownMenuItem(
//             //         value: items,
//             //         child: Text(
//             //           items,
//             //           style: A_style_medium,
//             //         ),
//             //       );
//             //     }).toList(),
//             //     onChanged: (newvalue) {
//             //       setState(() {
//             //         valueChooseCategory = newvalue;
//             //       });
//             //     },
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: h / 50,
//             // ),

//             Text("Product order preparation time", style: A_style_medium),
//             SizedBox(
//               height: h / 90,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(
//                       top: 0, left: 20, right: 10, bottom: 3),
//                   width: w / 2.5,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(color: Colors.grey, width: 1),
//                   ),
//                   child: DropdownButton(
//                     dropdownColor: Colors.white,
//                     underline: const SizedBox(),
//                     // Initial Value
//                     value: valueChooseTime,
//                     hint: Text(
//                       '0',
//                       style: TextStyle(color: Colors.grey.shade600),
//                     ),
//                     isExpanded: true,
//                     // Down Arrow Icon
//                     icon: Icon(Icons.keyboard_arrow_down,
//                         color: Colors.grey.shade600),
//                     // Array list of items
//                     items: time.map((String items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(
//                           items,
//                           style: A_style_medium,
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (newvalue) {
//                       setState(() {
//                         valueChooseTime = newvalue;
//                       });
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(
//                       top: 0, left: 20, right: 10, bottom: 3),
//                   width: w / 2.5,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(color: Colors.grey, width: 1),
//                   ),
//                   child: DropdownButton(
//                     dropdownColor: Colors.white,
//                     underline: const SizedBox(),
//                     // Initial Value
//                     value: valueChooseTime,
//                     hint: Text(
//                       'minutes',
//                       style: TextStyle(color: Colors.grey.shade600),
//                     ),
//                     isExpanded: true,
//                     // Down Arrow Icon
//                     icon: Icon(Icons.keyboard_arrow_down,
//                         color: Colors.grey.shade600),
//                     // Array list of items
//                     items: time.map((String items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(
//                           items,
//                           style: A_style_medium,
//                         ),
//                       );
//                     }).toList(),
//                     onChanged: (newvalue) {
//                       setState(() {
//                         valueChooseTime = newvalue;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: h / 60,
//             ),
//             CustomButton(
//                 title: 'Continue',
//                 onTap: () {
//                   Get.to(() => AddProductVariant());
//                 }),
//             SizedBox(
//               height: h / 90,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ProductSize {
//   final String name;
//
//   ProductSize({required this.name});
//
//   @override
//   String toString() {
//     return 'Size(name: $name)';
//   }
// }
//
// class ProductColor {
//   final String name;
//
//   ProductColor({required this.name});
//
//   @override
//   String toString() {
//     return 'Color(name: $name)';
//   }
// }
//
// showMyDropdownCategoryDialog(BuildContext context) async {
//   List<String> dropdownItems = [
//     "Bags & Shoes",
//     "Mobiles",
//     "ebook",
//     "Women's Fashion",
//     "Men's Fashion",
//     "Toys",
//     "Bags & Shoes",
//     "Mobiles",
//     "ebook",
//     "Women's Fashion",
//     "Men's Fashion",
//     "Toys",
//     "Bags & Shoes",
//     "Mobiles",
//     "ebook",
//     "Women's Fashion",
//     "Men's Fashion",
//     "Toys"
//   ];
//   final h = MediaQuery.of(context).size.height;
//   final w = MediaQuery.of(context).size.width;
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return ListView(
//         children: [
//           AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             backgroundColor: Colors.white,
//             title: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: const Icon(
//                         Icons.close,
//                         color: Colors.black,
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: h / 70,
//                 ),
//                 Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.black),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search in categories",
//                         focusColor: Colors.white,
//                         floatingLabelBehavior: FloatingLabelBehavior.never,
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Colors.grey,
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             Icons.cancel,
//                             color: Colors.grey,
//                           ),
//                           onPressed: () {},
//                         ),
//                         border: InputBorder.none, // Remove the underline
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               SizedBox(
//                 height: h / 1.4,
//                 child: ListView.builder(
//                     itemCount: dropdownItems.length,
//                     shrinkWrap: true,
//                     physics: ScrollPhysics(),
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: const EdgeInsets.all(4),
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.shade300, blurRadius: 3)
//                             ]),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               dropdownItems[index],
//                               style: TextStyle(
//                                   //letterSpacing: 1.5,
//                                   //color: Colors.white,
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                   // fontFamily: "Amazon_med",
//                                   fontSize: 16),
//                               maxLines: 2,
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//               )
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }
//
// showMyDropdownBrandDialog(BuildContext context) async {
//   List<String> dropdownItems = [
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//     "Crave",
//     "JK",
//     "Fashion",
//     "i Bird",
//   ];
//   final h = MediaQuery.of(context).size.height;
//   final w = MediaQuery.of(context).size.width;
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return ListView(
//         children: [
//           AlertDialog(
//             contentPadding: EdgeInsets.all(0),
//             backgroundColor: Colors.white,
//             title: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: const Icon(
//                         Icons.close,
//                         color: Colors.black,
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: h / 70,
//                 ),
//                 Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.black),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search in brands",
//                         focusColor: Colors.white,
//                         floatingLabelBehavior: FloatingLabelBehavior.never,
//                         prefixIcon: Icon(
//                           Icons.search,
//                           color: Colors.grey,
//                         ),
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             Icons.cancel,
//                             color: Colors.grey,
//                           ),
//                           onPressed: () {},
//                         ),
//                         border: InputBorder.none, // Remove the underline
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             actions: <Widget>[
//               SizedBox(
//                 height: h / 1.4,
//                 child: ListView.builder(
//                     itemCount: dropdownItems.length,
//                     shrinkWrap: true,
//                     physics: ScrollPhysics(),
//                     scrollDirection: Axis.vertical,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Container(
//                         margin: const EdgeInsets.all(4),
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.shade300, blurRadius: 3)
//                             ]),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               dropdownItems[index],
//                               style: TextStyle(
//                                   //letterSpacing: 1.5,
//                                   //color: Colors.white,
//                                   overflow: TextOverflow.ellipsis,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black,
//                                   // fontFamily: "Amazon_med",
//                                   fontSize: 16),
//                               maxLines: 2,
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//               )
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }
