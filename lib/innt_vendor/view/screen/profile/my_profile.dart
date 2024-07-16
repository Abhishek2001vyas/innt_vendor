import 'dart:io';

import 'package:demo_innt/innt_vendor/view/api_constant/deleteaccount_api.dart';
import 'package:demo_innt/innt_vendor/view/api_constant/get_vendorprofile_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../../innt_delivery/Controllers/constant.dart';
import '../../../../innt_delivery/Controllers/controller.dart';
import '../../../../innt_delivery/Controllers/text2.dart';
import '../../../../ulits/constant.dart';
import '../bank_details/bank_details.dart';
import '../bottom_navigationbar.dart';
import '../menu_screen/profile/update_profile.dart';
import '../settings/settings.dart';
import 'account_deletion.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({
    super.key,
  });

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isDarkMode = false;
  GetxControllers controller = Get.put(GetxControllers());
  final getVendorProfile = Get.put(fetchVendorProfile());
  final deleteAccount = Get.put(deleteAccountApi());

  @override
  Widget build(BuildContext context) {
    GetxControllers controller = Get.put(GetxControllers());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                setState(() {
                  currentTab = 4;
                });
                Get.offAll(DashboardScreenVendor());
              },
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.myprofile,
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: getVendorProfile.vendorProfile(),
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
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: logocolo,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await controller.getFromGallery();
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: controller.imageFile != null
                                      ? CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 30,
                                          backgroundImage: FileImage(File(
                                              controller.imageFile!.path
                                                  .toString())))
                                      : CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                            "${image_url}${vendorProfileList[0]["vender_profile"]}",
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(
                                width: w / 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${vendorProfileList[0]["firstName"]} ${vendorProfileList[0]["lastName"]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        fontFamily: "Hey"),
                                  ),
                                  Text(
                                    vendorProfileList[0]["mobile_number"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: "Hey"),
                                  )
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  Get.to(() => const EditProfile());
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                SizedBox(
                  height: h / 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h / 6,
                      width: w / 3.3,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.local_offer_outlined,
                            color: logocolo,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "11",
                            style: TextStyle(
                                color: logocolo,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.products,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: h / 6,
                      width: w / 3.3,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: logocolo,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "23",
                            style: TextStyle(
                                color: logocolo,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.orders,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: h / 6,
                      width: w / 3.3,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.attach_money,
                            color: logocolo,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "9.57K",
                            style: TextStyle(
                                color: logocolo,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.balance,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: h / 60,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const Setting());
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                        ],
                        border:
                            Border.all(color: Colors.grey.shade200, width: 1)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings_suggest,
                          color: logocolo,
                        ),
                        SizedBox(
                          width: w / 60,
                        ),
                        Text(
                          AppLocalizations.of(context)!.setting,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: logocolo,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const BankDetails());
                    //Get.to(() => const BankInfo());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                        ],
                        border:
                            Border.all(color: Colors.grey.shade200, width: 1)),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_balance,
                          color: logocolo,
                        ),
                        SizedBox(
                          width: w / 60,
                        ),
                        Text(
                          AppLocalizations.of(context)!.bank_mobile_money_info,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: logocolo,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //deleteAccount;

                    Future.delayed(const Duration(seconds: 0),
                        () => deleteMyAccountDialog(context));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                        ],
                        border:
                            Border.all(color: Colors.grey.shade200, width: 1)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: customColor,
                        ),
                        SizedBox(
                          width: w / 60,
                        ),
                        Text(
                          AppLocalizations.of(context)!.delete_account,
                          style: TextStyle(
                            color: customColor,
                            fontSize: 17,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: logocolo,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

deleteMyAccountDialog(BuildContext context) async {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: h / 5,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(
                Icons.check,
                color: Colors.grey.shade400,
                size: 40,
              ),
              SizedBox(
                height: h / 90,
              ),
              Text(
                'Are you sure you want to delete your account?',
                style: A_style_medium,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: w / 5,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'No',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Ember_Bold"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountDeletion(),
                      ),
                    );
                  });
                },
                child: Container(
                  width: w / 5,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: customColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Ember_Bold",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 80,
          )
        ],
      );
    },
  );
}
