import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/text2.dart';
import '../../../ulits/constant.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

dynamic empty = [0];
List order = [
  "Regular",
  "Saved",
];

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          forceMaterialTransparency: true,
          automaticallyImplyLeading: true,
          foregroundColor: logocolo,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.my_reviews,
            style: Text_Bold,
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: h / 10.5,
                child: ListView.builder(
                    itemCount: order.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            empty.clear();
                            empty.add(index);
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: empty.contains(index)
                                  ? logocolo
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200, blurRadius: 2)
                              ],
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )),
                          child: Text(
                            order[index],
                            style: empty.contains(index)
                                ? const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)
                                : const TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
              ),
            ),
            empty.contains(0).toString() == "true"
                ? Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                        ],
                        border: Border.all(
                          color: Colors.grey.shade200,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "OrderId: #1283",
                              style: TextStyle(
                                fontFamily: "Ember_Bold",
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.calendar_month,
                              color: logocolo,
                              size: 18,
                            ),
                            Text("19 November, 2024", style: A_style_mid),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Image.asset(
                                  "assets/images/user.png",
                                  scale: 7,
                                )),
                            const Text(
                              "David jack",
                              style: TextStyle(
                                fontFamily: "Ember_Bold",
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: w / 70,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Text(
                          "Nice Human",
                          style: TextStyle(
                              //letterSpacing:  1.5,
                              //color: Colors.white,
                              color: Colors.grey.shade700,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "Rate your service:",
                              style: TextStyle(
                                  //letterSpacing:  1.5,
                                  //color: Colors.white,
                                  color: Colors.grey.shade700,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              width: w / 80,
                            ),
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: logocolo,
                            ),
                            Text("5", style: A_style_order),
                            Spacer(),
                            const Icon(
                              Icons.copy,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2)
                        ],
                        border: Border.all(
                          color: Colors.grey.shade200,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "OrderId: #1283",
                              style: TextStyle(
                                fontFamily: "Ember_Bold",
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.calendar_month,
                              color: logocolo,
                              size: 18,
                            ),
                            Text("19 November, 2024", style: A_style_mid),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: Image.asset(
                                  "assets/images/user.png",
                                  scale: 7,
                                )),
                            const Text(
                              "David jack",
                              style: TextStyle(
                                fontFamily: "Ember_Bold",
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: w / 70,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Text(
                          "Nice Human",
                          style: TextStyle(
                              //letterSpacing:  1.5,
                              //color: Colors.white,
                              color: Colors.grey.shade700,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "Rate your service:",
                              style: TextStyle(
                                  //letterSpacing:  1.5,
                                  //color: Colors.white,
                                  color: Colors.grey.shade700,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              width: w / 80,
                            ),
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: logocolo,
                            ),
                            Text("5", style: A_style_order),
                            Spacer(),
                            const Icon(
                              Icons.copy,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
