import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../innt_delivery/Controllers/constant.dart';
import '../../../innt_delivery/Controllers/text2.dart';
import 'chat_screenvender.dart';
import '../../../ulits/constant.dart';
import '../Api/meassage_api.dart';
import '../screen/chat_screen.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

dynamic message = [0];


final chat_api = Get.put(meassage_api());

class _ChatListState extends State<ChatList> {
  Stream<dynamic> getChatListStream() {
    return Stream.periodic(Duration(milliseconds: 1)).asyncMap((i) => chat_api.chatlist()).asBroadcastStream();
  }

  Stream<dynamic> getChatListStream1() {
    return Stream.periodic(Duration(milliseconds: 1)).asyncMap((i) => chat_api.chatlist1()).asBroadcastStream();
  }
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
          title: Center(
              child: Text(
                  AppLocalizations.of(context)!.chats
              )),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: logocolo,
            tabs: [
              Tab(
                child: Text(
                  AppLocalizations.of(context)!.customers,
                  style: A_style_medium_White,
                ),
              ),
              Tab(
                child: Text(
                  AppLocalizations.of(context)!.deliverymen,
                  style: A_style_medium_White,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
              stream: getChatListStream(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(color: logocolo),
                )
                    : Obx(() => chat_api.chatlistlist.isEmpty
                    ? Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(child: Text("No Messages")),
                )
                    : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 12.0, left: 12, top: 12),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: chat_api.chatlistlist
                            .elementAt(0)
                            .filteredMessages!
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                            const EdgeInsets.only(bottom: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ChatScreen(
                                  status: 0,
                                  userimage: chat_api.chatlistlist
                                      .elementAt(0)
                                      .filteredMessages!
                                      .elementAt(index)
                                      .image
                                      .toString(),
                                  userid: chat_api.chatlistlist
                                      .elementAt(0)
                                      .filteredMessages!
                                      .elementAt(index)
                                      .userId
                                      .toString(),
                                  username:
                                  "${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).fname.toString()} ${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).lname.toString()}",
                                ));
                              },
                              child: Material(
                                color: Colors.white,
                                elevation: 1,
                                borderRadius:
                                BorderRadius.circular(10),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: logocolo,radius: 25,
                                        backgroundImage:NetworkImage(
                                          "${image_url}${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).image.toString()}",

                                        ) ,
                                      ),


                                      /*  Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: logocolo,
                                                            blurRadius: 0.5)
                                                      ]),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: chat_api.chatlistlist
                                                                .elementAt(0)
                                                        .filteredMessages!
                                                                .elementAt(
                                                                    index)
                                                                .image !=
                                                            null ||  chat_api.chatlistlist
                                                        .elementAt(0)
                                                        .filteredMessages!
                                                        .elementAt(
                                                        index)
                                                        .image != " "
                                                        ? Image.network(
                                                            "${image_url}${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).image.toString()}",
                                                            height: 50,
                                                            width: 50,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : Text("No image"),
                                                  ),
                                                ),*/
                                      SizedBox(
                                        width: w / 50,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            // SizedBox(
                                            //   height: h / 100,
                                            // ),
                                            SizedBox(
                                              width: w / 1.8,
                                              child: Text(
                                                  "${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).fname.toString()} ${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).lname.toString()}",
                                                  maxLines: 1,
                                                  style:
                                                  A_style_medium),
                                            ),
                                            SizedBox(
                                              width: w / 1.8,
                                              child: Text(
                                                "${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).text!.toString()}",
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
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //   height: h / 100,
                                          // ),
                                          Text(
                                            "${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).createdAt!.toString().substring(11,16)}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Ember_Light",
                                            ),
                                          ),
                                          chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).msgCount!.toString()=='0'?
                                          SizedBox():
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                                color: logocolo,
                                                shape: BoxShape.circle),
                                            child:  Text(
                                              "${chat_api.chatlistlist.elementAt(0).filteredMessages!.elementAt(index).msgCount!.toString()}",
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
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ));
              },
            ),
            StreamBuilder(
              stream: getChatListStream1(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(color: logocolo),
                )
                    : Obx(() => chat_api.chatlistlisttt.isEmpty
                    ? Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(child: Text("No Messages")),
                )
                    : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 12.0, left: 12, top: 12),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: chat_api.chatlistlisttt
                            .elementAt(0)
                        ["filteredMessages"]!
                            .length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                            const EdgeInsets.only(bottom: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ChatScreen(
                                  status: 4,
                                  userimage: chat_api.chatlistlisttt
                                      .elementAt(0)
                                  ["filteredMessages"]
                                      .elementAt(index)
                                  ["image"]
                                      .toString(),
                                  userid: chat_api.chatlistlisttt
                                      .elementAt(0)
                                  ["filteredMessages"]
                                      .elementAt(index)
                                  ["driverId"]
                                      .toString(),
                                  username:
                                  "${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["fname"].toString()} ${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["lname"].toString()}",
                                ));
                              },
                              child: Material(
                                color: Colors.white,
                                elevation: 1,
                                borderRadius:
                                BorderRadius.circular(10),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(
                                                50),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: logocolo,
                                                  blurRadius: 0.5)
                                            ]),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(
                                              50),
                                          child: chat_api.chatlistlisttt
                                              .elementAt(0)
                                          ["filteredMessages"]
                                              .elementAt(
                                              index)
                                          ["image"] !=
                                              null
                                              ? Image.network(
                                            "${image_url}${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["image"].toString()}",
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          )
                                              : Text("No image"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: w / 50,
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            // SizedBox(
                                            //   height: h / 100,
                                            // ),
                                            SizedBox(
                                              width: w / 1.8,
                                              child: Text(
                                                  "${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["fname"].toString()} ${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["lname"].toString()}",
                                                  maxLines: 1,
                                                  style:
                                                  A_style_medium),
                                            ),
                                            SizedBox(
                                              width: w / 1.8,
                                              child: Text(
                                                "${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["text"]!.toString()}",
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
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // SizedBox(
                                          //   height: h / 100,
                                          // ),
                                          Text(
                                            "${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["createdAt"]!.toString().substring(11,16)}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Ember_Light",
                                            ),
                                          ),
                                          chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["msgCount"]!.toString()=='0'?
                                          SizedBox():
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: const BoxDecoration(
                                                color: logocolo,
                                                shape: BoxShape.circle),
                                            child:  Text(
                                              "${chat_api.chatlistlisttt.elementAt(0) ["filteredMessages"].elementAt(index)["msgCount"]!.toString()}",
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
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ));
              },
            ),


          ],
        ),
      ),
    );
  }
}
