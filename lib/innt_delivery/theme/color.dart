import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: Size(400, 50),
    backgroundColor: Color(0xff1455ac),
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));

final ButtonStyle buttonWhite = ElevatedButton.styleFrom(
    minimumSize: Size(400, 50),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)));

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xffffffff),
  primaryColor: const Color(0xff004bad),
  canvasColor: Color(0xff000000),
  secondaryHeaderColor: const Color(0xff1455ac),
  disabledColor: const Color(0xffa2a7ad),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    // primary: Colors.black87,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  )),
  textTheme: GoogleFonts.interTextTheme(),
);
