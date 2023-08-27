import 'package:e_commercy_app/logic/controller/cart_controller.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/Auth/cart/cart_product_card.dart';
import '../widgets/Auth/cart/cart_total.dart';
import '../widgets/Auth/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            appBar: AppBar(
              title: const Text('Cart Items'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
              actions: [
                IconButton(
                    onPressed: () {
                      controller.clearAllPriuducts();
                    },
                    icon: const Icon(Icons.backspace))
              ],
            ),
            body: Obx(() {
              if (controller.productsMap.isEmpty) {
                return EmptyCart();
              } else {
                return Container(
                  child: Column(children: [
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        height: 600,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                quantity: controller.productsMap.values
                                    .toList()[index],
                                index: index,
                                productModels:
                                    controller.productsMap.keys.toList()[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: controller.productsMap.length),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: CartTotal(),
                      ),
                    )
                  ]),
                );
              }
            })));
  }
}
