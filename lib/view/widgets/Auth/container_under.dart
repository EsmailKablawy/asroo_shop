import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/them.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String text2;
  final Function() onPressed;
  const ContainerUnder(
      {required this.text,
      required this.onPressed,
      required this.text2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? pinkClr : mainColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              text: text),
          TextButton(
              onPressed: onPressed,
              child: Text(
                '$text2',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
