import 'dart:convert';

import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:http/http.dart' as http;
class ApplicationServerDatabase{

  static Future<Product> fetchProducts() async {
    final response = await http.get(Uri.parse(localTestData));

    if (response.statusCode == 200){
      return Product.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to get products');
    }//end if-else

  }// end fetch products

}