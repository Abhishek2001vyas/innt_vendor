import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Api/wallet.dart';
import '../../Controllers/button.dart';
import '../../Controllers/constant.dart';
import '../../Controllers/text2.dart';

class WithdrawalRequest extends StatefulWidget {
  const WithdrawalRequest({super.key});

  @override
  State<WithdrawalRequest> createState() => _WithdrawalRequestState();
}

class _WithdrawalRequestState extends State<WithdrawalRequest> {
  final amount = TextEditingController();
  final mobile = TextEditingController();
  bool passwordObscured = true;
  bool passwordObscured1 = true;
  final walletapi = Get.put(Delivery_wallet_api());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Withdrawal request",
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
            )),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      const Text(
                        " Enter amount to withdraw",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Ember_Medium",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: w / 100,
                      ),
                      Icon(
                        Icons.star,
                        size: 6,
                        color: customColor,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please entre amount";
                      } else {
                        return null;
                      }
                    },
                    controller: amount,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Ex: 10000",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.all(12),
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
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(" Enter mobile money number", style: TextStyle()),
                    SizedBox(
                      width: w / 100,
                    ),
                    Icon(
                      Icons.star,
                      size: 6,
                      color: customColor,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please entre mobile number";
                      } else {
                        return null;
                      }
                    },
                    controller: mobile,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Ex: 10000",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.all(12),
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                  child: ElevatedButton(
                      style: buttonPrimary,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await walletapi.withdrawalrequest(
                              amount.text.toString(), mobile.text.toString());
                        } else {}

                        // _showAnimatedPopup(context);
                      },
                      child: const Text("Continue",
                          style: A_style_text_inside_button)),
                ),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Text(
                          "Back",
                          style: A_style_medium,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
