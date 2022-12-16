import 'package:flutter/material.dart';
import 'package:hermes_marketplace/logic/bloc/cart_items_bloc.dart';

class ShopItems extends StatelessWidget {
  const ShopItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hermes market place'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
          )
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  const ShopItemsWidget({super.key});


  Widget shopItemsListBuilder(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data["shop items"].length,
      itemBuilder: (BuildContext context, i) {
        final shopList = snapshot.data["shop items"];
        return ListTile(
          title: Text(shopList[i]['name']),
          subtitle: Text("\$${shopList[i]['price']}"),
          trailing: IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            onPressed: () {
              bloc.addToCart(shopList[i], context);
            },
          ),
          onTap: () {},
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return shopItemsListBuilder(snapshot);
        } else {
          return const Center(child: Text("All items in shop have been taken"));
        }
      },
    );
  }
}