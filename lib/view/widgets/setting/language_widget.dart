import 'package:e_commercy_app/logic/controller/setting_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/my_string.dart';
import '../../../utils/them.dart';
import '../text_util.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({super.key});
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: languageSettings,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    text: 'Language'.tr),
              ],
            ),
          ),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconSize: 25,
                icon: const Icon(Icons.arrow_drop_down),
                items: [
                  DropdownMenuItem(
                      value: ene,
                      child: Text(
                        english,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                  DropdownMenuItem(
                      value: ara,
                      child: Text(
                        arabic,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                  DropdownMenuItem(
                      value: frf,
                      child: Text(
                        france,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ],
                value: controller.langlocal,
                onChanged: (value) {
                  controller.ChangeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
