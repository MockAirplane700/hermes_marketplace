class Product {
  final String name;
  final String description;
  final List<dynamic> networkImage;
  final String price;
  late final int quantity;
  final String source;
  final String amazonLink;

  Product({
    required this.name, required this.description, required this.networkImage,
    required this.price, required this.quantity, required this.source, required this.amazonLink
  });

  void incrementQuantity() {
    quantity +=1;
  }

  void decrementQuantity() {
    quantity -=1;
  }

  Map toJson() {
    return {
      'name':name,
      'description': description,
      'images':networkImage,
      'price':price,
      'quantity':quantity,
      'source': source,
      'link':amazonLink
    };
  }//end to json


}//end products