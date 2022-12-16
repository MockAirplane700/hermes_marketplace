import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  void addToCart(item , BuildContext context) {
    /// update the [stock_quantity] of the object
    // check if the item is already in the cart
    List list = allItems['cart items'];
    bool boolean = false;
    for (var variable in list) {
      if (variable['name'].contains(item['name'])){
        boolean = true;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item is already in the cart')));
        break;
      }
    }//end for loop

    if (!boolean){
      allItems['shop items'].remove(item);
      allItems['cart items'].add(item);
    }
    cartStreamController.sink.add(allItems);
  }//end add to cart

  void removeFromCart(item) {
    /// update the [stock_quantity] of the object
    allItems['cart items'].remove(item);
    cartStreamController.sink.add(allItems);
  }//end remove from cart

  void emptyCart(){
    allItems['cart items'].clear();
  }

  fetchCartContents() {
    return allItems['cart items'];
  }

  void dispose() {
    cartStreamController.close();
  }
}


final bloc = CartItemsBloc(); // EOF