import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Row(
          children: [
            Text(
              "Coupon",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Spacer(),
            Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: h / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(blurRadius: 1, color: Colors.grey.shade50)
                  ]),
              child: TextFormField(
                onSaved: (value) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xD7EAF0FA),
                  hintText: "Search...",
                  hintStyle: const TextStyle(
                      color: Colors.black, fontSize: 17, fontFamily: "Ember"),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Get.theme.primaryColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(18)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(18)),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(0.0, 1.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/coupon_ecom.png",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "75% Discount on Purchase",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Ember",
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            const Text(
                              "Discount on Purchase",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Ember",
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: h / 80,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'GIFTFORYOU50',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "Ember_Bold"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h / 80,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
