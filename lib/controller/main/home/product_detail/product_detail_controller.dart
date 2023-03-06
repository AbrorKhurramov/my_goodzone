import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/base/base_controller.dart';
import 'package:my_goodzone/data/models/products/products_response.dart';
import 'package:my_goodzone/data/models/products/shop_response.dart';
import 'package:my_goodzone/data/repository/home/home_repository.dart';

class ProductDetailController extends BaseController with SingleGetTickerProviderMixin {

ProductDetail productDetail = ProductDetail();
ShopDetail shopDetail =ShopDetail();
late bool isAvailable;
int imgIndex = 0;
final HomeRepository? repository;
  List<String> images=[];
  List<RelatedProducts> relatedProducts = [];
  late ScrollController scrollController;
  late TabController tabController;

@override
onInit(){
  scrollController = ScrollController();
  tabController = TabController(length: 3, vsync: this);
  super.onInit();
  getProductDetail(Get.arguments[0]);
  images.add(Get.arguments[2]);
  getProductImages(Get.arguments[0]);
  getRelatedProducts(Get.arguments[0]);
  getShops(Get.arguments[1]);
}


  ProductDetailController( {required this.repository});



  Future<void> getProductDetail(String slug) async {
  final result = await repository!.getProductDetail(slug);
  if (result is ProductDetail) {
   productDetail = result;
    update();
  } else {
showError(result);
  }
}
Future<void> getProductImages(String slug) async {
  final result = await repository!.getProductDetail(slug);
  if (result is ProductDetail) {
   // images.add(result.product!.image??"");
    images.addAll(result.product!.gallery!);
    update();
  } else {
showError(result);
  }
}
Future<void> getRelatedProducts(String slug) async {
    setLoading(true);
  final result = await repository!.getProductDetail(slug);
  setLoading(false);
  if (result is ProductDetail) {
    relatedProducts = result.product!.relatedProducts!;
    update();
  } else {
showError(result);
  }
}
Future<void> getShops(String id) async {
  final result = await repository!.getShopDetail(id);
  if (result is ShopDetail) {
  shopDetail = result;
    update();
  } else {
showError(result);
  }
}

bool isReverse(bool a) => !a;




}
