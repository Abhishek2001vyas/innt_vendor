import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../innt_delivery/Controllers/constant.dart';
import '../currency_page.dart';
import 'changed_password.dart';
import 'language.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isDarkMode = false;

  // final List<bool> _selections = List.generate(2, (_) => false);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: const Text("Settings")),
      body: SingleChildScrollView(
        child: Column(children: [
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
                    Get.to(() => Currency());
                  },
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.currency,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontFamily: "Amazon_med"),
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
                    Get.to(() => Changelanguage());
                  },
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.change_language,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontFamily: "Amazon_med"),
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
                    Get.to(() => ChangedPassword());
                  },
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.change_password,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontFamily: "Amazon_med"),
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
              ],
            ),
          ),
      /*    Container(
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
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.darkmode,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                        fontFamily: "Amazon_med"),
                  ),
                  const Spacer(),
                  FlutterSwitch(
                    width: 45.0,
                    height: 25.0,
                    valueFontSize: 15.0,
                    toggleSize: 15.0,
                    value: isDarkMode,
                    borderRadius: 30.0,
                    padding: 4.0,
                    showOnOff: false,
                    activeColor: Colors.grey,
                    inactiveColor: logocolo,
                    onToggle: (bool value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),*/
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
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.termspolicy,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontFamily: "Amazon_med"),
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
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.rateinnt,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontFamily: "Amazon_med"),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
