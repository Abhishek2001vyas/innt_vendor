import 'package:flutter/material.dart';

import '../../../Controllers/constant.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              "Address",
            ),
            Spacer(),
            Icon(
              Icons.add,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
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
                    color: logocolo,
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
            SizedBox(
              height: h / 100,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(0.0, 1.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 30,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Ember",
                                  fontSize: 18),
                            ),
                            Text(
                              "Indore MadhyaPradesh",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Ember",
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        const Spacer(),
                        PopupMenuButton(
                          color: Colors.white,
                          offset: Offset.zero,
                          elevation: 0,
                          onSelected: (value) {
                            // your logic
                          },
                          itemBuilder: (BuildContext bc) {
                            return [
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    const Text("Edit"),
                                    SizedBox(
                                      width: w / 20,
                                    ),
                                    const Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    const Text("Delete"),
                                    SizedBox(
                                      width: w / 20,
                                    ),
                                    Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.redAccent.shade400,
                                    )
                                  ],
                                ),
                              ),
                            ];
                          },
                        )
                      ],
                    ),
                  );
                }),
          ])),
    );
  }
}
