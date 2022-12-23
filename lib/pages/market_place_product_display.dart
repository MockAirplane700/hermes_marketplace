import 'package:flutter/material.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/logic/bloc/cart_items_bloc.dart';
import 'package:hermes_marketplace/objects/market_place.dart';
import 'package:hermes_marketplace/widgets/custom_search_delegate.dart';
import 'package:hermes_marketplace/widgets/custom_search_delegate_market_place.dart';
import 'package:share_plus/share_plus.dart';


class MarketplaceProductDisplayPage extends StatefulWidget {
  final MarketPlace marketPlace;

  const MarketplaceProductDisplayPage({Key? key , required this.marketPlace}) : super(key: key);

  @override
  State<MarketplaceProductDisplayPage> createState() => _MarketplaceProductDisplayPageState();
}

class _MarketplaceProductDisplayPageState extends State<MarketplaceProductDisplayPage> {
  int quantity = 1;
  int pageIndex = 0;

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

    List images = [widget.marketPlace.image, widget.marketPlace.image,widget.marketPlace.image];

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
                showSearch(context: context, delegate: MySearchDelegateMarketPlace());
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
            Text(widget.marketPlace.name , style: const TextStyle(color: textColor, fontSize: 12),),
            // share the product
            Padding(
              padding: EdgeInsets.all(width/80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Share.share('Check out ${widget.marketPlace.name} on the hermes market place app!\n'
                            'https://www.sizibamthandazo.dev');
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
            // price
            SizedBox(height: height/80,),
            Row(
              children: [
                SizedBox(width: width/100,),
                Text('CAD\$${widget.marketPlace.price.toStringAsFixed(2)}' , style: const TextStyle(color: textColor, fontSize: 25),),
              ],
            ),
            // the product description
            Padding(padding: EdgeInsets.all(width/50), child: Card(
              color: cardBackgroundColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width/80)),
              elevation: 5,
              child: Padding(padding: EdgeInsets.all(width/80), child: Text(widget.marketPlace.description),),
            ),),
            // // the social network we found it on
            // Padding(padding: EdgeInsets.all(width/80), child: Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(onPressed: () {
            //       // link to tiktok source
            //     }, icon: const Icon(Icons.people))
            //   ],
            // ) ,),
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
                      double resultPrice = widget.marketPlace.price* quantity;
                      bloc.addToCart({
                        'name' : widget.marketPlace.name,
                        'description' : widget.marketPlace.description,
                        'price' : resultPrice.toString(),
                        'source': widget.marketPlace.storeLocation,
                        'networkImage':widget.marketPlace.image,
                        'quantity' : quantity,
                        'amazonLink':'no link',
                        'asin':'no asin',
                        'type':'market'
                      }, context);

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
