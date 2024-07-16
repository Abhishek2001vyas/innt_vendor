import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import 'chat_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

dynamic message = [0];
List inbox = [
  "Customer",
  "Delivery Man",
];

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 30,
          automaticallyImplyLeading: true,
          title: const Center(child: Text("Chats")),
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: logocolo,
            tabs: [
              Tab(
                child: Text("innt",
                    style: TextStyle(
                        //letterSpacing: 1.5,
                        color: logocolo,
                        fontFamily: "Regular",
                        fontSize: 30)),
              ),
              Tab(
                child: Text("innt live",
                    style: TextStyle(
                        //letterSpacing: 1.5,
                        color: logocolo,
                        fontFamily: "Regular",
                        fontSize: 30)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              //padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ChatScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 2)
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                const BoxShadow(
                                    color: logocolo, blurRadius: 0.5)
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/rashmika.jpg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w / 90,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h / 100,
                              ),
                              SizedBox(
                                width: w / 1.8,
                                child: Text(
                                    "Rashmika Mandana Shop Rashmika Mandana Shop",
                                    maxLines: 1,
                                    style: A_style_medium),
                              ),
                              SizedBox(
                                width: w / 1.8,
                                child: Text(
                                  "Hi Rashmika Hi Rashmika Hi Rashmika Hi Rashmika",
                                  maxLines: 1,
                                  style: TextStyle(
                                      //letterSpacing: 1.5,
                                      //color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey.shade700,
                                      fontFamily: "Amazon_med",
                                      fontSize: 14),
                                ),
                              ),
                            ]),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h / 100,
                            ),
                            const Text(
                              "19:10",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Ember_Light",
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  color: logocolo, shape: BoxShape.circle),
                              child: const Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Ember_Light",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(ChatScreen());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 2)
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                const BoxShadow(
                                    color: logocolo, blurRadius: 0.5)
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/rashmika.jpg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w / 100,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h / 100,
                              ),
                              SizedBox(
                                width: w / 1.8,
                                child: Text(
                                    "Rashmika Mandana Shop Rashmika Mandana Shop",
                                    maxLines: 1,
                                    style: A_style_medium),
                              ),
                              SizedBox(
                                width: w / 1.8,
                                child: Text(
                                  "Hi Rashmika Hi Rashmika Hi Rashmika Hi Rashmika",
                                  maxLines: 1,
                                  style: TextStyle(
                                      //letterSpacing: 1.5,
                                      //color: Colors.white,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey.shade700,
                                      fontFamily: "Amazon_med",
                                      fontSize: 14),
                                ),
                              ),
                            ]),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h / 100,
                            ),
                            const Text(
                              "19:10",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Ember_Light",
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                  color: logocolo, shape: BoxShape.circle),
                              child: const Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Ember_Light",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
