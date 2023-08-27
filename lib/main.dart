import 'package:e_commercy_app/logic/controller/theme_controller.dart';
import 'package:e_commercy_app/routes/routs.dart';
import 'package:e_commercy_app/utils/my_string.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/screen/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'language/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Asroo Shop',
        debugShowCheckedModeBanner: false,
        locale: Locale(GetStorage().read<String>('lang').toString()),
        fallbackLocale: Locale(ene),
        translations: LocalizationApp(),
        theme: themsApp.light,
        darkTheme: themsApp.dark,
        themeMode: ThemController().ThemDataGet,
        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>('auth') == true
            ? AppRoutes.mainScreen
            : AppRoutes.welcome,
        getPages: AppRoutes.routes);
  }
}
