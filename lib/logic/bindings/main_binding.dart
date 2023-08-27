import 'package:e_commercy_app/logic/controller/main_controller.dart';
import 'package:get/get.dart';

import '../controller/setting_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Maincontroller());
    Get.put(SettingController());
  }
}
