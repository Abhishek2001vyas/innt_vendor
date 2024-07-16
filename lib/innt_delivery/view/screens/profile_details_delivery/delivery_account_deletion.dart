import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/text2.dart';

class DeliveryAccountDeletion extends StatefulWidget {
  const DeliveryAccountDeletion({super.key});

  @override
  State<DeliveryAccountDeletion> createState() =>
      _DeliveryAccountDeletionState();
}

class _DeliveryAccountDeletionState extends State<DeliveryAccountDeletion> {
  bool? isChecked;

  bool isloading = false;
  Set<int> selectedIndexes = Set<int>();

  // final deleteseller = Get.put(Seller_delete_api());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Account deletion",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 60,
            ),
            Text(
              'Please let us know the reasons you are\ndeleting your account',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Ember_Display_Medium'),
              maxLines: 2,
            ),
            SizedBox(height: h / 80),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: deliverydeletereason.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Checkbox(
                      value: selectedIndexes.contains(index),
                      activeColor: const Color(0xff1455ac),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value != null) {
                            if (value) {
                              selectedIndexes.clear();
                              selectedIndexes.add(index);
                              print('${selectedIndexes}');
                            } else {
                              selectedIndexes.remove(index);
                              print('${selectedIndexes}');
                            }
                          }
                        });
                      },
                    ),
                    Text(
                      "${deliverydeletereason[index]}",
                      style: A_style_medium,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: h / 80),
            TextFormField(
              controller: textdeleteController,
              /* validator: (value) {
                            if (value!.length < 10) {
                              return "Invalid email address";
                            } else {
                              return null;
                            }
                          },*/
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                // hintText: "Bank Name",
                // labelText: "Bank Name",
                // labelStyle: const TextStyle(color: Colors.black)
              ),
            ),
            SizedBox(height: h / 80),
            GestureDetector(
              onTap: () {
                _showAnimatedPopup(context);
                // var ddd = selectedIndexes.first;
                // print("idfkihdk$ddd");
                // if (selectedIndexes.isEmpty) {
                //   Utils()
                //       .sendMassage("please select reason for delete account");
                // } else {
                //   deleteseller.Seller_delete(deletereason[ddd].toString(),
                //       textdeleteController.text.toString(), context);
                // }
              },
              child: Container(
                height: 50,
                width: Get.width,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: customColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Proceed and delete",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Ember_Display_Medium'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextEditingController textdeleteController = TextEditingController();
}

_showAnimatedPopup(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final h = MediaQuery.of(context).size.height;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.white,
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 40,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        "Your account has been deleted",
                        style: A_style_medium,
                      ),
                      SizedBox(
                        height: h / 50,
                      ),
                      Text(
                        "We hope to see you soon !",
                        style: A_style_medium,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h / 40,
              ),
              Image.asset(
                "assets/images/successfully-unscreen.gif",
                height: 100,
                width: 100,
                color: logocolo,
              ),
              SizedBox(
                height: h / 40,
              ),
            ],
          )
        ],
      );
    },
  );
}
