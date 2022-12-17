import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/logic/bloc/cart_items_bloc.dart';
import 'package:hermes_marketplace/logic/check_out_logic.dart';
import 'package:hermes_marketplace/logic/order_history_logic.dart';
import 'package:hermes_marketplace/objects/history_object.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/widgets/custom_search_delegate.dart';

class CheckoutBloc extends StatefulWidget {
  const CheckoutBloc({Key? key}) : super(key: key);

  @override
  State<CheckoutBloc> createState() => _CheckoutBlocState();
}

class _CheckoutBlocState extends State<CheckoutBloc> {
  int quantity = 1;
  double total = 0.0;

  void _increment() {
    setState(() {
      quantity+=1;
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 1){
        quantity-=1;
      }
    });
  }

  Widget checkoutListBuilder(snapshot) {
    total = 0.0;
    List list = snapshot.data["cart items"];
    for (var element in list) {
      total += double.parse(element['price']);
    }

    return ListView.builder(
      itemCount: snapshot.data["cart items"].length,
      itemBuilder: (BuildContext context, i) {
        final cartList = snapshot.data["cart items"];
          quantity = cartList[i]['quantity'];
        return ListTile(
          title: Text(cartList[i]['name'] , maxLines: 2, overflow: TextOverflow.ellipsis,),
          leading: Image.network(cartList[i]['networkImage']),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // add and remove quantity
              Row(
                children: [

                  Text(' Quantity: $quantity' , style: const TextStyle(color: textColor, fontWeight: FontWeight.bold),),

                ],
              ),
              // price
              Row(
                children: [
                  Text("\$${cartList[i]['price']}" , style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.remove_shopping_cart, color: Colors.red,),
            onPressed: () {
              bloc.removeFromCart(cartList[i]);
            },
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Checkout' , style: TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {
          return snapshot.data['cart items'].length > 0
              ? Column(
            children: <Widget>[
              /// The [checkoutListBuilder] has to be fixed
              /// in an expanded widget to ensure it
              /// doesn't occupy the whole screen and leaves
              /// room for the the RaisedButton
              Expanded(child: checkoutListBuilder(snapshot)),
              // Here we calculate the total and display it
              const Divider(),
              Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.height/80),
                child: Row(
                  children: [
                    const Expanded(flex: 1, child: Text('Total ( No Tax or delivery)' , style: TextStyle(color: textColor, fontWeight: FontWeight.bold),)),
                    Text('CAD\$$total'  , style: const TextStyle(color: textColor, fontSize: 20))
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final checkoutProducts = snapshot.data['cart items'];
                  String result = '';
                  double total = 0.0;
                  // add product to history
                  for (var value in checkoutProducts){
                    result = '$result , ${value['amazonLink']}';
                    OrderHistoryLogic.addNewProduct(HistoryObject(id: Random().nextInt(1000000),
                        product: Product(
                            name: value['name'], description:  value['description'],
                            networkImage: [value['networkImage']], price:  value['price'],
                            quantity:   value['quantity'], source:  value['source'],
                            amazonLink:  value['amazonLink'])
                    ));
                  }

                  // 'id' : id,
                  // 'name': product.name,
                  // 'description' : product.description,
                  // 'networkImage' : product.networkImage,
                  // 'price': product.price,
                  // 'quantity' : product.quantity,
                  // 'source' : product.source,
                  // 'amazonLink' : product.amazonLink

                  // CheckOutLogic.sendCheckOutData(result);
                  bloc.emptyCart();
                  //call scaffold to inform the user of the change
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Items have been added to order history')));
                  setState(() {});

                  // call dialog box thanking for patronage
                  showDialog(context: context, builder: (context) => const AlertDialog(
                    backgroundColor: dialogBoxBackgroundColor,
                    content: Text('The items in your cart have been added to your amazon cart. Please go to your amazon cart to complete the purchase.\n\n\nWe thank you for your patronage. :)' ,
                      style: TextStyle(color: textColor),
                    ),
                  ));
                },
                child: const Text("Checkout"),
              ),
              const SizedBox(height: 40)
            ],
          )
              : const Center(child: Text("You haven't taken any item yet"));
        },
      ),
    );
  }
}
