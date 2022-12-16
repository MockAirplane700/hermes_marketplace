import 'package:flutter/material.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/pages/product_display_page.dart';
import 'package:hermes_marketplace/persistence/fake_database.dart';
import 'package:hermes_marketplace/widgets/custom_search_delegate.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final List<Product> products = FakeDatabase.getProducts();
  
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              }, 
              icon: const Icon(Icons.search)
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: products.isNotEmpty ? Padding(padding: EdgeInsets.all(height/80) , child: ListView.builder(
          itemBuilder: (context , index) {
            return Card(
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width/70)),
              elevation: 8,
              child: ListTile(
                leading: Image.network(products[index].networkImage[0]),
                title: Text(products[index].name , style: const TextStyle(color: textColor, ),maxLines: 2,overflow: TextOverflow.ellipsis,),
                subtitle: Text('CAD\$${products[index].price}0', style: const TextStyle(color: textColor, fontWeight: FontWeight.bold),),
                trailing: Text(products[index].quantity.toString() , style: const TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 20),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDisplay(product: products[index])));
                },
              ),
            );
          },
        itemCount: products.length,
      ),) : const Center(child: Text('No Present Order history', style: TextStyle(color: textColor),),),
    );
  }
}
