import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../Api/policy.dart';

class refundspolicys extends StatefulWidget {
  const refundspolicys({super.key});

  @override
  State<refundspolicys> createState() => _refundspolicysState();
}

class _refundspolicysState extends State<refundspolicys> {
  final returnss = Get.put(Policy());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
            AppLocalizations.of(context)!.refund_policy
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: returnss.refundpolicy(),
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
                                "${returnss.refunds[0]["data"][0]["text"].toString()}",
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
