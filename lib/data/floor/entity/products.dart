import 'package:floor/floor.dart';

@entity
class Products {
  @primaryKey
  String id;
  String name;
  int price;
  int quantity;
  String image;

  Products(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.quantity});
}
