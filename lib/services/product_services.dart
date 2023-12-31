import 'package:e_commercy_app/utils/my_string.dart';
import 'package:http/http.dart' as http;

import '../model/product_models.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      //-> الرقم 200 يعنيان الابي اي صحيح و سليم
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load Product');
    }
  }
}
