import 'package:e_commercy_app/logic/controller/main_controller.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/routs.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<Maincontroller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.CartScreen);
                },
                icon: Image.asset('assets/images/shop.png')),
          ],
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category_outlined,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category_outlined,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite_border,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
