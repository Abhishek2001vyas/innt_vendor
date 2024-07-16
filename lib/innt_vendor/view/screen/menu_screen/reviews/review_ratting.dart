import 'package:demo_innt/innt_delivery/base/custom_button.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/reviews/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../Api/Review_api.dart';

class ReviewsRatting extends StatefulWidget {
  const ReviewsRatting({super.key});

  @override
  State<ReviewsRatting> createState() => _ReviewsRattingState();
}

class _ReviewsRattingState extends State<ReviewsRatting> {
var isChecked ;

final productlistrevies = Get.put(reviewlist_api());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.reviews,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select rating filter",
              style: A_style_medium,
            ),
            SizedBox(
              height: h / 90,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked==5 ?true:false,
                  activeColor: const Color(0xff1455ac),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = 5;
                    });
                  },
                ),
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,ignoreGestures: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),

              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked==4 ?true:false,
                  activeColor: const Color(0xff1455ac),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = 4;
                    });
                  },
                ),
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),

              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked==3 ?true:false,
                  activeColor: const Color(0xff1455ac),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = 3;
                    });
                  },
                ),
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),

              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked==2 ?true:false,
                  activeColor: const Color(0xff1455ac),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = 2;
                    });
                  },
                ),
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),

              ],
            ),
            Row(
              children: [
                Checkbox(
                  value:isChecked==1 ?true:false,
                  activeColor: const Color(0xff1455ac),
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = 1;
                    });
                  },
                ),
                RatingBar.builder(
                  itemSize: 30,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.black,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),

              ],
            ),
            SizedBox(
              height: h / 5,
            ),
            CustomButton(
                title:   "Reset filter",
                onTap: () {
                  productlistrevies.reviewproductsearchlisttt.clear();

                }),
            SizedBox(
              height: h / 50
            ),
            CustomButton(
                title:   AppLocalizations.of(context)!.apply_filter,
                onTap: () {
                  productlistrevies.filterByRating(isChecked);

                })
          ],
        ),
      ),
    );
  }
}
