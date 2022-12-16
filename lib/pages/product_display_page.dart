import 'package:flutter/material.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/logic/bloc/cart_items_bloc.dart';
import 'package:hermes_marketplace/objects/cart.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/persistence/fake_database.dart';
import 'package:hermes_marketplace/widgets/custom_search_delegate.dart';
import 'package:provider/provider.dart';

class ProductDisplay extends StatefulWidget {
  final Product product;

  const ProductDisplay({Key? key ,  required this.product,}) : super(key: key);

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  int pageIndex = 0;
  int quantity = 1;
  List<Product> products = FakeDatabase.getProducts();

  void _increment() {
    setState(() {
      quantity +=1;
    });
  }

  void _decrement() {
    setState(() {
      quantity -=1;
    });
  }

  @override
  Widget build(BuildContext context) {

    // final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List images = widget.product.networkImage;

    List<Widget> widgets = [];

    for (var value in images) {
      widgets.add(Image.network(value));
    }//end images

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product display' , style: TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        actions: [
          IconButton(
              onPressed: (){
                // go to search
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // the name product
            SizedBox(
              height: height/100,
            ),
            Text(widget.product.name , style: const TextStyle(color: textColor, fontSize: 12),),
            // share the product
            Padding(
              padding: EdgeInsets.all(width/80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(Icons.share)
                  )
                ],
              ),
            ),
            // the slide show of images of the product each one opens a dialog to view it
            SizedBox(
              height: height/2,
              width: width,
              child: PageView(
                children: widgets,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
            ),
            // the product description
            Padding(padding: EdgeInsets.all(width/50), child: Card(
              color: cardBackgroundColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width/80)),
              elevation: 5,
              child: Padding(padding: EdgeInsets.all(width/80), child: Text(widget.product.description),),
            ),),
            // the social network we found it on
            Padding(padding: EdgeInsets.all(width/80), child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {
                  // link to tiktok source
                }, icon: const Icon(Icons.people))
              ],
            ) ,),
            // price
            Row(
              children: [
                SizedBox(width: width/100,),
                Text('\$${widget.product.price}' , style: const TextStyle(color: textColor, fontSize: 25),),
              ],
            ),
            // quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      // add to the quantity by 1
                      _increment();
                    },
                    icon: const Icon(Icons.add)
                ),
                Container(decoration: const BoxDecoration(shape: BoxShape.rectangle,), child: Text('$quantity'),),
                IconButton(
                    onPressed: (){
                      //decrement the amount
                      if (quantity > 1) {
                        _decrement();
                      }
                    },
                    icon: const Icon(Icons.remove)
                )
              ],
            ),
            // add to cart
            Row(
              children: [
                Expanded(child: ElevatedButton(
                    onPressed: (){
                      //add to cart
                      double resultPrice = double.parse(widget.product.price) * quantity;
                      bloc.addToCart({
                        'name' : widget.product.name,
                        'price' : resultPrice.toString(),
                        'image':widget.product.networkImage[0],
                        'quantity' : quantity,
                        'amazonLink':widget.product.amazonLink
                      }, context
                      );
                    },
                    child: const Text('Add to cart')
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
