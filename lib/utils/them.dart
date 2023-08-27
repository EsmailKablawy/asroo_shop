import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947F);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6138e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSetting = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class themsApp {
  static final light = ThemeData(
      primaryColor: mainColor,
      backgroundColor: Colors.white,
      brightness: Brightness.light);
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    // ignore: deprecated_member_use
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
