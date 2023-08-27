import 'package:e_commercy_app/logic/controller/cart_controller.dart';
import 'package:e_commercy_app/model/product_models.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;

  AddCart({required this.price, required this.productModels, super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    text: 'price'),
                Text(
                  '\$$price',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                )
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Add to cart',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.shopping_cart_outlined)
                      ],
                    )),
              )),
        ],
      ),
    );
  }
}
