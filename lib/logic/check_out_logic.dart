import 'dart:convert';

import 'package:hermes_marketplace/constants/custom_variables.dart';
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

}//end check out logic