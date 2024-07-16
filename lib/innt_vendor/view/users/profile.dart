/*

import 'package:demo_innt/innt_vedor/view/auth_vendor/signwithphone.dart';
import 'package:demo_innt/innt_vedor/view/users/profile_information.dart';
import 'package:demo_innt/innt_vedor/view/users/refer_earn.dart';
import 'package:demo_innt/innt_vedor/view/users/wallet.dart';
import 'package:demo_innt/innt_vedor/view/users/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/home_screen.dart';
import '../screen/menu_screen/menu.dart';
import 'add_address.dart';
import 'chatting.dart';
import 'coupon.dart';
import 'loyalty.dart';
import 'myorder.dart';

class ProfileScreenDelivery extends StatefulWidget {
  const ProfileScreenDelivery({super.key});

  @override
  State<ProfileScreenDelivery> createState() => _ProfileScreenDeliveryState();
}

TextEditingController nameController = TextEditingController();

class _ProfileScreenDeliveryState extends State<ProfileScreenDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileInfo());
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade50,
                        blurRadius: 1,
                      ),
                    ]),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      size: 20,
                      color: Colors.grey.shade800,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Profile Information",
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 20,
                          fontFamily: "Roboto_thin"),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 15,
                      color: Colors.grey.shade800,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade50,
                      blurRadius: 1,
                    ),
                  ]),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const MyOrder());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.production_quantity_limits,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "My Order",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const WishList());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "WishList",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Wallet());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.wallet_membership_rounded,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "MY Wallet",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const Loyalty());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.loyalty,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Loyalty Point",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => UserChat());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Chat Box",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.support,
                        size: 20,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Support",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 20,
                            fontFamily: "Roboto_thin"),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.grey.shade800,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade50,
                      blurRadius: 1,
                    ),
                  ]),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const AddAddress());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.inbox,
                        size: 20,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Inbox",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 20,
                            fontFamily: "Roboto_thin"),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.grey.shade800,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ReferEarn());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.contact_phone_outlined,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Refer & Earn",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Coupon());
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          size: 20,
                          color: Colors.grey.shade800,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Coupon",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.policy_outlined,
                        size: 20,
                        color: Colors.grey.shade800,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Track Order",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 20,
                            fontFamily: "Roboto_thin"),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.grey.shade800,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(color: Colors.grey.shade200),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade50,
                      blurRadius: 1,
                    ),
                  ]),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showMyDialog(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.login_outlined,
                          size: 20,
                          color: Get.theme.primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 20,
                              fontFamily: "Roboto_thin"),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                          color: Colors.grey.shade800,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //    "App version: 4.6.8",
            //    style: TextStyle(color: Colors.grey.shade800, ),
            //  )
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
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Logout from User App?',
                style: TextStyle(
                    color: Colors.black, fontSize: 17, fontFamily: "Ember"),
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
                onTap: () {
                  Get.offAll(() => const HomeScreen());
                },
                child: Container(
                  width: w / 5,
                  decoration: BoxDecoration(
                      color: const Color(0xff1455ac),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                   SignInWithPhoneNumberVendor()),
                          (route) => false);
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
                  Get.offAll(() => const HomeScreen());
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
*/
