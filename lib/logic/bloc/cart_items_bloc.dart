import 'dart:async';

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final Map allItems = {
    'shop items' : [
      {'name': 'App dev kit', 'price': 20, 'id': 1},
      {'name': 'App consultation', 'price': 100, 'id': 2},
      {'name': 'Logo Design', 'price': 10, 'id': 3},
      {'name': 'Code review', 'price': 90, 'id': 4},
    ],
    'cart items' : []
  };

  void addToCart(item) {
    /// update the [stock_quantity] of the object
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }//end add to cart

  void removeFromCart(item) {
    /// update the [stock_quantity] of the object
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }//end remove from cart

  void dispose() {
    cartStreamController.close();
  }
}


final bloc = CartItemsBloc(); // EOF