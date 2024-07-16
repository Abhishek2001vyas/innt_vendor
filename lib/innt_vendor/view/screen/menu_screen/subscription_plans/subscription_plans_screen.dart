import 'package:flutter/material.dart';

import '../../../../../innt_delivery/Controllers/text2.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Subscription plans",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: h / 6,
            ),
            Text(
              "Admin can create multiple subscription plans and they will appear her",
              style: A_style_medium,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
