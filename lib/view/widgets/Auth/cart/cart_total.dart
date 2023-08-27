import 'package:e_commercy_app/logic/controller/cart_controller.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextUtils(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          text: 'Total'),
                      Text(
                        '\$ ${controller.total}',
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 0,
                            backgroundColor:
                                Get.isDarkMode ? pinkClr : mainColor),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Check Out',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.shopping_cart,
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
