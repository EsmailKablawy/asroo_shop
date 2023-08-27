import 'package:e_commercy_app/logic/controller/cart_controller.dart';
import 'package:e_commercy_app/logic/controller/product_controller.dart';
import 'package:e_commercy_app/routes/routs.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/screen/product_details_screen.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../model/product_models.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
          color: Get.isDarkMode ? pinkClr : mainColor,
        ));
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset('assets/images/search_empty_dark.png')
                  : Image.asset('assets/images/search_empry_light.png')
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 9.0,
                      mainAxisExtent: 200),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                          title: controller.productList[index].title,
                          image: controller.productList[index].image,
                          price: controller.productList[index].price,
                          rate: controller.productList[index].rating.rate,
                          productId: controller.productList[index].id,
                          productModels: controller.productList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.productList[index],
                                ));
                          });
                    } else {
                      return buildCardItems(
                          title: controller.searchList[index].title,
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rate: controller.searchList[index].rating.rate,
                          productId: controller.searchList[index].id,
                          productModels: controller.searchList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.productList[index],
                                ));
                          });
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required String title,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: Get.isDarkMode ? 0 : 1,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Get.isDarkMode
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.white,
                )
              ]),
          child: Column(
            children: [
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            controller.manageFavourites(productId);
                          },
                          child: controller.isFavourites(productId)
                              ? Icon(
                                  Icons.favorite,
                                  color:
                                      Get.isDarkMode ? Colors.red : Colors.red,
                                )
                              : Icon(
                                  Icons.favorite_border_outlined,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                )),
                      InkWell(
                        onTap: () {
                          cartController.addProductToCart(productModels);
                          Get.snackbar('Product added', '',
                              duration: const Duration(seconds: 1),
                              backgroundColor: Colors.grey[700],
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          children: [
                            TextUtils(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                text: '$rate'),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
