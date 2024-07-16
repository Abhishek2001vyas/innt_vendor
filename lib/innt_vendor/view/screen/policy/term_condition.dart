import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../innt_delivery/Controllers/text2.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            AppLocalizations.of(context)!.terms_condition
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Condition & Attending",
              style: A_style_medium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
              style: TextStyle(
                  //  letterSpacing: 1,
                  //color: Colors.white,
                  color: Colors.grey.shade700,
                  fontFamily: "Amazon_med",
                  fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.grey.shade200),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Terms & Use",
              style: A_style_medium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
              style: TextStyle(
                  //  letterSpacing: 1,
                  //color: Colors.white,
                  color: Colors.black,
                  fontFamily: "Amazon_med",
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
