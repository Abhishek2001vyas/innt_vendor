import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../innt_delivery/base/custom_button.dart';
import '../../../../../ulits/constant.dart';
import '../../../Api/Review_api.dart';

class ReportReviews extends StatefulWidget {
  final ratingid;
  final indexx;

  const ReportReviews(
      {super.key, required this.ratingid, required this.indexx});

  @override
  State<ReportReviews> createState() => _ReportReviewsState();
}

class _ReportReviewsState extends State<ReportReviews> {
  final Reporttext = TextEditingController();

  final productlistrevies = Get.put(reviewlist_api());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Report review",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 3)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          "$image_url${productlistrevies.reviewsDetailslisttt.elementAt(0).data!.elementAt(0).ratingsDetails!.elementAt(widget.indexx).userDetails!.userProfile.toString()}",
                        ),
                      ),
                      SizedBox(
                        width: w / 80,
                      ),
                      Text(
                        productlistrevies.reviewsDetailslisttt
                                .elementAt(0)
                                .data!
                                .elementAt(0)
                                .ratingsDetails!
                                .elementAt(widget.indexx)
                                .userDetails!
                                .firstName
                                .toString() +
                            " " +
                            productlistrevies.reviewsDetailslisttt
                                .elementAt(0)
                                .data!
                                .elementAt(0)
                                .ratingsDetails!
                                .elementAt(widget.indexx)
                                .userDetails!
                                .lastName
                                .toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Ember",
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 90,
                  ),
                  RatingBarIndicator(
                    itemSize: 20,
                    rating: double.parse(productlistrevies.reviewsDetailslisttt
                        .elementAt(0)
                        .data!
                        .elementAt(0)
                        .ratingsDetails!
                        .elementAt(widget.indexx)
                        .rating!
                        .toString()),
                    //initialRating:double.parse(productlistrevies.reviewsDetailslisttt.elementAt(0).data!.elementAt(0).ratingsDetails!.elementAt(widget.indexx).rating!.toString()),
                    // minRating: 1,
                    direction: Axis.horizontal,
                    // allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.yellow.shade800,
                    ),
                    // onRatingUpdate: (rating) {
                    //   print(rating);
                    // },
                  ),
                  SizedBox(
                    height: h / 90,
                  ),
                  Text(
                    productlistrevies.reviewsDetailslisttt
                        .elementAt(0)
                        .data!
                        .elementAt(0)
                        .ratingsDetails!
                        .elementAt(widget.indexx)
                        .comment!
                        .toString(),
                    style: A_style_order,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            SizedBox(
              height: h / 20,
            ),
            Row(
              children: [
                Text("Please tell us why you’re reporting",
                    style: A_style_medium),
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
              height: h / 80,
            ),
            TextFormField(
              controller: Reporttext,
              validator: (value) {
                if (value!.isEmpty) {
                  return "please tell us";
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
                  hintText: "Tell us here…",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)),
            ),
            SizedBox(
              height: h / 10,
            ),
            CustomButton(
                title: 'Send report',
                onTap: () {
                  productlistrevies.reviewsreport_api(
                      widget.ratingid, Reporttext.text.toString());
                  // Get.to(() => ReviewsDetails());
                })
          ],
        ),
      ),
    );
  }
}
