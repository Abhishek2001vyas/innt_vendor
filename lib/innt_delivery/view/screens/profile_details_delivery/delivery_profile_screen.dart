import 'package:demo_innt/innt_delivery/view/screens/profile_details_delivery/reviews.dart';
import 'package:demo_innt/innt_delivery/view/screens/profile_details_delivery/view_profile.dart';
import 'package:demo_innt/ulits/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_vendor/view/screen/option_screen.dart';
import '../../../../innt_vendor/view/screen/policy/privacy_policy.dart';
import '../../../../innt_vendor/view/screen/settings/language.dart';
import '../../../Api/getprofile.dart';
import '../../../Controllers/constant.dart';
import '../../../Controllers/text2.dart';
import '../home_screen.dart';
import 'delivery_account_deletion.dart';
import 'earning_statement.dart';
import 'emergency_contact.dart';
import 'help.dart';



class DeliveryProfileScreen extends StatefulWidget {
  const DeliveryProfileScreen({super.key});

  @override
  State<DeliveryProfileScreen> createState() => _DeliveryProfileScreenState();
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  //primary: Colors.black87,
  minimumSize: const Size(78, 16),
  padding: const EdgeInsets.symmetric(horizontal: 8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);

class _DeliveryProfileScreenState extends State<DeliveryProfileScreen> {
  final getprofile = Get.put(driverProfile());

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode = true;
    // GetxControllers controller = Get.put(GetxControllers());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: h / 10,
                        width: w,
                        decoration: BoxDecoration(
                          color: logocolo,
                        ),
                      ),
                      FutureBuilder(
                        future: getprofile.driverrProfile(),
                        builder: (context, snapshot) {
                          return getprofile.driveprofilee.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(top: h / 25.0),
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        //controller.getFromGallery();
                                      },
                                      child: Container(
                                        height: 95,
                                        width: 95,
                                        decoration: BoxDecoration(
                                            color: logocolo,
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            border: Border.all(
                                                color: Colors.white, width: 5)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            child: Image.network(
                                              "${image_url}${getprofile.driveprofilee[0]["data"]["frontId_iamge"]}",
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                  ),
                                )
                              : Text("");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  FutureBuilder(
                    future: getprofile.driverrProfile(),
                    builder: (context, snapshot) {
                      return getprofile.driveprofilee.isNotEmpty
                          ? Text(
                              "Hello ${getprofile.driveprofilee[0]["data"]["fname"].toString()} ${getprofile.driveprofilee[0]["data"]["lname"].toString()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: "Hey"),
                            )
                          : Text("");
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const ViewProfile());
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.personal_information,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const EarningStatement());
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                         CupertinoIcons.money_dollar_circle_fill,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.earning_statement,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(() => const Reviews());
                  //   },
                  //   child: Container(
                  //     width: w,
                  //     padding: const EdgeInsets.all(16),
                  //     margin: const EdgeInsets.only(
                  //       top: 8,
                  //     ),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.grey.shade200, blurRadius: 2),
                  //         ],
                  //         border: Border.all(
                  //             color: Colors.grey.shade200, width: 1)),
                  //     child: Row(
                  //       children: [
                  //         Icon(
                  //          Icons.reviews,
                  //           size: 20,
                  //           color: Colors.grey.shade800,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 15.0),
                  //           child:  Text(
                  //             AppLocalizations.of(context)!.reviews,
                  //             style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 17,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {

                      Get.to(() => const Changelanguage());
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.language,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
    AppLocalizations.of(context)!.language,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => HelpSupport());
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                           Icons.help,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.need_help,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => EmergencyContact());
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.contact_phone,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.contact_us,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => PrivacyPolicy());
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.policy,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.termspolicy,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     // Get.to(() => PrivacyPolicy());
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rate,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.rate_innt_office,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showMyDialog(context);
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 20,
                            color: Colors.grey.shade800,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.log_out,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      deleteMyAccountDialog(context);
                    },
                    child: Container(
                      width: w,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        top: 8,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade200, blurRadius: 2),
                          ],
                          border: Border.all(
                              color: Colors.grey.shade200, width: 1)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child:  Text(
                              AppLocalizations.of(context)!.delete_my_account,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

showMyDialog(BuildContext context) async {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
            child: Icon(Icons.login_sharp, size: 30, color: Color(0xff1455ac))),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Logout from Delivery App?',
                style: A_style_medium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  var shared_preferences =
                      await SharedPreferences.getInstance();
                  shared_preferences.remove("Session");

                  Get.offAll(() => OptionScreen());
                },
                child: Container(
                  width: w / 5,
                  decoration: BoxDecoration(
                      color: const Color(0xff1455ac),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    style: flatButtonStyle,
                    onPressed: () async {
                      var shared_preferences =
                          await SharedPreferences.getInstance();
                      shared_preferences.remove("Session");

                      Get.offAll(() => OptionScreen());
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EmailLoginDelivery()),
                      //     (route) => false);
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const HomeScreenDel());
                },
                child: Container(
                  width: w / 5,
                  decoration: BoxDecoration(
                      color: const Color(0xff1455ac),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Ember_Bold"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.check,
                color: Colors.grey.shade400,
                size: 60,
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
                  width: w / 4,
                  height: 40,
                  decoration: BoxDecoration(
                      color: logocolo, borderRadius: BorderRadius.circular(8)),
                  child: Center(
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
              ),
              GestureDetector(
                onTap: () {
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeliveryAccountDeletion(),
                      ),
                    );
                  });
                },
                child: Container(
                  width: w / 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: customColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
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

