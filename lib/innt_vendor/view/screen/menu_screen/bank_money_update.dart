import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/controller.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../innt_delivery/base/custom_button.dart';
import '../../api_constant/get_information_api.dart';

class BankMoneyUpdate extends StatefulWidget {
  const BankMoneyUpdate({
    super.key,
  });

  @override
  State<BankMoneyUpdate> createState() => _BankMoneyUpdateState();
}

class _BankMoneyUpdateState extends State<BankMoneyUpdate> {
  GetxControllers controller = Get.put(GetxControllers());
  final getBankUpdateApi = Get.put(fetchBankInfoList());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController bankNameController =
      TextEditingController(text: bankInformation[0]["bank_name"].toString());
  TextEditingController bankAccountNumberController =
      TextEditingController(text: bankInformation[0]["acc_number"].toString());
  TextEditingController bankAccountNameController = TextEditingController(
      text: bankInformation[0]["bankAccount_name"].toString());
  TextEditingController swiftCodeController =
      TextEditingController(text: bankInformation[0]["swift_code"].toString());
  TextEditingController mobileMoneyNoController = TextEditingController(
      text: bankInformation[0]["mobile_money_number"].toString());

  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(  AppLocalizations.of(context)!.bank_name_optional, style: A_style_medium),
                SizedBox(height: h / 100),
                TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(15)],
                  // initialValue:
                  //     bankInformation[0]["bank_name"].toString(),
                  // readOnly: true,
                  controller: bankNameController,
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
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    // hintText: "Bank Name",
                    // labelText: "Bank Name",
                    // labelStyle: const TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                Text(  AppLocalizations.of(context)!.bank_account_number_optional, style: A_style_medium),
                SizedBox(height: h / 100),
                TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(15)],
                  // initialValue:
                  //     bankInformation[0]["acc_number"].toString(),
                  // readOnly: true,
                  controller: bankAccountNumberController,
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
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    // hintText: "A/C Holder Name",
                    // labelText: "A/C Holder Name",
                    // labelStyle: const TextStyle(color: Colors.black)
                  ),
                ),
                SizedBox(
                  height: h / 40,
                ),
                Text(  AppLocalizations.of(context)!.bank_account_name_optional, style: A_style_medium),
                SizedBox(height: h / 100),
                TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(15)],
                  controller: bankAccountNameController,
                  // initialValue:
                  //     bankInformation[0]["bankAccount_name"].toString(),
                  // readOnly: true,
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
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
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
                  inputFormatters: [LengthLimitingTextInputFormatter(15)],
                  controller: swiftCodeController,
                  // initialValue:
                  //     bankInformation[0]["swift_code"].toString(),
                  // readOnly: true,
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
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
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
                  inputFormatters: [LengthLimitingTextInputFormatter(15)],
                  controller: mobileMoneyNoController,
                  // initialValue: bankInformation[0]
                  //         ["mobile_money_number"]
                  //     .toString(),
                  // readOnly: true,
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
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    // hintText: "A/C No.",
                    // labelText: "A/C No.",
                    // labelStyle: const TextStyle(color: Colors.black)
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h / 40,
            ),
            Obx(() => getBankUpdateApi.isloading == true
                ? Center(
                    child: CircularProgressIndicator(color: logocolo),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          width: 130,
                          title:   AppLocalizations.of(context)!.cancel,
                          onTap: () {
                            // _bankMobileMoneyPopup(context);
                            // Future.delayed(
                            //   Duration(seconds: 2),
                            //   () => Get.to(SellerLogin()),
                            // );
                          }),
                      CustomButton(
                          width: 130,
                          title:   AppLocalizations.of(context)!.save,
                          onTap: () async {
                            print("pp");
                            await getBankUpdateApi.bankinfoupdate(
                              context,
                              mobileMoneyNoController.text.toString(),
                              bankNameController.text.toString(),
                              bankAccountNumberController.text.toString(),
                              bankAccountNameController.text.toString(),
                              swiftCodeController.text.toString(),
                            );
                          }),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
