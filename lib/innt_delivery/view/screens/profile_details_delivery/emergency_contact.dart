import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Api/termapi.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/text2.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({super.key});

  @override
  State<EmergencyContact> createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  final termmss = Get.put(driverterms());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: logocolo,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.emergency_contact,
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: termmss.contactus(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Obx(() => termmss.contactlist.isNotEmpty
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: termmss.contactlist[0]["data"].length,
                            itemBuilder: (context, index) {
                              var dataa = termmss.contactlist[0]["data"][index];
                              return Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 2)
                                    ],
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${dataa["client_name"]}",
                                      style: TextStyle(
                                        fontFamily: "Ember_Bold",
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: h / 80,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: logocolo,
                                        ),
                                        Text("${dataa["phone_no"]}",
                                            style: A_style_medium),
                                        Spacer(),
                                        // Container(
                                        //   padding: EdgeInsets.all(6),
                                        //   decoration: BoxDecoration(
                                        //       color: const Color(0xffedf2f8),
                                        //       borderRadius:
                                        //           BorderRadius.circular(16),
                                        //       border: Border.all(
                                        //           color: logocolo, width: 1)),
                                        //   child: Text(
                                        //     "View Details",
                                        //     style: A_style_mid_black,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: logocolo,
                                        ),
                                        Text("${dataa["whatsapp_number"]}",
                                            style: A_style_medium),
                                        Spacer(),
                                        // Container(
                                        //   padding: EdgeInsets.all(6),
                                        //   decoration: BoxDecoration(
                                        //       color: const Color(0xffedf2f8),
                                        //       borderRadius:
                                        //       BorderRadius.circular(16),
                                        //       border: Border.all(
                                        //           color: logocolo, width: 1)),
                                        //   child: Text(
                                        //     "View Details",
                                        //     style: A_style_mid_black,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                         Icons.mail,
                                          color: logocolo,
                                        ),
                                        Text("${dataa["email"]}",
                                            style: A_style_medium),
                                        Spacer(),
                                        // Container(
                                        //   padding: EdgeInsets.all(6),
                                        //   decoration: BoxDecoration(
                                        //       color: const Color(0xffedf2f8),
                                        //       borderRadius:
                                        //       BorderRadius.circular(16),
                                        //       border: Border.all(
                                        //           color: logocolo, width: 1)),
                                        //   child: Text(
                                        //     "View Details",
                                        //     style: A_style_mid_black,
                                        //   ),
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : Text("No data"));
              },
            )
          ],
        ),
      ),
    );
  }
}
