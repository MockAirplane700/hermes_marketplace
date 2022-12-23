class MarketPlace {
  final String name;
  final String description;
  final double price;
  final String image;
  final List<dynamic> size;
  final String storeName;
  final String storeDescription;
  final String storeLocation;
  final String storeImage;
  final String storeEmail;

  MarketPlace({
    required this.name, required this.description, required this.price,
    required this.image, required this.size, required this.storeName,
    required this.storeDescription, required this.storeLocation,
    required this.storeImage, required this.storeEmail
});

  Map<String,dynamic> toJson() {
    return {
      'name' : name,
      'description' : description,
      'price': price ,
      'image' : image,
      'size' : size,
      'storeName' : storeName,
      'storeDescription' : storeDescription,
      'storeLocation' : storeLocation,
      'storeImage' : storeImage,
      'storeEmail' : storeEmail
    };
  }

}