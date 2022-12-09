import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/persistence/fake_database.dart';

class Products {

  static List<Product> fetchProducts() {
    return FakeDatabase.getProducts();
  }

}//end class