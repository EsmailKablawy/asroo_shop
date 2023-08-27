import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class ThemController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';

  savaThemDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemDataFromBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get ThemDataGet =>
      getThemDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(
        getThemDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    savaThemDataInBox(!getThemDataFromBox());
  }
}
