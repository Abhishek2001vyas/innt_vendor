import 'package:flutter/material.dart';

import '../../../../innt_delivery/Controllers/text2.dart';

class ReturnPolicy extends StatelessWidget {
  const ReturnPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Return Policy",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("This is a Return Policy", style: A_style_medium),
            const SizedBox(
              height: 5,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.",
                style: TextStyle(
                  //  letterSpacing: 1,
                  //color: Colors.white,
                    color: Colors.grey.shade700,
                    fontFamily: "Amazon_med",
                    fontSize: 16)),
            SizedBox(
              height: h / 90,
            ),
            const Text(
              "How the Information is collected",
              style: TextStyle(
                  fontFamily: "Ember_Display_Medium",
                  fontSize: 20,
                  color: Colors.black),
            ),
            Divider(
              color: Colors.grey.shade500,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("Information provided by web browser", style: A_style_medium),
            const SizedBox(
              height: 5,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.",
                style: A_style_order),
          ],
        ),
      ),
    );
  }
}
