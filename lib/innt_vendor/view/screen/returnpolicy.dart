import 'package:demo_innt/innt_delivery/Controllers/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Api/policy.dart';

class Returnpoilcy extends StatefulWidget {
  const Returnpoilcy({super.key});

  @override
  State<Returnpoilcy> createState() => _ReturnpoilcyState();
}

class _ReturnpoilcyState extends State<Returnpoilcy> {
  final returnss = Get.put(Policy());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(  AppLocalizations.of(context)!.return_policy),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: returnss.returnspolicy(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(
                          color: logocolo,
                        ),
                      )
                    : snapshot.hasError
                        ? Text(snapshot.error.toString())
                        : Html(
                            data:
                                "${returnss.returnpoilcy[0]["data"][0]["text"].toString()}",
                            style: {
                                "text-align":
                                    Style(textAlign: TextAlign.justify),
                                "h1": Style(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey)),
                                ),
                              });
              },
            ),
          ],
        ),
      ),
    );
  }
}
