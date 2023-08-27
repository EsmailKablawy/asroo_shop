import 'package:e_commercy_app/model/product_models.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_details/add_cart.dart';
import '../widgets/product_details/clothes_info.dart';
import '../widgets/product_details/image_sliders.dart';
import '../widgets/product_details/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({required this.productModels, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //backgroundColor: context.theme.backgroundColor,
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,

      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Imagesliders(
            imageUrl: productModels.image,
          ),
          clothesInfo(
            description: productModels.description,
            rate: productModels.rating.rate,
            productId: productModels.id,
            title: productModels.title,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
              child: Text(
                'Choose A Size',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  decoration: TextDecoration.underline,
                ),
              )),
          const SizeList(),
          AddCart(
            productModels: productModels,
            price: productModels.price,
          ),
        ]),
      ),
    ));
  }
}
