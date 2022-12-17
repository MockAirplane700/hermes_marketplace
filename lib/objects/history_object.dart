import 'package:hermes_marketplace/objects/product.dart';

class HistoryObject {

  final int id;
  final Product product;


  HistoryObject({required this.id, required this.product});

  // (id INTEGER PRIMARY KEY autoincrement, name TEXT, description TEXT, networkImage TEXT, price TEXT, quantity INTEGER, source TEXT, amazonLink TEX

  Map<String , dynamic> toMap() {
    return {
      'id' : id,
      'name': product.name,
      'description' : product.description,
      'networkImage' : product.networkImage[0],
      'price': product.price.toString(),
      'quantity' : int.parse(product.quantity.toString()),
      'source' : product.source,
      'amazonLink' : product.amazonLink
    };
  }//end to map
}