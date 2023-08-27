import 'package:e_commercy_app/model/product_models.dart';
import 'package:e_commercy_app/services/category_services.dart';
import 'package:get/get.dart';

class CatogeryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;
  var isCatogeryLoading = false.obs;
  var isAllCatogeryLoading = true.obs;

  List<String> imagecatogery = [
    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var catogryName = await CategoryServices.getCategory();
    try {
      isCatogeryLoading(true);
      if (catogryName.isNotEmpty) {
        categoryNameList.addAll(catogryName);
      }
    } finally {
      isCatogeryLoading(false);
    }
  }

  //اضافه المنتجات داخل الكاتوجرى
  getAllCategorys(String nameCatogery) async {
    isAllCatogeryLoading(true);
    categoryList.value = await AllCategoryServices.getAllCategory(nameCatogery);

    isAllCatogeryLoading(false);
  }

  getAllCategorysIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value =
          categoryAllName; //معملناش get all لاننا بيعمل مشكله وبيضيف كل منتج ادوس على الكاتوجرى بتاعو
    }
  }
}
