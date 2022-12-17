import 'package:hermes_marketplace/objects/history_object.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:hermes_marketplace/persistence/sql_database.dart';

class OrderHistoryLogic {
  static List<Product> orderHistory = [];

  static getHistoryFromSql() async {
    return await SQLDatabase.getHistory();
  }

  static void addNewProduct(HistoryObject object) {
    SQLDatabase.insertProduct(object);
  }


}