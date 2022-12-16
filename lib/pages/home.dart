import 'package:flutter/material.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/logic/products.dart';
import 'package:hermes_marketplace/logic/search_delegate_logic.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/pages/product_display_page.dart';
import 'package:hermes_marketplace/widgets/custom_navigation_drawer.dart';
import 'package:hermes_marketplace/widgets/custom_search_delegate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Product>  list = Products.fetchProducts();
    SearchDelegateLogic.setSearchList(list);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
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
      drawer: const CustomDrawer(),
      body: Center(child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(list.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDisplay(product: list[index])));
              },
              child: Card(
                color: cardBackgroundColor,
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width/50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded( flex: 5,child: Image.network(list[index].networkImage[0])),
                    SizedBox(height: height/80,),
                    Expanded( flex: 2,child: Row(
                      children: [
                        SizedBox(width: width/80,),
                        Expanded(child: Text(list[index].name , style: const TextStyle(color: textColor, fontSize: 14),))
                      ],
                    )),
                    SizedBox(height: height/80,),
                    Expanded( flex: 1,child: Row(
                      children: [
                        SizedBox(width: width/80,),
                        Text('\$${list[index].price}' , style: const TextStyle(color: textColor, fontSize: 20),)
                      ],
                    )),
                  ],
                ),
              ),
            );
          }),
      )),
    );
  }
}
