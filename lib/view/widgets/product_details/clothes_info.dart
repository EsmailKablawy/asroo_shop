import 'package:e_commercy_app/logic/controller/product_controller.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:e_commercy_app/view/widgets/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';

class clothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;
  clothesInfo(
      {required this.rate,
      required this.description,
      required this.title,
      required this.productId,
      super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(() => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? Colors.white.withOpacity(0.9)
                            : Colors.grey.withOpacity(0.4),
                        shape: BoxShape.circle),
                    child: InkWell(
                      onTap: () {
                        controller.manageFavourites(productId);
                      },
                      child: controller.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            TextUtils(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                text: '$rate '),
            RatingBar.builder(
              itemSize: 22,
              initialRating: rate,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.orangeAccent,
              ),
              onRatingUpdate: (rating) {},
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLength: 3,
            trimLines: 2,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
