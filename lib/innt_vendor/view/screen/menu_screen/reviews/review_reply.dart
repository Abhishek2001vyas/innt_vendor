import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../ulits/constant.dart';
import '../../../Api/Review_api.dart';

class ReviewReply extends StatefulWidget {
  final ratingid;

  const ReviewReply({super.key, required this.ratingid});

  @override
  State<ReviewReply> createState() => _ReviewReplyState();
}

class _ReviewReplyState extends State<ReviewReply> {
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: FutureBuilder(
              future:
                  productlistrevies.singleReview_detail_api(widget.ratingid),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 3)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: NetworkImage(
                                        "$image_url${productlistrevies.singleReview_detail.elementAt(0)["userImage"].toString()}",
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 80,
                                    ),
                                    Text(
                                      productlistrevies.singleReview_detail
                                              .elementAt(0)["userFirst_name"]
                                              .toString() +
                                          productlistrevies.singleReview_detail
                                              .elementAt(0)["userLast_name"]
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
                                  rating: double.parse(productlistrevies
                                      .singleReview_detail
                                      .elementAt(0)["rating"]
                                      .toString()),
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade800,
                                  ),
                                ),
                                SizedBox(
                                  height: h / 90,
                                ),
                                Text(
                                  productlistrevies.singleReview_detail
                                      .elementAt(0)["comment"]
                                      .toString(),
                                  style: A_style_order,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h / 90,
                          ),
                          Obx(() =>
                              productlistrevies.singleReview_detail.isNotEmpty
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: productlistrevies
                                          .singleReview_detail
                                          .elementAt(0)["ratingsDetails"]
                                          .length,
                                      itemBuilder: (context, index) {
                                        return BubbleSpecialThree(
                                          isSender: true,
                                          text: productlistrevies
                                              .singleReview_detail
                                              .elementAt(0)["ratingsDetails"]
                                                  [index]["message"]
                                              .toString(),
                                          color: logocolo,
                                          tail: true,
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        );
                                      },
                                    )
                                  : Text("")),
                        ],
                      );
              },
            ),
          ),
          MessageBar(
            //onSend: (){},
            onSend: (p0) {
              productlistrevies.reviewReplay_api(
                  widget.ratingid, p0.toString());
              print("hhh$p0");
            },
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic,
                        color: Colors.black,
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
        constraints: const BoxConstraints(
          minHeight: 20.0,
          minWidth: 20.0,
        ),
        child: Image.asset("assets/images/man.png"));
  }

  void _changeSeek(double value) {
    setState(() {});
  }

  void _playAudio() async {
    'https://file-examples-com.github.io/uploads/2017/11/file_example_MP3_700KB.mp3';
    if (isPause) {
      setState(() {
        isPlaying = true;
        isPause = false;
      });
    } else if (isPlaying) {
      setState(() {
        isPlaying = false;
        isPause = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });

      setState(() {
        isPlaying = true;
      });
    }
  }
}
