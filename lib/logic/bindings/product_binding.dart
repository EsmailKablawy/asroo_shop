import 'package:e_commercy_app/logic/controller/cart_controller.dart';
import 'package:e_commercy_app/logic/controller/product_controller.dart';
import 'package:get/get.dart';

import '../controller/catogery_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CatogeryController());
  }
}
