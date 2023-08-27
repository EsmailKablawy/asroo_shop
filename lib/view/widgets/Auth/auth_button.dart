import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/them.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(360, 50),
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: onPressed,
      child: TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          text: text),
    );
  }
}
