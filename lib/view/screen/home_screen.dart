import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/card_items.dart';
import '../widgets/home/search_textform.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextUtils(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      text: 'Find Your'),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextUtils(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      text: 'INSPIRATION'),
                  const SizedBox(
                    height: 20,
                  ),
                  SerchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  text: 'Categories'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CardItems(),
        ],
      ),
    ));
  }
}
