import 'package:demo_innt/innt_delivery/Api/chatapidelivery.dart';
import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';
import 'chat_screendelivery.dart';



class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final chatapii = Get.put(chat_apii());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: logocolo,
        automaticallyImplyLeading: true,centerTitle: true,
        title: Text(  AppLocalizations.of(context)!.chats,
            style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                fontFamily: "Ember")),
      ),
      body: StreamBuilder(
        stream: chatapii.chatlist(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(color: logocolo),
                )
              : snapshot.hasError
                  ? Center(
                      child: Text("No data"),
                    )
                  : Obx(() => chatapii.chatlistlist.isNotEmpty
                      ? ListView.builder(
                          //padding: EdgeInsets.all(8),
                          shrinkWrap: true,
                          itemCount: chatapii
                              .chatlistlist[0]["filteredMessages"].length,
                          itemBuilder: (context, index) {
                            var dataa = chatapii.chatlistlist[0]
                                ["filteredMessages"][index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(ChatScreendelivery(
                                  userid: dataa['ID'],
                                  userimage: dataa["image"],
                                  username:
                                      "${dataa["fname"]} ${dataa["lname"]}",
                                ));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 8),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 2)
                                      ]),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: logocolo,
                                                  blurRadius: 0.5)
                                            ]),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            "$image_url${dataa["image"]}",
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: h / 100,
                                            ),
                                            SizedBox(
                                              width: w / 1.8,
                                              child: Text(
                                                  "${dataa["fname"]}  ${dataa["lname"]}",
                                                  maxLines: 1,
                                                  style: A_style_medium),
                                            ),
                                            SizedBox(
                                              width: w / 1.8,
                                              child: Text(
                                                "${dataa["text"]}",
                                                maxLines: 1,
                                                style: TextStyle(
                                                    //letterSpacing: 1.5,
                                                    //color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.grey.shade700,
                                                    fontFamily: "Amazon_med",
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ]),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: h / 100,
                                          ),
                                          Text(
                                            " ${dataa["createdAt"].toString().substring(11, 16)}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "Ember_Light",
                                            ),
                                          ),
                                          dataa["msgCount"].toString() == "0"
                                              ? SizedBox()
                                              : Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: logocolo,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: Text(
                                                    "${dataa["msgCount"]}",
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                            );
                          },
                        )
                      : Text("No histroy"));
        },
      ),
    );
  }
}
