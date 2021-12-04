import 'package:floor/floor.dart';

@entity
class FavouriteProduct {
  @primaryKey
  String id;
  String slug;
  String category;
  String name;
  String price;
  String image;

  FavouriteProduct(
      {required this.id,
      required this.image,
      required this.name,
        required this.slug,
        required this.category,
      required this.price,
      });
}
