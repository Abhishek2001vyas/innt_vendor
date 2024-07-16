import 'package:demo_innt/innt_vendor/view/screen/menu_screen/inventory.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/product.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/productupdate.dart';
import 'package:demo_innt/innt_vendor/view/screen/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../ulits/constant.dart';
import '../../Api/maincategory.dart';
import '../../Api/productlist_api.dart';
import '../../api_constant/get_vendorprofile_api.dart';
import '../../bottomcontroller.dart';
import 'Inntout _ADD_PRODUCT/addPRODUCT_innt_out.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String selectedItem = 'Move to bag';
  String dropdownvalue = "All categories";
  final productlis = Get.put(productlist_api());
  final co = Get.put(bottomcontroller());


  final TextEditingController hjg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.product_list,
        ),
        actions: [
          IconButton(
            onPressed: () {
// co.c();
// print(co.currentTab.value);

              vendorProfileList[0]["serviceType"].toString() == maincate[0].toString()
                  ? Get.to(AddProduct())
                  : Get.to(AddProductinnout());
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h / 20,
              width: w,
              child: TextFormField(
                controller: hjg,
                onChanged: (value) async {
                  print("searchd $value");
                  await productlis.searchProducts(value);
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    hintText:   AppLocalizations.of(context)!.search_product_list,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(7))),
              ),
            ),
            SizedBox(
              height: h / 100,
            ),
            Obx(
              () => productlis.productsearchlisttt.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: productlis.productsearchlisttt.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            print(
                                "iojhoijhoijh${productlis.productlisttt.elementAt(0).data!.elementAt(index).productId}");
                            await productlis.productdeatils(productlis
                                .productlisttt
                                .elementAt(0)
                                .data!
                                .elementAt(index)
                                .productId);
                            //Get.to(() => const ProductDetails());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(4),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          image_url.toString() +
                                              productlis.productsearchlisttt
                                                  .elementAt(index)
                                                  .image
                                                  .toString(),
                                          // productlis.productlisttt
                                          //     .elementAt(0)
                                          //     .data!
                                          //     .elementAt(index)
                                          //     .image
                                          //     .toString(),
                                          height: 90,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: w / 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: h / 90,
                                        ),
                                        SizedBox(
                                          width: w / 1.8,
                                          child: Text(
                                            productlis.productsearchlisttt
                                                .elementAt(index)
                                                .productName
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Ember",
                                              fontSize: 17,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h / 30,
                                        ),
                                        Row(
                                          children: [
                                            Obx(
                                              () => productlis
                                                          .productsearchlisttt
                                                          .elementAt(index)
                                                          .status ==
                                                      1
                                                  ? Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6),
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
                                                          const EdgeInsets.all(
                                                              6),
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
                                            productlis.productsearchlisttt
                                                        .elementAt(index)
                                                        .status ==
                                                    1
                                                ? GestureDetector(
                                                    onTap: () {
                                                      Get.to(
                                                          () => ScanScreen());
                                                    },
                                                    child: QrImageView(
                                                      data: productlis
                                                          .productsearchlisttt
                                                          .elementAt(index)
                                                          .productCode
                                                          .toString(),
                                                      version: QrVersions.auto,
                                                      size: 60.0,
                                                    ),
                                                  )
                                                : SizedBox()
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      productlis.productsearchlisttt
                                          .elementAt(index)
                                          .productType
                                          .toString(),
                                      style: TextStyle(
                                        color: logocolo,
                                        fontSize: 17,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      width: w / 80,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${  AppLocalizations.of(context)!.selling_price}:",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: "Ember_Light",
                                          ),
                                        ),
                                        Text(
                                          " \$${productlis.productsearchlisttt.elementAt(index).salePrice.toString()}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: "Ember_Bold",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: w / 20,
                                    ),
                                    Container(
                                      child: PopupMenuButton(
                                        color: Colors.white,
                                        surfaceTintColor: Colors.white,
                                        initialValue: selectedItem,
                                        icon: Icon(
                                          Icons.more_horiz,
                                          color: Colors.black,
                                        ),
                                        itemBuilder: (_) {
                                          return <PopupMenuEntry<String>>[
                                            PopupMenuItem<String>(
                                              onTap: () async {
                                                await productlis.productdeatils(
                                                    productlis
                                                        .productsearchlisttt
                                                        .elementAt(index)
                                                        .productId);
                                                setState(() {
                                                  productlis
                                                          .valueChooseDiscountType =
                                                      "${productlis.productdeatilslist!.elementAt(0).data!.elementAt(0).discount!.elementAt(0).discountType.toString()}";
                                                  productlis.priceController
                                                          .text =
                                                      "${productlis.productdeatilslist!.elementAt(0).data!.elementAt(0).unitPrice!.toString()}";
                                                  productlis.discountcontroller
                                                          .text =
                                                      "${productlis.productdeatilslist!.elementAt(0).data!.elementAt(0).discount!.elementAt(0).discountValue.toString()}";
                                                });

                                                await Get.to(
                                                    () => Productupdate(
                                                          productid: productlis
                                                              .productsearchlisttt
                                                              .elementAt(index)
                                                              .productId
                                                              .toString(),
                                                        ));
                                              },
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              value: 'Edit',
                                              child: Row(
                                                children:  [
                                                  Text(  AppLocalizations.of(context)!.edit),
                                                  Spacer(),
                                                  Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuDivider(),
                                            PopupMenuItem<String>(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              value: 'Share',
                                              child: Row(
                                                children: [
                                                  Text(  AppLocalizations.of(context)!.share),
                                                  Spacer(),
                                                  Image.asset(
                                                    "assets/images/share.png",
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit.cover,
                                                    color: Colors.black,
                                                  )
                                                ],
                                              ),
                                            ),
                                            PopupMenuDivider(),
                                            PopupMenuItem<String>(
                                              onTap: () {
                                                showMyDialog(
                                                    "${productlis.productsearchlisttt.elementAt(index).productName.toString()}",
                                                    productlis
                                                        .productsearchlisttt
                                                        .elementAt(index)
                                                        .productId
                                                        .toString(),
                                                    productlis);
                                                //
                                                //  showMyDialog(context);
                                              },
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              value: 'Delete',
                                              child: Row(
                                                children:  [
                                                  Text(  AppLocalizations.of(context)!.delete),
                                                  Spacer(),
                                                  Icon(
                                                    Icons.delete,
                                                    size: 20,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ];
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : FutureBuilder(
                      future: productlis.productlistt(),
                      builder: (context, snapshot) {
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? Center(
                                child: Image.asset(
                                "assets/images/spinner.gif",
                                color: logocolo,
                              ))
                            : Obx(() => productlis.productlisttt.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    itemCount: productlis.productlisttt
                                        .elementAt(0)
                                        .data!
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () async {
                                          print(
                                              "iojhoijhoijh${productlis.productlisttt.elementAt(0).data!.elementAt(index).productId}");
                                          await productlis.productdeatils(
                                              productlis.productlisttt
                                                  .elementAt(0)
                                                  .data!
                                                  .elementAt(index)
                                                  .productId);
                                          //Get.to(() => const ProductDetails());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          margin: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                offset: const Offset(
                                                    0.0, 1.0), //(x,y)
                                                blurRadius: 4.0,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.network(
                                                        image_url.toString() +
                                                            productlis
                                                                .productlisttt
                                                                .elementAt(0)
                                                                .data!
                                                                .elementAt(
                                                                    index)
                                                                .image
                                                                .toString(),
                                                        height: 90,
                                                        width: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: w / 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: h / 90,
                                                      ),
                                                      SizedBox(
                                                        width: w / 1.8,
                                                        child: Text(
                                                          productlis
                                                              .productlisttt
                                                              .elementAt(0)
                                                              .data!
                                                              .elementAt(index)
                                                              .productName
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily: "Ember",
                                                            fontSize: 17,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: h / 30,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Obx(
                                                            () => productlis
                                                                        .productlisttt
                                                                        .elementAt(
                                                                            0)
                                                                        .data!
                                                                        .elementAt(
                                                                            index)
                                                                        .status ==
                                                                    1
                                                                ? Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            6),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.circular(6)),
                                                                    child:
                                                                         Text(
                                                                           AppLocalizations.of(context)!.approved,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17,
                                                                          fontFamily:
                                                                              "Ember_Bold"),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            6),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey,
                                                                        borderRadius:
                                                                            BorderRadius.circular(6)),
                                                                    child:
                                                                         Text(
                                                                          AppLocalizations.of(context)!.pending,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              17,
                                                                          fontFamily:
                                                                              "Ember_Bold"),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                          ),
                                                          SizedBox(
                                                            width: w / 14,
                                                          ),
                                                          productlis.productlisttt
                                                                      .elementAt(
                                                                          0)
                                                                      .data!
                                                                      .elementAt(
                                                                          index)
                                                                      .status ==
                                                                  1
                                                              ? GestureDetector(
                                                                  onTap: () {
                                                                    Get.to(() =>
                                                                        ScanScreen());
                                                                  },
                                                                  child:
                                                                      QrImageView(
                                                                    data: productlis
                                                                        .productlisttt
                                                                        .elementAt(
                                                                            0)
                                                                        .data!
                                                                        .elementAt(
                                                                            index)
                                                                        .productCode
                                                                        .toString(),
                                                                    version:
                                                                        QrVersions
                                                                            .auto,
                                                                    size: 60.0,
                                                                  ),
                                                                )
                                                              : SizedBox()
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    productlis.productlisttt
                                                        .elementAt(0)
                                                        .data!
                                                        .elementAt(index)
                                                        .productType
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: logocolo,
                                                      fontSize: 17,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 2,
                                                  ),
                                                  SizedBox(
                                                    width: w / 80,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${  AppLocalizations.of(context)!.selling_price}:",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily:
                                                              "Ember_Light",
                                                        ),
                                                      ),
                                                      Text(
                                                        " \$${productlis.productlisttt.elementAt(0).data!.elementAt(index).salePrice.toString()}",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontFamily:
                                                              "Ember_Bold",
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: w / 20,
                                                  ),
                                                  Container(
                                                    child: PopupMenuButton(
                                                      color: Colors.white,
                                                      surfaceTintColor:
                                                          Colors.white,
                                                      initialValue:
                                                          selectedItem,
                                                      icon: Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.black,
                                                      ),
                                                      itemBuilder: (_) {
                                                        return <PopupMenuEntry<
                                                            String>>[
                                                          PopupMenuItem<String>(
                                                            onTap: () async {
                                                              await productlis
                                                                  .productdeatils(productlis
                                                                      .productlisttt
                                                                      .elementAt(
                                                                          0)
                                                                      .data!
                                                                      .elementAt(
                                                                          index)
                                                                      .productId);
                                                              setState(() {
                                                                productlis
                                                                        .valueChooseDiscountType =
                                                                    "${productlis.productdeatilslist!.elementAt(0).data!.elementAt(0).discount!.elementAt(0).discountType.toString()}";
                                                                productlis
                                                                        .priceController
                                                                        .text =
                                                                    "${productlis.productdeatilslist!.elementAt(0).data!.elementAt(0).unitPrice!.toString()}";
                                                                productlis
                                                                        .discountcontroller
                                                                        .text =
                                                                    "${productlis.productdeatilslist!.elementAt(0).data!.elementAt(0).discount!.elementAt(0).discountValue.toString()}";
                                                              });

                                                              await Get.to(() =>
                                                                  Productupdate(
                                                                    productid: productlis
                                                                        .productlisttt
                                                                        .elementAt(
                                                                            0)
                                                                        .data!
                                                                        .elementAt(
                                                                            index)
                                                                        .productId
                                                                        .toString(),
                                                                  ));
                                                            },
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.04,
                                                            value: 'Edit',
                                                            child: Row(
                                                              children:  [
                                                                Text(  AppLocalizations.of(context)!.edit),
                                                                Spacer(),
                                                                Icon(
                                                                  Icons.edit,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          PopupMenuDivider(),
                                                          PopupMenuItem<String>(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.04,
                                                            value: 'Share',
                                                            child: Row(
                                                              children: [
                                                                Text(  AppLocalizations.of(context)!.share),
                                                                Spacer(),
                                                                Image.asset(
                                                                  "assets/images/share.png",
                                                                  height: 20,
                                                                  width: 20,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  color: Colors
                                                                      .black,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          PopupMenuDivider(),
                                                          PopupMenuItem<String>(
                                                            onTap: () {
                                                              showMyDialog(
                                                                  "${productlis.productlisttt.elementAt(0).data!.elementAt(index).productName.toString()}",
                                                                  productlis
                                                                      .productlisttt
                                                                      .elementAt(
                                                                          0)
                                                                      .data!
                                                                      .elementAt(
                                                                          index)
                                                                      .productId
                                                                      .toString(),
                                                                  productlis);
                                                              //
                                                              //  showMyDialog(context);
                                                            },
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.04,
                                                            value: 'Delete',
                                                            child: Row(
                                                              children:  [
                                                                Text(  AppLocalizations.of(context)!.delete),
                                                                Spacer(),
                                                                Icon(
                                                                  Icons.delete,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ];
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                : Text("No product"));
                      },
                    ),
            ),
            SizedBox(
              height: h / 70,
            ),
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    /*  floatingActionButton: FloatingActionButton.extended(
        autofocus: true,
        isExtended: true,
        backgroundColor: logocolo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Get.to(() => const Inventory());
          print('Floating Action Button Pressed');
        },
        icon: Image.asset("assets/images/inventory.png"),
        label: const Text(
          "Limited Stock",
          style: TextStyle(
              //letterSpacing: 1.5,
              //color: Colors.white,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: "Amazon_med",
              fontSize: 16),
        ),
      ),*/

    );
  }

  showMyDialog(prodname, id, productlis1) async {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    print("fff$prodname");
    return showDialog(
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
              'Delete $prodname?',
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
                    //    Get.to(() => const ProductList());
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await productlis.productdelete(id, context, prodname);
                    Navigator.pop(context);

                    // productlis._showAnimatedPopup(context);
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
                        textAlign: TextAlign.center,
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
}


