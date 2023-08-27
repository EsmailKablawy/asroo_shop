import 'package:e_commercy_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

import '../model/category_model.dart';
import '../model/product_models.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      //-> الرقم 200 يعنيان الابي اي صحيح و سليم
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load Product');
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(
      String categoryNames) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      //-> الرقم 200 يعنيان الابي اي صحيح و سليم
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load Product');
    }
  }
}
