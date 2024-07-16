import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../Api/notification.dart';
import '../../Controllers/text2.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final notificationdriver=Get.put(drivernotifications());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
         title: Text(
           "Notification",
           style: TextStyle(
               color: Colors.white, fontSize: 20, fontFamily: "Ember"),
         ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(future: notificationdriver.driverrnotification(), builder: (context, snapshot) {
              return
                  snapshot.connectionState==ConnectionState.waiting?
                      Center(child: CircularProgressIndicator(),)
                      :
                  notificationdriver.drivenotification.isEmpty?
                      Center(child: Text("No Notification")):
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: notificationdriver.drivenotification[0]["data"].length,
                    itemBuilder: (BuildContext context, int index) {
                     var dataa =notificationdriver.drivenotification[0]["data"][index];
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300, blurRadius: 3)
                                ],
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width: w/50,height: h/15,
                                        child:
                      dataa["image"]==null?
                          Text("No image"):
                                        Image.network(
                                          "$image_url${dataa["image"].toString()}",
                                          scale: 3,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 20,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(dataa["title"],
                                                    maxLines: 1,style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: "Ember")),
                                              ),

                                               Text(
                                                "${dataa["createdAt"].toString().substring(0,10)} ${dataa["createdAt"].toString().substring(11,16)}",
                                                style: TextStyle(
                                                    fontFamily: "Amazon_med",
                                                    fontSize: 10,
                                                    overflow: TextOverflow.ellipsis),
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h / 90,
                                          ),
                                          Text(dataa["text"],maxLines: 2,
                                              style: A_style_mid_black),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: h / 60,
                          )
                        ],
                      );
                    },
                  );
            },)

          ],
        ),
      ),
    );
  }
}
