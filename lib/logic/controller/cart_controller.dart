import 'package:e_commercy_app/model/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels ProductModels) {
    if (productsMap.containsKey(ProductModels)) {
      productsMap[ProductModels] += 1;
    } else {
      productsMap[ProductModels] = 1;
    }
  }

  void removeProductsFormCart(ProductModels ProductModels) {
    if (productsMap.containsKey(ProductModels) &&
        productsMap[ProductModels] == 1) {
      productsMap.removeWhere((key, value) =>
          key ==
          ProductModels); //فيما معناه اول حاجه اوجد الكي ثانيا لما تبقا ب واحد اعمل ريموف
    } else {
      productsMap[ProductModels] -= 1;
    }
  }

  removeOneProducts(ProductModels ProductModels) {
    productsMap.removeWhere((key, value) => key == ProductModels);
  }

  void clearAllPriuducts() {
    Get.defaultDialog(
        backgroundColor: Colors.grey[800],
        title: '',
        middleText: 'Are you sure you need clear products?',
        middleTextStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        textCancel: 'No',
        textConfirm: 'Yes',
        cancelTextColor: Colors.red,
        confirmTextColor: Colors.white,
        buttonColor: Colors.black,
        onConfirm: () {
          productsMap.clear();
          Get.back();
        });
  }

  get ProductSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
