import 'package:hermes_marketplace/objects/market_place.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/persistence/fake_database.dart';

class Products {

  static List<Product> fetchProducts() {
    return FakeDatabase.getProducts();
  }

  static List<MarketPlace> getMarketPlaceProducts() {
    return [
      MarketPlace(
          name: ' Omni FEEL ME 100% Kanekalon Box Braid - MEDIUM 24',
          description: 'Braids something something',
          price: 25.00,
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/box%20braids.jpg?alt=media&token=964d3214-fb76-4f74-a2a0-f706472d09d8',
          size: ['S' , 'M' , 'L'],
          storeName: 'Get Braids IO',
          storeDescription: 'Still wearing her blue nurse\'s uniform, Virginia Mutsamwira collected the day\'s takings in the grocery store she runs in her house near the capital, Harare, before going to feed the chickens and rabbits: given her salary, she has no choice but to undertake several odd jobs. However, at 52, Virginia has just returned from a grueling 12-hour shift at a clinic in Cold Comfort, a poor neighborhood near Harare. She said that there she treats four times more patients than the ideal number',
          storeLocation: 'Gweru, Zimbabwe',
          storeImage: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/storeImage.jpg?alt=media&token=e0cc4233-392d-4c4f-8922-bd3a13a15984',
          storeEmail: 'mthandazo99@gmail.com') ,
      MarketPlace(
          name: ' Omni FEEL ME 100% Kanekalon Box Braid - MEDIUM 24',
          description: 'Braids something something',
          price: 25.00,
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/box%20braids.jpg?alt=media&token=964d3214-fb76-4f74-a2a0-f706472d09d8',
          size: ['S' , 'M' , 'L'],
          storeName: 'Get Braids IO',
          storeDescription: 'Still wearing her blue nurse\'s uniform, Virginia Mutsamwira collected the day\'s takings in the grocery store she runs in her house near the capital, Harare, before going to feed the chickens and rabbits: given her salary, she has no choice but to undertake several odd jobs. However, at 52, Virginia has just returned from a grueling 12-hour shift at a clinic in Cold Comfort, a poor neighborhood near Harare. She said that there she treats four times more patients than the ideal number',
          storeLocation: 'Gweru, Zimbabwe',
          storeImage: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/storeImage.jpg?alt=media&token=e0cc4233-392d-4c4f-8922-bd3a13a15984',
          storeEmail: 'mthandazo99@gmail.com') ,
      MarketPlace(
          name: ' Omni FEEL ME 100% Kanekalon Box Braid - MEDIUM 24',
          description: 'Braids something something',
          price: 25.00,
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/box%20braids.jpg?alt=media&token=964d3214-fb76-4f74-a2a0-f706472d09d8',
          size: ['S' , 'M' , 'L'],
          storeName: 'Get Braids IO',
          storeDescription: 'Still wearing her blue nurse\'s uniform, Virginia Mutsamwira collected the day\'s takings in the grocery store she runs in her house near the capital, Harare, before going to feed the chickens and rabbits: given her salary, she has no choice but to undertake several odd jobs. However, at 52, Virginia has just returned from a grueling 12-hour shift at a clinic in Cold Comfort, a poor neighborhood near Harare. She said that there she treats four times more patients than the ideal number',
          storeLocation: 'Gweru, Zimbabwe',
          storeImage: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/storeImage.jpg?alt=media&token=e0cc4233-392d-4c4f-8922-bd3a13a15984',
          storeEmail: 'mthandazo99@gmail.com') ,
      MarketPlace(
          name: ' Omni FEEL ME 100% Kanekalon Box Braid - MEDIUM 24',
          description: 'Braids something something',
          price: 25.00,
          image: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/box%20braids.jpg?alt=media&token=964d3214-fb76-4f74-a2a0-f706472d09d8',
          size: ['S' , 'M' , 'L'],
          storeName: 'Get Braids IO',
          storeDescription: 'Still wearing her blue nurse\'s uniform, Virginia Mutsamwira collected the day\'s takings in the grocery store she runs in her house near the capital, Harare, before going to feed the chickens and rabbits: given her salary, she has no choice but to undertake several odd jobs. However, at 52, Virginia has just returned from a grueling 12-hour shift at a clinic in Cold Comfort, a poor neighborhood near Harare. She said that there she treats four times more patients than the ideal number',
          storeLocation: 'Gweru, Zimbabwe',
          storeImage: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/storeImage.jpg?alt=media&token=e0cc4233-392d-4c4f-8922-bd3a13a15984',
          storeEmail: 'mthandazo99@gmail.com') ,

    ];
  }

}//end class