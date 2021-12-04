import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao/product_dao.dart';
import 'entity/basket_products.dart';
import 'entity/products.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [BasketProduct,FavouriteProduct])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;

  static late AppDatabase instance;

  static Future<void> init() async {
    instance =
        await $FloorAppDatabase.databaseBuilder('goodzone1.db').build();
  }
  static getInstance() async {
    if (instance == null) await init();
    return instance;
  }


}
