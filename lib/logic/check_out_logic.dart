import 'dart:convert';

import 'package:hermes_marketplace/constants/custom_functions.dart';
import 'package:hermes_marketplace/constants/custom_variables.dart';
import 'package:hermes_marketplace/logic/bloc/cart_items_bloc.dart';
import 'package:http/http.dart' as http;

class CheckOutLogic{
  static Future<http.Response> sendCheckOutData(String products) {
    // send the data from check out to the server
    return http.post(
      Uri.parse(localTestData) ,
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'products_at_check_out' : products
      })
    );
  }//end send check out data


  static void sendUrlToLocalBrowser() {
    // Edit the GET URL for our products.
    ///=========================================================================
    ///
    /// ASIN.#inCart=itemStockNumber&Quantity.#inCart=1&
    //
    // For example to add lucina as the first item in your cart and Robin as the second.
    // http://www.amazon.com/gp/aws/cart/add.html?&ASIN.1=B00V86BJV4&Quantity.1=1&ASIN.2=B00V86BRHU&Quantity.2=1
    //
    // Amazon Item Numbers:
    //
    // Lucina: B00V86BJV4
    //
    // Robin: B00V86BRHU
    ///=========================================================================

    // use bloc to get a list of the cart items
    List products = bloc.allItems['cart items'];

    // go through them one by one and add what is relevant to the url
    String url = 'https://www.amazon.ca/gp/aws/cart/add.html?';
    int count = 1;
    for(var element in products){
      String asin = element['asin'];
      String quantity = element['quantity'].toString();
      url = '${url}ASIN.${count.toString()}=$asin&Quantity.1=${quantity.toString()}&';
      count++;
    }//end
    print(url);

    launchWebSiteUrl(url);
  }//end method

}//end check out logic