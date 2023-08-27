import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commercy_app/routes/routs.dart';
import 'package:e_commercy_app/utils/them.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'color_picker.dart';

class Imagesliders extends StatefulWidget {
  final String imageUrl;
  const Imagesliders({required this.imageUrl, super.key});

  @override
  State<Imagesliders> createState() => _ImageslidersState();
}

class _ImageslidersState extends State<Imagesliders> {
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor1,
    kCOlor2,
    kCOlor3,
  ];
  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentcolor = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
            height: 450,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(25)),
            );
          },
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotColor: Colors.black),
            )),
        //ملهاش اى لازمه
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30)),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentcolor = index;
                      });
                    },
                    child: ColorPicker(
                      color: colorSelected[index],
                      outerBorder: currentcolor == index,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 3,
                  );
                },
                itemCount: colorSelected.length),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? pinkClr.withOpacity(0.8)
                        : mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.CartScreen),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? pinkClr.withOpacity(0.8)
                        : mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
