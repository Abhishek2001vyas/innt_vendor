import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Controllers/constant.dart';
import '../screens/chat_list.dart';
import '../screens/home_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/order_history.dart';
import '../screens/profile_details_delivery/delivery_profile_screen.dart';

int selectedIndex = 0;

class DashboardDelivery extends StatefulWidget {
  const DashboardDelivery({super.key});

  @override
  State<DashboardDelivery> createState() => _DashboardDeliveryState();
}

class _DashboardDeliveryState extends State<DashboardDelivery> {
  // final autoSizeGroup = AutoSizeGroup();
 // to keep track of active tab index
  final List<Widget> screens = [
    const HomeScreenDel(),
    const OrderHistory(),
    MessageScreen(),
    const NotificationScreen(),
    // ProfileScreenDelivery(),
    DeliveryProfileScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreenDel();

  //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Nav_bar(),));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Image.asset(
              "assets/images/home_blue_logo1.ico",
              fit: BoxFit.cover,
              height: 30,
              width: 30,
            ),
            icon: Image.asset(
              "assets/images/home_blue_logo1.ico",
              color: Colors.black,
              scale: 9,
            ),
            label:   AppLocalizations.of(context)!.home,
          ),
           BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.history, color: logocolo),
            icon: Icon(Icons.history, color: Colors.black),
            label:   AppLocalizations.of(context)!.order,
          ),
           BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.message_rounded, color: logocolo),
            icon: Icon(Icons.message_outlined, color: Colors.black),
            label:   AppLocalizations.of(context)!.chat,
          ),
           BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.notifications, color: logocolo),
            icon: Icon(Icons.notifications_none, color: Colors.black),
            label: 'Notification',
          ),
           BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.person, color: logocolo),
            icon: Icon(Icons.person_2_outlined, color: Colors.black),
            label:   AppLocalizations.of(context)!.myprofile,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: logocolo,
        onTap: onItemTapped,
      ),
    );
  }

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];
}
