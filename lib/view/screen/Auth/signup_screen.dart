import 'package:e_commercy_app/logic/controller/auth_controller.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../routes/routs.dart';
import '../../../utils/my_string.dart';
import '../../../utils/them.dart';
import '../../widgets/Auth/auth_button.dart';
import '../../widgets/Auth/auth_text-fromfield.dart';
import '../../widgets/Auth/check_widget.dart';
import '../../widgets/Auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  final fromkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  //final controller = Get.put(AuthController());
  final controller = Get.find<AuthController>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 40,
                ),
                child: Form(
                  key: fromkey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              text: 'Sign'),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              text: 'Up')
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //user name
                      AuthTextFormField(
                        controller: namecontroller,
                        obscureText: false,
                        validator: (value) {
                          if (value.toString().length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter Valid Name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Get.isDarkMode
                            ? const Icon(
                                Icons.person,
                                color: pinkClr,
                                size: 30,
                              )
                            : Image.asset('assets/images/user.png'),
                        suffix: const Text(''),
                        hintText: 'User Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //email
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
                      //password
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthTextFormField(
                            controller: passwordcontroller,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? const Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                : Image.asset('assets/images/lock.png'),
                            suffix: InkWell(
                              onTap: () {
                                controller.visibility();
                              },
                              child: controller.isVisibilty
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: 'Password',
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar(
                                  'Check Box',
                                  'Please, Accept terms & conditions',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                );
                              } else if (fromkey.currentState!.validate()) {
                                String name = namecontroller.text.trim();
                                String email = emailcontroller.text.trim();
                                String password = passwordcontroller.text;
                                //photo

                                controller.signUpUsingFirebasw(
                                    name: name,
                                    email: email,
                                    password: password);
                                controller.isCheckBox = true;
                              }
                            },
                            text: 'Sign Up',
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              onPressed: () {
                Get.offNamed(Routes.LogInScreen);
              },
              text: 'Alredy have an Account? ',
              text2: 'Log In',
            ),
          ],
        ),
      ),
    ));
  }
}
