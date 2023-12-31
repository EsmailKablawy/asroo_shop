import 'package:e_commercy_app/logic/controller/cart_controller.dart';
import 'package:e_commercy_app/model/product_models.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;
  CartProductCard(
      {required this.productModels,
      required this.index,
      required this.quantity});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.7)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(productModels.image),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${controller.ProductSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeProductsFormCart(productModels);
                      },
                      icon: const Icon(Icons.remove_circle),
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.addProductToCart(productModels);
                      },
                      icon: const Icon(Icons.add_circle),
                      color: Get.isDarkMode ? Colors.white : Colors.black)
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProducts(productModels);
                },
                icon: Icon(Icons.delete),
                iconSize: 20,
                color: Get.isDarkMode ? Colors.black : Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
