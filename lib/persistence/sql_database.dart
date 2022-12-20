import 'package:hermes_marketplace/objects/history_object.dart';
import 'package:hermes_marketplace/objects/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLDatabase {
  static late Database _database;

  // 'id' : id,
  // 'name': product.name,
  // 'description' : product.description,
  // 'networkImage' : product.networkImage,
  // 'price': product.price,
  // 'quantity' : product.quantity,
  // 'source' : product.source,
  // 'amazonLink' : product.amazonLink

  static Future openDb() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), "orderHistory.ddb"),
      version: 1,
      onCreate: (Database db, int version) async{
        await db.execute(
          "CREATE TABLE history(id INTEGER PRIMARY KEY autoincrement, name TEXT, description TEXT, networkImage TEXT, price TEXT, quantity INTEGER, source TEXT, amazonLink TEXT)"
        );
      }
    );
    return _database;
  }//end open db

  static Future<List<Product>> getHistory() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('history');

    return List.generate(maps.length, (index) {
      return Product(
          name: maps[index]['name'], description:maps[index][' description'] ?? '',
          networkImage: [maps[index]['networkImage'].toString(),''], price: maps[index]['price'],
          quantity: maps[index]['quantity'], source: maps[index]['source'],
          amazonLink: maps[index]['amazonLink'], asin: '');
    }).toList();
  }//end get history

  static Future insertProduct(HistoryObject object) async{
    await openDb();
    try {
      await _database.insert('history', object.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }catch (error) {
      throw Exception(error.toString());
    }//end try-catch
  }

  static Future<void> deleteProduct(Product product) async {
    await openDb();
    await _database.delete('history', where: "name=?", whereArgs: [product.name]);
  }


}//end sql database