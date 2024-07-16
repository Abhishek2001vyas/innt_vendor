import 'package:demo_innt/innt_vendor/view/screen/menu_screen/aad_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../ulits/constant.dart';
import '../../Api/productlist_api.dart';
import '../scan_screen.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String selectedItem = 'Move to bag';
  late bool isDarkMode;
  final productlis = Get.put(productlist_api());

  @override
  void initState() {
    // TODO: implement initState
    productlis.productdeatilslist
                .elementAt(0)["data"]
                .elementAt(0)["product_status"] ==
            0
        ? setState(() {
            isDarkMode = true;
          })
        : setState(() {
            isDarkMode = false;
          });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.product_details,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0.0, 1.0), //(x,y)
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      image_url.toString() +
                                          productlis.productdeatilslist
                                              .elementAt(0)["data"]!
                                              .elementAt(index)["image1"]
                                              .toString(),
                                      height: 80,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: h / 60,
                                    ),
                                    Text(
                                      productlis.productdeatilslist
                                          .elementAt(0)["data"]!
                                          .elementAt(index)["productType"]
                                          .toString(),
                                      style: TextStyle(
                                        color: logocolo,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: w / 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: h / 90,
                                    ),
                                    Text(
                                      productlis.productdeatilslist
                                          .elementAt(0)["data"]!
                                          .elementAt(index)["product_name"]
                                          .toString(),
                                      style: A_style_medium,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: h / 40,
                                    ),
                                    Container(
                                      width: w / 1.6,
                                      child: Row(
                                        children: [
                                          Obx(
                                            () => productlis.productdeatilslist
                                                        .elementAt(0)["data"]!
                                                        .elementAt(
                                                            index)["status"] ==
                                                    1
                                                ? Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    child:  Text(
                                                      AppLocalizations.of(context)!.approved,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontFamily:
                                                              "Ember_Bold"),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                : Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6)),
                                                    child:  Text(
                                                      AppLocalizations.of(context)!.pending,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 17,
                                                          fontFamily:
                                                              "Ember_Bold"),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                          ),
                                          SizedBox(
                                            width: w / 14,
                                          ),
                                          productlis.productdeatilslist
                                                      .elementAt(0)["data"]!
                                                      .elementAt(
                                                          index)['status'] ==
                                                  1
                                              ? GestureDetector(
                                                  onTap: () {
                                                    Get.to(() => ScanScreen());
                                                  },
                                                  child: QrImageView(
                                                    data: productlis
                                                        .productdeatilslist
                                                        .elementAt(0)["data"]!
                                                        .elementAt(index)[
                                                            "productCode"]
                                                        .toString(),
                                                    version: QrVersions.auto,
                                                    size: 60.0,
                                                  ),
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: h / 70,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0.0, 1.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.productvisibleonline,
                        style: A_style_text_head2,
                      ),
                      FlutterSwitch(
                        width: 54.0,
                        height: 25.0,
                        valueFontSize: 15.0,
                        toggleSize: 15.0,
                        value: isDarkMode,
                        borderRadius: 30.0,
                        padding: 4.0,
                        showOnOff: true,
                        activeColor: logocolo,
                        inactiveColor: Colors.grey,
                        onToggle: (bool value) {
                          setState(() {
                            productlis.productactive(productlis
                                .productdeatilslist
                                .elementAt(0)["data"]!
                                .elementAt(0)["_id"]);
                            isDarkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h / 70,
                ),
                Text(
                  AppLocalizations.of(context)!.productspecifications,
                  style: A_style_text_head2,
                ),
                SizedBox(
                  height: h / 70,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.selling_price,
                            style: A_style_order,
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          Text(
                            AppLocalizations.of(context)!.discount,
                            style: A_style_order,
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          Text(
                            AppLocalizations.of(context)!.category,
                            style: A_style_order,
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          Text(
                            AppLocalizations.of(context)!.subcategory,
                            style: A_style_order,
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          Text(
                            AppLocalizations.of(context)!.product_type,
                            style: A_style_order,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["sale_price"].toString()}",
                            style: A_style_order,
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["discount"]?.elementAt(0)["discount_value"].toString()}",
                              style: A_style_order,
                            ),
                            productlis.productdeatilslist
                                        .elementAt(0)["data"]!
                                        .elementAt(0)["discount"]
                                        ?.elementAt(0)["discount_value"]
                                        .toString() !=
                                    "Unit"
                                ? TextSpan(
                                    text: "%",
                                    style: A_style_order,
                                  )
                                : TextSpan(),
                          ])),
                          SizedBox(
                            height: h / 70,
                          ),
                          Text(
                            productlis.productdeatilslist
                                        .elementAt(0)["data"]!
                                        .elementAt(0)["categoryId"]![
                                    "category_englishName"] ??
                                "NA",
                            style: A_style_order,
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          productlis.productdeatilslist
                              .elementAt(0)["data"]!
                              .elementAt(0)["subcategoryId"] !=null?
                          Text(
                            productlis.productdeatilslist
                                .elementAt(0)["data"]!
                                .elementAt(0)["subcategoryId"]![
                                    "english_subcategory_name"]
                                .toString(),
                            style: A_style_order,
                          ):Text(
                           "N/A",
                            style: A_style_order,
                          ),
                          SizedBox(
                            height: h / 70,
                          ),
                          Text(
                            productlis.productdeatilslist
                                .elementAt(0)["data"]!
                                .elementAt(0)["productType"]
                                .toString(),
                            style: A_style_order,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h / 70,
                ),
                Text(
                  AppLocalizations.of(context)!.productspecifications,
                  style: A_style_text_head2,
                ),
                SizedBox(
                  height: h / 90,
                ),
                // productlis.productdeatilslist
                //         .elementAt(0)["data"]!
                //         .elementAt(0)["color"]!
                //         .isNotEmpty
                //     ? Text(
                //         "Color : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["color"]!.join(",").toString()}",
                //         style: TextStyle(
                //             // letterSpacing: 2,
                //             //color: Colors.white,
                //             overflow: TextOverflow.ellipsis,
                //             color: Colors.grey.shade900,
                //             fontFamily: "Amazon_thin",
                //             fontSize: 17),
                //         maxLines: 6,
                //       )
                //     : SizedBox(),
                // SizedBox(
                //   height: h / 90,
                // ),
                // productlis.productdeatilslist
                //         .elementAt(0)["data"]!
                //         .elementAt(0)["size"]!
                //         .isNotEmpty
                //     ? Text(
                //         "Size : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["size"]!.join(",").toString()}",
                //         style: TextStyle(
                //             // letterSpacing: 2,
                //             //color: Colors.white,
                //             overflow: TextOverflow.ellipsis,
                //             color: Colors.grey.shade900,
                //             fontFamily: "Amazon_thin",
                //             fontSize: 17),
                //         maxLines: 6,
                //       )
                //     : SizedBox(),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "Product code : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["product_code"]!.toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["brand_name"] !=null?
                Text(
                  "Brand : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["brand_name"]!.toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ) :SizedBox(),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "Preparation time : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["productPreparation_time"]!.toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "Discount type : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["discount"]!.elementAt(0)["discount_value"].toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "discount value : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["discount"]!.elementAt(0)["discount_value"].toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "tax : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["Tax"]!.elementAt(0)["tax_name"].toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "Tax value : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["Tax"]!.elementAt(0)["tax_value"].toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "delivery : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["deliveryType"]!.toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "product weight : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["product_weight"] ?? "0"}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
    productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["returnType"].isEmpty?

    SizedBox():
                Text(
                  "Return accept : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["returnType"]!.elementAt(0)["type"].toString() == "true" ? "Yes" : "No"}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "note : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["note"] ?? "NA"}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
                SizedBox(
                  height: h / 90,
                ),
                Text(
                  "Description : ${productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["description"]!.toString()}",
                  style: TextStyle(
                      // letterSpacing: 2,
                      //color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey.shade900,
                      fontFamily: "Amazon_thin",
                      fontSize: 17),
                  maxLines: 6,
                ),
             SizedBox(height: h/50,),
              Text("Product variation ",style: A_style_text_head2,),
                SizedBox(height: h/50,),
             ListView.builder(
               physics: NeverScrollableScrollPhysics(),shrinkWrap: true,
               itemCount:   productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["product_variation"].length,
               itemBuilder: (context, indexx) {
                 var dataa=productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["product_variation"][indexx];
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("${ dataa["attribute_name"]} : " ,style: TextStyle(
                     // letterSpacing: 2,
                     //color: Colors.white,
                     overflow: TextOverflow.ellipsis,
                     color: Colors.grey.shade900,
                     fontFamily: "Amazon_thin",
                     fontSize: 17),
             ),

                     Container(width: w/3,
                       child: ListView.builder(
                         shrinkWrap: true,  physics: NeverScrollableScrollPhysics(),
                         itemCount:   productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["product_variation"][indexx]["attribute_values"].length,
                         itemBuilder: (context, indexxx) {
                           var dataaa=  productlis.productdeatilslist.elementAt(0)["data"]!.elementAt(0)["product_variation"][indexx]["attribute_values"][indexxx];

                           return   Text("${ dataaa}");
                       },),
                     )
                   ],
                 ),
               );
             },)

              ],
            )),
      ),
    );
  }
}

showMyDialog(BuildContext context) async {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'Delete General book?',
            style: A_style_medium,
            textAlign: TextAlign.center,
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Get.offAll(() => const HomeScreen());
                  Get.back();
                },
                child: Container(
                  width: w / 5,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                      color: const Color(0xffff0000),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Dismiss the current popup
                  _showAnimatedPopup(context); // Show the next popup
                  // Delay for the popup animation to finish, then navigate to the next screen
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductList(),
                      ),
                    );
                  });
                },
                child: Container(
                  width: w / 5,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xff1455ac),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Ember_Bold",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 80,
          )
        ],
      );
    },
  );
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
                "Delete General book",
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
