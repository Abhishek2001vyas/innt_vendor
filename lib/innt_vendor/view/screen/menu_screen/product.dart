import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../innt_delivery/base/custom_button.dart';
import '../../../../ulits/utils.dart';
import '../../Api/Add_product_api.dart';
import 'add_product_variant.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct>
    with AutomaticKeepAliveClientMixin<AddProduct>, TickerProviderStateMixin {
  // Changed to TickerProviderStateMixin
  final MultiSelectController<ProductSize> _controller =
      MultiSelectController();
  final MultiSelectController<ProductColor> colorController =
      MultiSelectController();
  late List<bool> _isExpandedList = List.generate(
      addproduct.cate.elementAt(0).data!.length, (index) => false);
  late List<bool> _isExpandedList1 = List.generate(
      addproduct.subcate1.elementAt(0).data!.length, (index) => false);

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
    addproduct.productDesController.clear();
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

  //List<String> sizeItem = ["Select", "Free size", "S", "M", "L", "XL", "XXL"];

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
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
                Text("${  AppLocalizations.of(context)!.product_description}(in english)", style: A_style_medium),
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
                      "${  AppLocalizations.of(context)!.product_type}",
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
                    Text("${  AppLocalizations.of(context)!.product_category}", style: A_style_medium),
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
                                    onChanged: (value) async {
                                      print('lkjjjjj');
                                      addproduct.searchcat.clear();
                                      List<int> indexes = addproduct.cate
                                          .elementAt(0)
                                          .data!
                                          .asMap()
                                          .entries
                                          .where((entry) => entry
                                              .value.categoryEnglishName!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                          .map((entry) => entry.key)
                                          .toList();
                                      print("llll$indexes");

                                      addproduct.searchcat.add(indexes
                                          .where((index) =>
                                              index >= 0 &&
                                              index <
                                                  addproduct.cate
                                                      .elementAt(0)
                                                      .data!
                                                      .length)
                                          .map((index) => addproduct.cate
                                              .elementAt(0)
                                              .data![index]));
                                      print("jhjh${addproduct.searchcat}");
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Search by categoriess",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)))),
                                SizedBox(height: 5),
                                FutureBuilder(
                                  future: addproduct.Categories(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return Obx(() => Container(
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
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                    child: ExpansionTile(
                                                      //initiallyExpanded:  index==addproduct.expandedTileIndex?true:false ,
                                                      onExpansionChanged:
                                                          (value) {
                                                        addproduct.subCategories(
                                                            addproduct.cate
                                                                .elementAt(0)
                                                                .data!
                                                                .elementAt(
                                                                    index)
                                                                .categoryId
                                                                .toString());
                                                        // You don't need to call setState here
                                                        print(
                                                            "ioiii${addproduct.expandedTileIndex}");
                                                      },
                                                      title: Text(
                                                          "${addproduct.cate.elementAt(0).data!.elementAt(index).categoryEnglishName}"),
                                                      children: [
                                                        Obx(() =>
                                                            addproduct.subcate1
                                                                    .isEmpty
                                                                ? SizedBox(
                                                                    height:
                                                                        h / 20,
                                                                    width: w,
                                                                  )
                                                                : ListView
                                                                    .builder(
                                                                    physics:
                                                                        NeverScrollableScrollPhysics(),
                                                                    itemCount: addproduct
                                                                        .subcate1
                                                                        .elementAt(
                                                                            0)
                                                                        .data!
                                                                        .length,
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index1) {
                                                                      return Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            bottom:
                                                                                5.0),
                                                                        child:
                                                                            ExpansionTile(
                                                                          onExpansionChanged:
                                                                              (value) {
                                                                            addproduct.subsubCategories(addproduct.subcate1.elementAt(0).data!.elementAt(index1).subcategoryId.toString());
                                                                            // You don't need to call setState here
                                                                          },
                                                                          title:
                                                                              Text("${addproduct.subcate1.elementAt(0).data!.elementAt(index1).englishSubcategoryName}"),
                                                                          expandedCrossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Obx(() => addproduct.subsubcate.isEmpty
                                                                                ? SizedBox(
                                                                                    height: h / 20,
                                                                                    width: w,
                                                                                  )
                                                                                : Padding(
                                                                                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                                                                    child: ListView.builder(
                                                                                        itemCount: addproduct.subsubcate.length,
                                                                                        shrinkWrap: true,
                                                                                        itemBuilder: (context, index2) {
                                                                                          return Padding(
                                                                                            padding: const EdgeInsets.only(bottom: 8.0),
                                                                                            child: ListView.builder(
                                                                                              shrinkWrap: true,
                                                                                              itemCount: addproduct.subsubcate.elementAt(index2).data!.length,
                                                                                              itemBuilder: (context, index) {
                                                                                                return Padding(
                                                                                                  padding: const EdgeInsets.only(bottom: 5.0),
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () {
                                                                                                      addproduct.subsubcatename.value = addproduct.subsubcate.elementAt(index2).data!.elementAt(index).englishSubSubcategoryName.toString();
                                                                                                      addproduct.subsubcategoriesid = addproduct.subsubcate.elementAt(index2).data?.elementAt(index).id;
                                                                                                      Get.back();
                                                                                                    },
                                                                                                    child: Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black, width: 1)), child: Text("${addproduct.subsubcate.elementAt(index2).data?.elementAt(index).englishSubSubcategoryName}")),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                  ))
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ));
                                    }
                                  },
                                )
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
                    Text("${  AppLocalizations.of(context)!.product_code_sku}", style: A_style_medium),
                    GestureDetector(
                      onTap: () {
                        addproduct.generate6DigitAlphanumericCode();
                      },
                      child: Text(
                        "${  AppLocalizations.of(context)!.generate}",
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
                Text("${  AppLocalizations.of(context)!.select_brand}", style: A_style_medium),
                SizedBox(
                  height: h / 90,
                ),
                Obx(() => addproduct.prodbrand.isEmpty
                    ? TextFormField(
                        readOnly: true,
                        initialValue: 'Select brand',
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
                          hintText: "Select brand",
                        ),
                      )
                    : addproduct.prodbrand.elementAt(0).data!.isEmpty
                        ? TextFormField(
                            readOnly: true,
                            initialValue: 'Select brand',
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
                              hintText: "Select brand",
                            ),
                          )
                        : Container(
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
                              value: addproduct.brand,
                              hint: Text(
                                'Select brands',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              isExpanded: true,
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.black),
                              // Array list of items
                              items: addproduct.prodbrand
                                  .elementAt(0)
                                  .data!
                                  .elementAt(0)
                                  .brand!
                                  .map((items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: logocolo,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text(
                                            items,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 16,
                                              // Customize font size as needed
                                              fontWeight: FontWeight.normal,
                                              // Customize font weight as needed
                                              color: Colors
                                                  .white, // Customize text color as needed
                                            ),
                                          ),
                                        ),
                                        if (items == addproduct.brand)
                                          Positioned(
                                              right: 1,
                                              top: -5,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    addproduct.brand = null;
                                                    setState(() {});
                                                  },
                                                  child: Icon(Icons.close,
                                                      color: Colors.red))),
                                      ],
                                    ));
                              }).toList(),
                              onChanged: (newvalue) {
                                setState(() {
                                  addproduct.brand = newvalue;
                                });
                              },
                            ),
                          )),
                SizedBox(
                  height: h / 60,
                ),
                Text("${  AppLocalizations.of(context)!.brand_not_found_question}", style: A_style_medium),
                SizedBox(
                  height: h / 100,
                ),
                TextFormField(
                  controller: addproduct.brandnotfound,
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
                    hintText: "Type the brand name here",
                  ),
                ),
                SizedBox(
                  height: h / 60,
                ),
                Text("${  AppLocalizations.of(context)!.product_weight}", style: A_style_medium),
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
                Text("${  AppLocalizations.of(context)!.order_preparation_time}", style: A_style_medium),
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
                    title: 'Continue',
                    onTap: () async {
                      print("kjkifgjokdsjg${addproduct.subsubcatename}");

                      if (addproduct.brand == null &&
                          addproduct.brandnotfound.text.isEmpty) {
                        print("oii");
                        Utils().sendMassage("Please fill brand");
                      } else if (addproduct.brand != null &&
                          addproduct.brandnotfound.text.isNotEmpty) {
                        print("oii");
                        Utils().sendMassage(
                            "Please fill only one brand (dropdown or input field)");
                      } else if (addproduct.producttype == null ||
                          addproduct.subsubcatename == "") {
                        print("oii");
                        Utils().sendMassage("Please fill all data");
                      } else if (formKey.currentState!.validate()) {
                        // await addproduct.productsizelist();
                        Get.to(() => AddProductVariant());
                      }
                      //
                      // print("ppiii");
                    }),
                SizedBox(
                  height: h / 90,
                ),
              ],
            ),
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
