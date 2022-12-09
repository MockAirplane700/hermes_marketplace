import 'package:hermes_marketplace/objects/cart.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DbHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }//end if

    _database = await initDatabase();
    return null;
  }//end database

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }//end init database

  _onCreate(Database db, int version) async {
      await db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE, productName TEXT, initialPrice INTEGER,productPrice INTEGER,quantity INTEGER, amazonLink TEXT, image TEXT )'
      );
  }//end on create

  Future<Cart> insert(Cart cart) async {
    var dbClient = await database;
    await dbClient?.insert('cart', cart.toMap());
    return cart;
  }//end insert

  Future<List<Cart>> getCartContents() async {
    var dbClient = await database;
    final List<Map<String,Object?>> queryResult = await dbClient!.query('cart');
    return queryResult.map((result) => Cart.fromMap(result)).toList();
  }//end get cart content

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await database;
    return await dbClient!.update('cart', cart.toMap(),where: 'productId=?', whereArgs: [cart.productId]);
  }//end update quantity

  Future<int> deleteCartItem(int id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id=?', whereArgs: [id]);
  }//end delete cart item
}//end class