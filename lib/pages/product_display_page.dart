import 'package:flutter/material.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/logic/cart_provider.dart';
import 'package:hermes_marketplace/objects/cart.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/persistence/db_helper.dart';
import 'package:hermes_marketplace/persistence/fake_database.dart';
import 'package:provider/provider.dart';

class ProductDisplay extends StatefulWidget {
  final Product product;
  final int productIndex;

  const ProductDisplay({Key? key ,  required this.product, required this.productIndex}) : super(key: key);

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  int pageIndex = 0;
  int quantity = 1;
  DbHelper dbHelper = DbHelper();
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

    final cart = Provider.of<CartProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List images = widget.product.networkImage;

    List<Widget> widgets = [];

    for (var value in images) {
      widgets.add(Image.network(value));
    }//end images

    void saveData(int index) {
      ValueNotifier<int> valueNotifier = ValueNotifier(products[index].quantity);
      dbHelper.insert(
          Cart(
              id: index, productId: index.toString(),
              productName: products[index].name, initialPrice: double.parse(products[index].price),
              productPrice: double.parse(products[index].price), quantity: ValueNotifier(1),
              amazonLink: products[index].amazonLink, image: products[index].networkImage[0]
          )
      ).then((value) {
        cart.addTotalPrice(double.parse(products[index].price));
        cart.addCounter();
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('There was an error $error, \n stack trace $stackTrace'))
        );
      });
    }//end save data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product display' , style: TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
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
                      widget.product.incrementQuantity();
                    },
                    icon: const Icon(Icons.add)
                ),
                Container(decoration: const BoxDecoration(shape: BoxShape.rectangle,), child: Text('$quantity'),),
                IconButton(
                    onPressed: (){
                      //decrement the amount
                      if (quantity > 1) {
                        _decrement();
                        widget.product.decrementQuantity();
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
                      saveData(widget.productIndex);
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
