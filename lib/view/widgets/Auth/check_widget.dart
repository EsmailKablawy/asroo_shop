import 'package:e_commercy_app/logic/controller/auth_controller.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
                onTap: () {
                  controller.CheckBox();
                },
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: controller.isCheckBox
                        ? Get.isDarkMode
                            ? const Icon(
                                Icons.done,
                                size: 30,
                                color: pinkClr,
                              )
                            : Image.asset('assets/images/check.png')
                        : Container())),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    text: 'I accept '),
                Text(
                  ' terms & conditions',
                  style: TextStyle(
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      decoration: TextDecoration.underline),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
