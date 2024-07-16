import 'package:demo_innt/innt_vendor/view/Api/createqrapi.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/qr_codes/qr_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../innt_delivery/Controllers/constant.dart';
import '../../../../../innt_delivery/Controllers/text2.dart';
import '../../../../../innt_delivery/base/custom_button.dart';
import '../../../../../ulits/utils.dart';

class CreateQRCode extends StatefulWidget {
  const CreateQRCode({super.key});

  @override
  State<CreateQRCode> createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCode> {
  TextEditingController codeNameController = TextEditingController();

  final qrapi = Get.put(QR_api());

  final List<String> _dropdownItems = [
    'Store front',
    'Specific product',
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
            AppLocalizations.of(context)!.qr_codes
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(  AppLocalizations.of(context)!.qrcodename, style: smallText),
                SizedBox(
                  width: w / 100,
                ),
                Text(
                  "*",
                  style: TextStyle(
                      color: customColor,
                      fontSize: 14,
                      fontFamily: "Ember_Medium",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: h / 100,
            ),
            TextFormField(
              controller: codeNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please entre name";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                filled: true,
                fillColor: Colors.white12,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                // labelText: 'Shop Name',
                // labelStyle: const TextStyle(
                //     color: Colors.black,
                //     fontSize: 16,
                //     fontFamily: 'Ember_Display_Medium'),
              ),
            ),
            SizedBox(
              height: h / 60,
            ),
            Row(
              children: [
                Text(  AppLocalizations.of(context)!.select_directory, style: smallText),
                SizedBox(
                  width: w / 100,
                ),
                Text(
                  "*",
                  style: TextStyle(
                      color: customColor,
                      fontSize: 14,
                      fontFamily: "Ember_Medium",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: h / 100,
            ),
            Container(
                width: Get.width,
                padding: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4.0,
                      ),
                    ],
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Obx(
                  () => DropdownButton<String>(
                    isExpanded: true,
                    underline: SizedBox(),
                    //alignment: Alignment.centerRight,
                    value: qrapi.selectedItem.value,
                    items: _dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        // alignment: AlignmentDirectional.,
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // if(newValue.toString()=="Store front"){
                      //   qrapi.product.value="";
                      // }

                      qrapi.selectedItem.value = newValue!;
                    },
                  ),
                )),
            SizedBox(
              height: h / 40,
            ),
            Obx(
              () => qrapi.selectedItem.value == "Specific product"
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Text(  AppLocalizations.of(context)!.chooseproduct, style: smallText),
                            SizedBox(
                              width: w / 100,
                            ),
                            Text(
                              "*",
                              style: TextStyle(
                                  color: customColor,
                                  fontSize: 14,
                                  fontFamily: "Ember_Medium",
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 100,
                        ),
                        Container(
                            width: Get.width,
                            padding: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 4.0,
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Obx(
                              () => DropdownButton(
                                isExpanded: true,
                                underline: SizedBox(),
                                //alignment: Alignment.centerRight,
                                value: qrapi.product.value.toString(),
                                hint: Text("select product"),
                                items: qrapi.productlist[0].data!.map((item) {
                                  return DropdownMenuItem(
                                    // alignment: AlignmentDirectional.,
                                    value: item.productId.toString(),
                                    child: Text(item.productName.toString()),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  qrapi.product.value = newValue.toString();
                                  // setState(() {
                                  //   selectedItem = newValue!;
                                  // });
                                },
                              ),
                            )),
                      ],
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: h / 10,
            ),
            CustomButton(
              title:   AppLocalizations.of(context)!.create,
              onTap: () async {
                if (codeNameController.text.isEmpty) {
                  Utils().sendMassage("Please entre Qr code name");
                } else {
                  await qrapi.Seller_qr(
                      codeNameController.text.toString(), context);
                  // Show the next popup
                  // Delay for the popup animation to finish, then navigate to the next screen
                  Future.delayed(Duration(seconds: 2), () {
                    Get.to(() => QRCodesScreen());
                  });
                } // Dismiss the current popup
              },
            )
          ],
        ),
      ),
    );
  }
}
