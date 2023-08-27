import 'package:e_commercy_app/view/screen/Auth/login_screen.dart';
import 'package:e_commercy_app/view/screen/Auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../logic/controller/auth_controller.dart';
import '../../routes/routs.dart';
import '../../utils/them.dart';
import '../widgets/text_util.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                      child: TextUtils(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    text: 'Welcome',
                    color: Colors.white,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            text: 'Asroo'),
                        SizedBox(
                          width: 7,
                        ),
                        TextUtils(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            text: 'Shop')
                      ],
                    )),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    onPressed: () {
                      Get.offNamed(Routes.LogInScreen);
                    },
                    child: const TextUtils(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        text: "Get Start")),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        text: 'Dont have any account?'),
                    TextButton(
                        onPressed: () {
                          //Get.off(SignUpScreen());
                          Get.offNamed(Routes.SignUpScreen);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
