import 'package:demo_innt/innt_vendor/view/screen/bottom_navigationbar.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/aad_product_list.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/qr_codes/qr_code.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/reviews/review.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/staff.dart';
import 'package:demo_innt/innt_vendor/view/screen/menu_screen/wallet_screen.dart';
import 'package:demo_innt/innt_vendor/view/users/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../innt_delivery/Controllers/text2.dart';
import '../../Api/Add_product_api.dart';
import '../../Api/shopinfomationapi.dart';
import '../../auth_vendor/seller_login.dart';
import '../anboutus.dart';
import '../bank_details/bank_details.dart';
import '../cancel.dart';
import '../home_screen.dart';
import '../option_screen.dart';
import '../policy/refund_policy.dart';
import '../policy/term_condition.dart';
import '../profile/my_profile.dart';
import '../returnpolicy.dart';
import 'coupon/coupon_list.dart';
import 'my_offers/my_offers.dart';
import 'refundspolicyss.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

List products = [
  {"image": "assets/images/profile.png", "products": "Profile"},
  {"image": "assets/images/myshop.png", "products": "My Shop"},
  {"image": "assets/images/addproduct.png", "products": "Add Product"},
  {"image": "assets/images/product.jpg", "products": "Products"},
  // {"image": "assets/images/inventory.png", "products": "Inventory"},
  {"image": "assets/images/review.png", "products": "Reviews"},
  {"image": "assets/images/coupon.png", "products": "Coupons"},
  {"image": "assets/images/wallet.png", "products": "Wallet"},
  {"image": "assets/images/message.png", "products": "Chat"},
  {"image": "assets/images/bank.png", "products": "Bank and Mobile Money"},
  {"image": "assets/images/refundpolicy.png", "products": "Refunds"},
  {"image": "assets/images/staff.png", "products": "Staff"},
  {"image": "assets/images/qr-code.png", "products": "QR codes"},
  // {"image": "assets/images/subs.png", "products": "Subscription Plan"},
  {"image": "assets/images/addvertise-items.png", "products": "Offers"},
  {"image": "assets/images/term.png", "products": "Terms & Privacy Policy"},
  {"image": "assets/images/privacy.png", "products": "Refund Policy"},
  {"image": "assets/images/return_policy.png", "products": "Return Policy"},
  {
    "image": "assets/images/cancellationpolicy.png",
    "products": "Cancellation Policy"
  },
  {"image": "assets/images/aboutus.png", "products": "About Us"},
  {"image": "assets/images/logout.png", "products": "Logout"},
];

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  //primary: Colors.black87,
  minimumSize: Size(78, 16),
  padding: const EdgeInsets.symmetric(horizontal: 8),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);
final addproduct = Get.put(Seller_product_api());
final shopinfo = Get.put(Seller_shopinfo_api());

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Menu",
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.9),
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Get.to(() => const MyProfile());
                    } else if (index == 1) {
                      shopinfo.shopinfo();
                    } else if (index == 2) {
                      addproduct.Categories();

                      //Get.to(() => const AddProduct());
                    } else if (index == 3) {
                      setState(() {
                        currentTab = 3;
                      });

                      Get.to(() => const ProductList());
                    } else if (index == 4) {
                      Get.to(() => ReviewScreen());
                    } else if (index == 5) {
                      Get.to(() => const CouponList());
                    } else if (index == 6) {
                      Get.to(() => const Wallet());
                    } else if (index == 7) {
                      Get.to(() => const ChatList());
                    } else if (index == 8) {
                      // Get.to(() => const BankInfo());
                      Get.to(() => const BankDetails());
                    } else if (index == 9) {
                      Get.to(() => const RefundPolicy());
                    } else if (index == 10) {
                      Get.to(() => const Staff());
                    } else if (index == 11) {
                      Get.to(() => const QRCodesScreen());
                    } else if (index == 12) {
                      Get.to(() => const MyOffers());
                    } else if (index == 13) {
                      Get.to(() => const TermCondition());
                    } else if (index == 14) {
                      Get.to(() => const refundspolicys());
                    } else if (index == 15) {
                      Get.to(() => const Returnpoilcy());
                    } else if (index == 16) {
                      Get.to(() => const canelpoilcy());
                    } else if (index == 17) {
                      Get.to(() => const aboutus());
                    } else {
                      showMyDialog(context);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 3),
                        ],
                        border:
                            Border.all(color: Colors.grey.shade200, width: 2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          products[index]["image"].toString(),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: h / 50,
                        ),
                        Text(
                          products[index]["products"].toString(),
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                );
              },
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
        content: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'Logout from Seller App?',
            style: A_style_medium,
            textAlign: TextAlign.center,
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

                  Get.offAll(() => SellerLogin());
                },
                child: Container(
                  width: w / 5,
                  decoration: BoxDecoration(
                      color: const Color(0xff1455ac),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    style: flatButtonStyle,
                    onPressed: () async {
                      //  Get.to(() => const SellerLogin());
                      var shared_preferences =
                          await SharedPreferences.getInstance();
                      shared_preferences.remove("Session");

                      Get.offAll(() => SellerLogin());
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
          SizedBox(
            height: h / 80,
          )
        ],
      );
    },
  );
}
