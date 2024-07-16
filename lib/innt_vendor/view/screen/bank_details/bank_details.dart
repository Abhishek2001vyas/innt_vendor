import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/controller.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../innt_delivery/base/custom_button.dart';
import '../../api_constant/get_information_api.dart';
import '../bottom_navigationbar.dart';
import '../menu_screen/bank_money_update.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({
    super.key,
  });

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  GetxControllers controller = Get.put(GetxControllers());
  final getBankInfoApi = Get.put(fetchBankInfoList());
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  TextEditingController bankAccountNameController = TextEditingController();
  TextEditingController swiftCOdeController = TextEditingController();
  TextEditingController mobileMoneyNoController = TextEditingController();

  // final co=Get.put(bottomcontroller());
  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              setState(() {
                currentTab = 4;
              });

              Get.offAll(DashboardScreenVendor());
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title:  Text(
            AppLocalizations.of(context)!.bank_and_mobile_money
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h / 40),
            FutureBuilder(
                future: getBankInfoApi.getBankInfoList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while waiting for the data
                    return Center(
                        child: Image.asset(
                      "assets/images/spinner.gif",
                      color: logocolo,
                    ));
                  } else if (snapshot.hasError) {
                    // Display an error message if the future throws an error
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${  AppLocalizations.of(context)!.bank_name_optional} ", style: A_style_medium),
                        SizedBox(height: h / 100),
                        TextFormField(
                          initialValue:
                              bankInformation[0]["bank_name"].toString(),
                          readOnly: true,
                          //  controller: bankNameController,
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
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            // hintText: "Bank Name",
                            // labelText: "Bank Name",
                            // labelStyle: const TextStyle(color: Colors.black)
                          ),
                        ),
                        SizedBox(
                          height: h / 40,
                        ),
                        Text(  AppLocalizations.of(context)!.bank_account_number_optional,
                            style: A_style_medium),
                        SizedBox(height: h / 100),
                        TextFormField(
                          initialValue:
                              bankInformation[0]["acc_number"].toString(),
                          readOnly: true,
                          //controller: bankAccountNumberController,
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
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            // hintText: "A/C Holder Name",
                            // labelText: "A/C Holder Name",
                            // labelStyle: const TextStyle(color: Colors.black)
                          ),
                        ),
                        SizedBox(
                          height: h / 40,
                        ),
                        Text(  AppLocalizations.of(context)!.bank_account_name_optional,
                            style: A_style_medium),
                        SizedBox(height: h / 100),
                        TextFormField(
                          initialValue:
                              bankInformation[0]["bankAccount_name"].toString(),
                          readOnly: true,
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
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            // hintText: "Branch Name",
                            // labelText: "Branch Name",
                            // labelStyle: const TextStyle(color: Colors.black)
                          ),
                        ),
                        SizedBox(
                          height: h / 40,
                        ),
                        Text(  AppLocalizations.of(context)!.swift_code_optional, style: A_style_medium),
                        SizedBox(height: h / 100),
                        TextFormField(
                          initialValue:
                              bankInformation[0]["swift_code"].toString(),
                          readOnly: true,
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
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            // hintText: "A/C No.",
                            // labelText: "A/C No.",
                            // labelStyle: const TextStyle(color: Colors.black)
                          ),
                        ),
                        SizedBox(
                          height: h / 40,
                        ),
                        Text(  AppLocalizations.of(context)!.mobile_money_number, style: A_style_medium),
                        SizedBox(height: h / 100),
                        TextFormField(
                          initialValue: bankInformation[0]
                                  ["mobile_money_number"]
                              .toString(),
                          readOnly: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            // hintText: "A/C No.",
                            // labelText: "A/C No.",
                            // labelStyle: const TextStyle(color: Colors.black)
                          ),
                        ),
                      ],
                    );
                  }
                }),
            SizedBox(
              height: h / 40,
            ),
            CustomButton(
                title:   AppLocalizations.of(context)!.update,
                onTap: () {
                  Get.to(BankMoneyUpdate());
                }),
          ],
        ),
      ),
    );
  }
}
