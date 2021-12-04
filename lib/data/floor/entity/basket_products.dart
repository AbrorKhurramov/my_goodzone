
import 'package:floor/floor.dart';

@entity
class BasketProduct {
  @primaryKey
  String id;
  String name;
  String price;
  int quantity;
  String image;

  BasketProduct(
      {required this.id,
        required this.image,
        required this.name,
        required this.price,
        required this.quantity});
}
