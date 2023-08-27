import 'package:e_commercy_app/logic/controller/auth_controller.dart';
import 'package:e_commercy_app/logic/controller/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/them.dart';
import '../text_util.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});
  final controller = Get.find<AuthController>();
  final mainController = Get.find<Maincontroller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
                backgroundColor: Colors.grey[800],
                title: '',
                middleText: 'Are you sure you need to logout?',
                middleTextStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textCancel: 'No'.tr,
                textConfirm: 'Yes'.tr,
                cancelTextColor: Colors.red,
                confirmTextColor: Colors.white,
                buttonColor: Colors.black,
                onConfirm: () {
                  controller.SignOutFromApp();
                  // mainController.currentIndex.value = 0;
                });
          },
          splashColor: Get.isDarkMode
              ? pinkClr.withOpacity(0.4)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
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
                  text: 'log Out'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
