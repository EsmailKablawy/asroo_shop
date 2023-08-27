import 'package:e_commercy_app/logic/controller/auth_controller.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/Auth/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/my_string.dart';
import '../../widgets/Auth/auth_text-fromfield.dart';

class ForgetPassweordScreen extends StatelessWidget {
  ForgetPassweordScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  )),
              title: Text(
                'Forgot Password',
                style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
              ),
            ),
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            body: Form(
              key: formkey,
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'if you want to recover tour accont , then pleas provide your email Id blow..',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/forgetpass.png',
                      width: 250,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFormField(
                      controller: emailcontroller,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Get.isDarkMode
                          ? const Icon(
                              Icons.email,
                              color: pinkClr,
                              size: 30,
                            )
                          : Image.asset('assets/images/email.png'),
                      suffix: const Text(''),
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) {
                        return AuthButton(
                            text: "SEND",
                            onPressed: () {
                              String email = emailcontroller.text.trim();
                              if (formkey.currentState!.validate()) {
                                controller.resetPassword(email);
                              }
                            });
                      },
                    )
                  ],
                ),
              )),
            )));
  }
}
