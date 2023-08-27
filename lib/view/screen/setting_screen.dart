import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/setting/dark_mode_widget.dart';
import '../widgets/setting/language_widget.dart';
import '../widgets/setting/logout_widget.dart';
import '../widgets/setting/profile_widget.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  late String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            profileWidget(),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Get.isDarkMode ? Colors.white : Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? pinkClr : mainColor,
                text: 'GENERAL'.tr),
            const SizedBox(
              height: 20,
            ),
            DarkModeWidget(),
            const SizedBox(
              height: 20,
            ),
            LanguageWidget(),
            const SizedBox(
              height: 20,
            ),
            LogOutWidget(),
          ],
        ));
  }
}
