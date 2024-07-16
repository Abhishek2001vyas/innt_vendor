import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Api/termapi.dart';
import '../../../../innt_delivery/Controllers/text2.dart';

class PrivacyPolicy extends StatelessWidget {
  PrivacyPolicy({super.key});

  final termmss = Get.put(driverterms());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.privacy_policy,
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
            future: termmss.termm(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Obx(() => termmss.termlist.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Html(
                                data:
                                    "${termmss.termlist[0]["data"][0]["text"].toString()}",
                                style: {
                                  "text-align":
                                      Style(textAlign: TextAlign.justify),
                                  "h1": Style(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.grey)),
                                  ),
                                })
                          ],
                        )
                      : Text("No data"));
            },
          )),
    );
  }
}
