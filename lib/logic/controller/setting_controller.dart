import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class SettingController extends GetxController {
  var switchValue = false.obs;
  var storge = GetStorage();
  var langlocal = ene;

  String capitalize(String profileName) {
    return profileName
        .split(" ")
        .map((name) => name.capitalize)
        .join(" "); //عشان اخلى الحروف كابيتال
  }

  // Language
  @override
  void onInit() async {
    langlocal = await getLanguage;
    super.onInit();
  }

  void SaveLanguage(String lang) async {
    await storge.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storge.read('lang');
  }

  void ChangeLanguage(String typeLang) {
    if (langlocal == typeLang) {
      return;
    }
    if (typeLang == frf) {
      langlocal = frf;
      SaveLanguage(frf);
    } else if (typeLang == ara) {
      langlocal = ara;
      SaveLanguage(ara);
    } else {
      langlocal = ene;
      SaveLanguage(ene);
    }
    update();
  }
}
