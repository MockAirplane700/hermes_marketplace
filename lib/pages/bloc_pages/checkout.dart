import 'package:flutter/material.dart';
import 'package:hermes_marketplace/logic/bloc/cart_items_bloc.dart';

class CheckoutBloc extends StatelessWidget {
  const CheckoutBloc({super.key});


  Widget checkoutListBuilder(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["cart items"].length,
      itemBuilder: (BuildContext context, i) {
        final cartList = snapshot.data["cart items"];
        return ListTile(
          title: Text(cartList[i]['name']),
          subtitle: Text("\$${cartList[i]['price']}"),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () {
              bloc.removeFromCart(cartList[i]);
            },
          ),
          onTap: () {},
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
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
              ElevatedButton(
                onPressed: () {},
                child: Text("Checkout"),
              ),
              SizedBox(height: 40)
            ],
          )
              : Center(child: Text("You haven't taken any item yet"));
        },
      ),
    );
  }
}