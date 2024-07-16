import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../language.dart';
import '../../../../language_constant.dart';
import '../../../../main.dart';


class Changelanguage extends StatefulWidget {
  const Changelanguage({super.key});

  @override
  State<Changelanguage> createState() => _ChangelanguageState();
}

class _ChangelanguageState extends State<Changelanguage> {
  List<String> language=[
    "english",
    "french"
  ];
  RxString  languagee="en".obs;


  lll()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    languagee.value= _prefs.get(LAGUAGE_CODE).toString();

  }

  @override
  void initState() {
    lll();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(title: Text( AppLocalizations.of(context)!.change_language),centerTitle: true,),
      body: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Container(
              width: w / 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  hint: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(CupertinoIcons.globe,
                          color: Colors.grey, size: 20),
                      SizedBox(width: 30),
                      Obx(() =>
                      languagee.value=="fr"?
                      Text("french",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)) :
                      Text("ENGLISH",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500))),
                    ],
                  ),
                  // icon: const Icon(
                  //   Icons.language,
                  //   color: Colors.white,
                  // ),
                  onChanged: (Language? language) async {
                    if (language != null) {
                      Locale _locale =
                      await setLocale(language.languageCode);
                      MyApp.setLocale(context, _locale);
                      lll();
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 13),
                          ),
                          Text(
                            e.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
