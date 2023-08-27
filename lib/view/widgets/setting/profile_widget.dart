import 'package:e_commercy_app/logic/controller/auth_controller.dart';
import 'package:e_commercy_app/logic/controller/setting_controller.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class profileWidget extends StatelessWidget {
  profileWidget({super.key});
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://scontent.fcai23-1.fna.fbcdn.net/v/t39.30808-6/361633648_105024769337348_780824407917047749_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEw0imwnBTX6WwCjnwRwJwEQ7-Wyb8uMj5Dv5bJvy4yPvHRtH8F7Ibjdj9lmmTstTk54Xwr6x7IS0v79anadvmp&_nc_ohc=68l3T86akHAAX-6ngNb&_nc_ht=scontent.fcai23-1.fna&oh=00_AfB2l4gqlE2wwR2S77y_Cimo_UlGWM30sKEnybFQL-F3HQ&oe=64EFEABB'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        text: controller
                                .capitalize(authController.displayUserNam.value)
                                .isEmpty
                            ? 'name'
                            : controller.capitalize(
                                authController.displayUserNam.value)),
                    TextUtils(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode
                            ? Colors.grey
                            : Colors.black.withOpacity(0.4),
                        text: authController.displayUserEmail.value.isEmpty
                            ? 'user@email.com'
                            : authController.displayUserEmail.value),
                  ],
                )
              ],
            ))
      ],
    );
  }
}
