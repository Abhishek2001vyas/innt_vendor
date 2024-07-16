import 'package:demo_innt/innt_vendor/view/screen/menu_screen/aad_product_list.dart';
import 'package:flutter/material.dart';

import '../../../innt_delivery/Controllers/constant.dart';
import '../users/chat_list.dart';
import 'home_screen.dart';
import 'menu_screen/menu.dart';
import 'order/my_order_screen.dart';

var currentTab = 0;

class DashboardScreenVendor extends StatefulWidget {
  const DashboardScreenVendor({super.key});

  @override
  State<DashboardScreenVendor> createState() => _DashboardScreenVendorState();
}

class _DashboardScreenVendorState extends State<DashboardScreenVendor> {

  final List<Widget> screens = [
    const HomeScreen(),
    const OrderScreen(),
    ChatList(),
    // const ProductsScreen(),
    ProductList(),
    Menu(),
  ];

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentTab != 0) {
          setState(() {
            currentTab = 0;
          });
          return false;
        } else {
          if (currentBackPressTime == null ||
              DateTime.now().difference(currentBackPressTime!) >
                  Duration(seconds: 2)) {
            currentBackPressTime = DateTime.now();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Press back again to exit'),
              ),
            );
            return false;
          } else {
            return true;
          }
        }
      },
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentTab,
              onTap: (index) {
                setState(() {
                  currentTab = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: currentTab == 0
                        ? Image.asset(
                            "assets/images/home_blue_logo1.png",
                            color: currentTab == 0 ? logocolo : Colors.black,
                            height: 22,
                          )
                        : Image.asset(
                            "assets/images/home_blue_logo1.png",
                            color: currentTab == 0 ? logocolo : Colors.black,
                            height: 22,
                          ),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: currentTab == 1
                        ? Image.asset(
                            "assets/images/shopping-cart.png",
                            color: currentTab == 1 ? logocolo : Colors.black,
                            height: 22,
                          )
                        : Image.asset(
                            "assets/images/shopping-cart.png",
                            color: currentTab == 1 ? logocolo : Colors.black,
                            height: 22,
                          ),
                    label: "Orders"),
                BottomNavigationBarItem(
                    icon: currentTab == 2
                        ? Icon(
                            Icons.message_rounded,
                            color: currentTab == 2 ? logocolo : Colors.black,
                            size: 20,
                          )
                        : Icon(
                            Icons.message_outlined,
                            color: currentTab == 2 ? logocolo : Colors.black,
                            size: 20,
                          ),
                    label: "Chats"),
                //  offers.png
                BottomNavigationBarItem(
                    icon: currentTab == 3
                        ? Image.asset(
                            "assets/images/offers.png",
                            color: currentTab == 3 ? logocolo : Colors.black,
                            height: 22,
                          )
                        : Image.asset(
                            "assets/images/offers.png",
                            color: currentTab == 3 ? logocolo : Colors.black,
                            height: 22,
                          ),
                    label: "Products"),
                BottomNavigationBarItem(
                    icon: currentTab == 4
                        ? Icon(
                            Icons.grid_view_sharp,
                            color: currentTab == 4 ? logocolo : Colors.black,
                            size: 20,
                          )
                        : Icon(
                            Icons.grid_view_outlined,
                            color: currentTab == 4 ? logocolo : Colors.black,
                            size: 20,
                          ),
                    label: "Menu"),
              ]),
          backgroundColor: Colors.white,
          body: screens[currentTab]),
    );
  }
}
