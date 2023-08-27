import 'package:e_commercy_app/logic/controller/setting_controller.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../logic/controller/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
                activeColor: mainColor,
                activeTrackColor: mainColor,
                value: controller.switchValue.value,
                onChanged: (value) {
                  ThemController().changeTheme();
                  controller.switchValue.value = value;
                })
          ],
        ));
  }

  buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Get.isDarkMode ? mainColor : darkSettings,
              ),
              child: Get.isDarkMode
                  ? const Icon(
                      Icons.light_mode,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    )),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              text: Get.isDarkMode ? 'Light Mode'.tr : 'Dark Mode'.tr),
        ],
      ),
    );
  }
}
