import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../../../Api/termapi.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/text2.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  final termmss=Get.put(driverterms());
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
            AppLocalizations.of(context)!.help_support,
            style: TextStyle(color: Colors.white),
          )),
      // appBar: AppBar(
      //     forceMaterialTransparency: true,
      //     automaticallyImplyLeading: true,
      //     foregroundColor: logocolo,
      //     centerTitle: true,
      //     title: Text(
      //       AppLocalizations.of(context)!.help_support,
      //       style: Text_Bold,
      //     )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child:

        Column(
          children: [
            FutureBuilder(
              future: termmss.needhlep(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Obx(() => termmss.needhleplist.isNotEmpty
                    ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: termmss.needhleplist[0]["data"].length,
                  itemBuilder: (context, index) {
                    var dataa = termmss.needhleplist[0]["data"][index];
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
                            "${dataa["contact_name"]}",
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
                              Text("${dataa["phone"]}",
                                  style: A_style_medium),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: const Color(0xffedf2f8),
                                    borderRadius:
                                        BorderRadius.circular(16),
                                    border: Border.all(
                                        color: logocolo, width: 1)),
                                child: Text(
                                  "View Details",
                                  style: A_style_mid_black,
                                ),
                              ),
                            ],
                          ),
                         
                        ],
                      ),
                    );
                  },
                )
                    : Text("No data"));
              },
            ),
          ],
        )
      ),
    );
  }
}
