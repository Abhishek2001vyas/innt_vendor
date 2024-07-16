import 'package:demo_innt/innt_vendor/view/screen/menu_screen/reviews/review_ratting.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/reviews/reviews_details.dart';
import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../innt_delivery/base/custom_button.dart';
import '../../../Api/Review_api.dart';
import '../../bottom_navigationbar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController ssss = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  final productlistrevies = Get.put(reviewlist_api());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                currentTab = 4;
              });
              Get.offAll(DashboardScreenVendor());
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title:  Text(
            AppLocalizations.of(context)!.reviews
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: h / 20,
                  width: w / 1.2,
                  child: TextFormField(
                    onChanged: (value) {
                      productlistrevies. searchProducts(value);
                    },
                    controller: ssss,
                    decoration: InputDecoration(

                        contentPadding: const EdgeInsets.all(8),
                        hintText:   AppLocalizations.of(context)!.search,
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.black),
                        fillColor: const Color(0xffeef1f5),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => ReviewsRatting());
                    },
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.black,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(
              height: h / 80,
            ),

        Obx(
              () =>
              ssss.text.isNotEmpty &&  productlistrevies.reviewproductsearchlisttt.isEmpty?
                  Text("No product"):
              productlistrevies.reviewproductsearchlisttt.isNotEmpty
              ? ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: productlistrevies.reviewproductsearchlisttt.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  InkWell(
                    onTap: () {
                      productlistrevies.reviewsDetails_api(
                          productlistrevies.reviewproductsearchlisttt.elementAt(index).productId);
                      // Get.to(() =>  ProductDetails());
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
                            offset:
                            const Offset(0.0, 1.0), //(x,y)
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
                                CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "$image_url${productlistrevies.reviewproductsearchlisttt.elementAt(index).image}",
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
                                    width: w / 1.85,
                                    child: Text(
                                      productlistrevies.reviewproductsearchlisttt.elementAt(index).productName
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Ember",
                                        fontSize: 15,
                                        overflow: TextOverflow
                                            .ellipsis,
                                      ),
                                      maxLines: 2,
                                      softWrap: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: h / 70,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors
                                            .yellow.shade800,
                                      ),
                                      Text(
                                        "${productlistrevies.reviewproductsearchlisttt.elementAt(index).rating}/5",
                                        style: A_style_medium,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: h / 90,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() =>
                                          ReviewsDetails());
                                    },
                                    child: Text(
                                      "${productlistrevies.reviewproductsearchlisttt.elementAt(index).raters} ${AppLocalizations.of(context)!.reviews}",
                                      style: TextStyle(
                                        //letterSpacing: 1.5,
                                        //color: Colors.white,
                                          overflow: TextOverflow
                                              .ellipsis,
                                          fontWeight:
                                          FontWeight.w500,
                                          color: logocolo,
                                          fontFamily:
                                          "Amazon_med",
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                productlistrevies.reviewproductsearchlisttt.elementAt(index).productType.toString(),
                                style: TextStyle(
                                  color: logocolo,
                                  fontSize: 17,
                                  overflow:
                                  TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                              SizedBox(
                                width: w / 6.3,
                              ),
                              Icon(
                                Icons.copy,
                                color: Colors.green,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ) ;
              })
              :
            FutureBuilder(
              future: productlistrevies.reviewproduct(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: Image.asset(
                        "assets/images/spinner.gif",
                        color: logocolo,
                      ))
                    : Obx(() => productlistrevies.reviewproductlisttt.isNotEmpty
                        ? SizedBox(
                            height: Get.height,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: productlistrevies.reviewproductlisttt
                                    .elementAt(0)
                                    .data!
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return
                                    InkWell(
                                    onTap: () {
                                      productlistrevies.reviewsDetails_api(
                                          productlistrevies.reviewproductlisttt
                                              .elementAt(0)
                                              .data!
                                              .elementAt(index)
                                              .productId);
                                      // Get.to(() =>  ProductDetails());
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
                                            offset:
                                                const Offset(0.0, 1.0), //(x,y)
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
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.network(
                                                    "$image_url${productlistrevies.reviewproductlisttt.elementAt(0).data!.elementAt(index).image}",
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
                                                    width: w / 1.85,
                                                    child: Text(
                                                      productlistrevies
                                                          .reviewproductlisttt
                                                          .elementAt(0)
                                                          .data!
                                                          .elementAt(index)
                                                          .productName
                                                          .toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "Ember",
                                                        fontSize: 15,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      maxLines: 2,
                                                      softWrap: true,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: h / 70,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors
                                                            .yellow.shade800,
                                                      ),
                                                      Text(
                                                        "${productlistrevies.reviewproductlisttt.elementAt(0).data!.elementAt(index).rating}/5",
                                                        style: A_style_medium,
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: h / 90,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          ReviewsDetails());
                                                    },
                                                    child: Text(
                                                      "${productlistrevies.reviewproductlisttt.elementAt(0).data!.elementAt(index).raters} ${AppLocalizations.of(context)!.reviews}",
                                                      style: TextStyle(
                                                          //letterSpacing: 1.5,
                                                          //color: Colors.white,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: logocolo,
                                                          fontFamily:
                                                              "Amazon_med",
                                                          fontSize: 16),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                productlistrevies
                                                    .reviewproductlisttt
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
                                                width: w / 6.3,
                                              ),
                                              Icon(
                                                Icons.copy,
                                                color: Colors.green,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Text('No Data'));
              },
            )),
          ],
        ),
      ),
    );
  }


}
