// ignore_for_file: constant_identifier_names

import 'package:e_commercy_app/logic/controller/product_controller.dart';
import 'package:e_commercy_app/view/screen/Auth/forgot_password_screen.dart';
import 'package:e_commercy_app/view/screen/Auth/login_screen.dart';
import 'package:e_commercy_app/view/screen/Auth/signup_screen.dart';
import 'package:e_commercy_app/view/screen/cart_screen.dart';
import 'package:e_commercy_app/view/screen/main_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../logic/bindings/auth_binding.dart';
import '../logic/bindings/main_binding.dart';
import '../logic/bindings/product_binding.dart';
import '../view/screen/welcome_screen.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.WelcomeScreen;
  static const mainScreen = Routes.MainScreen;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.WelcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.LogInScreen,
      page: () => LogInScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SignUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.ForgetPassweordScreen,
      page: () => ForgetPassweordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.MainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
      ProductBinding(),
    ]),
    GetPage(name: Routes.CartScreen, page: () => CartScreen(), bindings: [
      AuthBinding(),
      ProductBinding(),
    ]),
  ];
}

class Routes {
  static const WelcomeScreen = '/welcomeScreen';
  static const LogInScreen = '/loginscreen';
  static const SignUpScreen = '/SignUpScreen';
  static const ForgetPassweordScreen = '/ForgetPassweordScreen';
  static const MainScreen = '/MainScreen';
  static const CartScreen = '/CartScreen';
}
