import 'package:e_commercy_app/view/screen/category_screen.dart';
import 'package:e_commercy_app/view/screen/fovorites_screen.dart';
import 'package:e_commercy_app/view/screen/home_screen.dart';
import 'package:e_commercy_app/view/screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Maincontroller extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs =
      [HomeScreen(), CategoryScreen(), FovoritesScreen(), SettingScreen()].obs;

  final title = [
    "Asroo Shop",
    "Categories",
    "Favourites",
    "Setting",
  ];
}
