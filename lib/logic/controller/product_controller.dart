import 'package:e_commercy_app/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/product_models.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs; //stream..
  var favouritesList = <ProductModels>[].obs;
  //Search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  var isLoading = true.obs;
  var storge = GetStorage();

  @override
  void onInit() {
    super.onInit();
    //save favorite_logic
    List? storedShoppings = storge.read<List>('isFavouritesList');
    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      //isLoading.value = true;
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //Logic For Favourites Screen
  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storge.remove('isFavouritesList');
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storge.write('isFavouritesList', favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  //Search Bar Logic
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase(); //حولهالي ل اسمول

    searchList.value = productList.where((search) {
      var searchTitle =
          search.title.toLowerCase(); //عشان احولها ل اسمول و اعرف اعمل بحث
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList(''); //زياده تأكيد
  }
}
