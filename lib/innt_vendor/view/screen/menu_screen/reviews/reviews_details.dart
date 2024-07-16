import 'package:demo_innt/innt_vendor/view/screen/menu_screen/reviews/report_reviews.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/reviews/review_reply.dart';
import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../Api/Review_api.dart';

class ReviewsDetails extends StatefulWidget {
  const ReviewsDetails({super.key});

  @override
  State<ReviewsDetails> createState() => _ReviewsDetailsState();
}

class _ReviewsDetailsState extends State<ReviewsDetails> {
  String selectedItem = 'Move to bag';
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
          "Reviews",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                //Get.to(() =>  ProductDetails());
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          "$image_url${productlistrevies.reviewsDetailslisttt.elementAt(0).data!.elementAt(0).image}",
                          height: h / 6,
                          width: w / 6,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: w / 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: h / 90,
                        ),
                        Text(
                          productlistrevies.reviewsDetailslisttt
                              .elementAt(0)
                              .data!
                              .elementAt(0)
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
                        SizedBox(
                          height: h / 70,
                        ),
                        Row(
                          children: [
                            Text(
                              productlistrevies.reviewsDetailslisttt
                                  .elementAt(0)
                                  .data!
                                  .elementAt(0)
                                  .rating
                                  .toString(),
                              style: TextStyle(
                                  //letterSpacing: 1.5,
                                  //color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  // fontWeight: FontWeight.w500,
                                  color: Colors.yellow.shade800,
                                  fontFamily: "Amazon_med",
                                  fontSize: 50),
                            ),
                            SizedBox(
                              width: w / 10,
                            ),
                            RatingBar.builder(
                              itemSize: 20,
                              initialRating: double.parse(productlistrevies
                                  .reviewsDetailslisttt
                                  .elementAt(0)
                                  .data!
                                  .elementAt(0)
                                  .rating
                                  .toString()),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.yellow.shade800,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 90,
                        ),
                        Text(
                          "Out of 5",
                          style: A_style_medium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h / 90,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productlistrevies.reviewsDetailslisttt
                    .elementAt(0)
                    .data!
                    .elementAt(0)
                    .ratingsDetails!
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300, blurRadius: 3)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: NetworkImage(
                                  "$image_url${productlistrevies.reviewsDetailslisttt.elementAt(0).data!.elementAt(0).ratingsDetails!.elementAt(index).userDetails!.userProfile.toString()}",
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
                                        .elementAt(index)
                                        .userDetails!
                                        .firstName
                                        .toString() +
                                    " " +
                                    productlistrevies.reviewsDetailslisttt
                                        .elementAt(0)
                                        .data!
                                        .elementAt(0)
                                        .ratingsDetails!
                                        .elementAt(index)
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
                              Spacer(),
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
                                        onTap: () {
                                          Get.to(() => ReviewReply(
                                                ratingid: productlistrevies
                                                    .reviewsDetailslisttt
                                                    .elementAt(0)
                                                    .data!
                                                    .elementAt(0)
                                                    .ratingsDetails!
                                                    .elementAt(index)
                                                    .id!
                                                    .toString(),
                                              ));
                                        },
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        value: 'Reply',
                                        child: Row(
                                          children: [
                                            Text("Reply"),
                                            Spacer(),
                                            Image.asset(
                                              "assets/images/return.png",
                                              height: 20,
                                              width: 20,
                                              fit: BoxFit.cover,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      PopupMenuDivider(),
                                      PopupMenuItem<String>(
                                        onTap: () {
                                          Get.to(() => ReportReviews(
                                                indexx: index,
                                                ratingid: productlistrevies
                                                    .reviewsDetailslisttt
                                                    .elementAt(0)
                                                    .data!
                                                    .elementAt(0)
                                                    .ratingsDetails!
                                                    .elementAt(index)
                                                    .id!
                                                    .toString(),
                                              ));
                                        },
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        value: 'Report',
                                        child: Row(
                                          children: [
                                            Text("Report"),
                                            Spacer(),
                                            Icon(
                                              Icons.report_problem,
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
                          SizedBox(
                            height: h / 90,
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: double.parse(productlistrevies
                                .reviewsDetailslisttt
                                .elementAt(0)
                                .data!
                                .elementAt(0)
                                .ratingsDetails!
                                .elementAt(index)
                                .rating!
                                .toString()),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.yellow.shade800,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
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
                                .elementAt(index)
                                .comment!
                                .toString(),
                            style: A_style_order,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  );
                }),
            SizedBox(
              height: h / 90,
            ),
          ],
        ),
      ),
    );
  }
}
