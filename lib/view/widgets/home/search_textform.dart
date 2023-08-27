import 'package:e_commercy_app/logic/controller/product_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SerchFormText extends StatelessWidget {
  SerchFormText({super.key});
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return TextField(
          controller: controller.searchTextController,
          onChanged: (searchName) {
            controller.addSearchToList(searchName);
          },
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: controller.searchTextController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      controller.clearSearch();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ))
                : null,
            hintText: "Serch With name and price",
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        );
      },
    );
  }
}
