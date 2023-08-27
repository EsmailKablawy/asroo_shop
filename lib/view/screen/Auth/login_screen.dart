import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../routes/routs.dart';
import '../../../utils/my_string.dart';
import '../../../utils/them.dart';
import '../../widgets/Auth/auth_button.dart';
import '../../widgets/Auth/auth_text-fromfield.dart';
import '../../widgets/Auth/container_under.dart';
import '../../widgets/text_util.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final fromkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  //final controller = Get.put(AuthController());
  final controller = Get.find<AuthController>();

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
                              text: 'Log'),
                          const SizedBox(
                            width: 3,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              text: 'In')
                        ],
                      ),
                      const SizedBox(
                        height: 50,
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
                                      color: Colors.black,
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

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ForgetPassweordScreen);
                            },
                            child: TextUtils(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                text: 'Forget Password?')),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      GetBuilder<AuthController>(
                        builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (fromkey.currentState!.validate()) {
                                String email = emailcontroller.text.trim();
                                String password = passwordcontroller.text;
                                controller.logInUsingFirebasw(
                                    email: email, password: password);
                              }
                            },
                            text: 'Log In',
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          text: 'OR'),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset('assets/images/facebook.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return InkWell(
                                  onTap: () {
                                    controller.googleSignUpUsingFirebasw();
                                  },
                                  child:
                                      Image.asset('assets/images/google.png'));
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ContainerUnder(
              text2: 'Sign Up',
              onPressed: () {
                Get.offNamed(Routes.SignUpScreen);
              },
              text: "Don't have an Account?",
            ),
          ],
        ),
      ),
    ));
  }
}
