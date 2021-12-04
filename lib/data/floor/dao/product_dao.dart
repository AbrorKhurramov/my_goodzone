import 'package:floor/floor.dart';
import 'package:my_goodzone/data/floor/entity/basket_products.dart';
import 'package:my_goodzone/data/floor/entity/products.dart';

@dao
abstract class ProductDao {
  //
  @Query('SELECT * FROM BasketProduct')
  Stream<List<BasketProduct>>? getBasketProducts();

  @insert
  Future<void> insertProduct(BasketProduct product);

  @Query('DELETE FROM BasketProduct WHERE id=:id')
  Future<void> deleteFromBasketById(String id);

  @delete
  Future<void> removeAllProducts(List<BasketProduct> products);

  @update
  Future<void> updateBasketProduct(BasketProduct product);






  @Query('SELECT * FROM FavouriteProduct')
  Stream<List<FavouriteProduct>>? getFavouriteProducts();

  @Query('SELECT * FROM FavouriteProduct')
  Future<List<FavouriteProduct>>? getFavouriteProductsAsync();

  @Query('SELECT * FROM Products WHERE id =:id')
  Stream<FavouriteProduct?> getFavouriteProductsById(String id);


  @Query('SELECT * FROM Products WHERE id =:id')
  Future<FavouriteProduct?> getFavouriteProductById(String id);

  @insert
  Future<void> insertFavouriteProduct(FavouriteProduct product);

  @Query('DELETE FROM FavouriteProduct WHERE id=:id')
  Future<void> deleteById(String id);

  @update
  Future<void> updateFavouriteProduct(FavouriteProduct product);

  @delete
  Future<void> removeAllFavourites(List<FavouriteProduct> products);
}
