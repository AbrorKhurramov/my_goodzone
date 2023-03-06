import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:my_goodzone/base/base_controller.dart';
import 'package:my_goodzone/data/models/banners/banners_response.dart';
import 'package:my_goodzone/data/models/brands/brand_response.dart';
import 'package:my_goodzone/data/models/carousel/carousel_response.dart';
import 'package:my_goodzone/data/models/popular/popular_response.dart';
import 'package:my_goodzone/data/models/products/featured_list_response.dart';
import 'package:my_goodzone/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController with SingleGetTickerProviderMixin {
  final HomeRepository? repository;
  HomeController({
    required this.repository,
  }) : assert(repository != null);

  late TabController tabController;
  final scrollController = ScrollController();
  List<Banners> banners = [];
  List<Brands> brands = [];
  List<Promos> promos = [];
  List<Price> prices= [];
  List<Products> popular = [];
  List<Products> recommended= [];
  List<FeaturedList> featuredList= [];
  List<Price> recPrice=[];
  List<Price> featPrice=[];


  //List<Categories> _categories = [];
  //List<Orders> _orders = [];
//  int _index = 0;

  @override
  void onInit() {
    tabController = TabController(length: 1, vsync: this);

    super.onInit();
  }

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  List<Products> getFeatureProducts(int type)  {
    if(type==1) {
      return featuredList[0].products;
    } else if(type==2) {
      return featuredList[1].products;
    } else {
      return featuredList[2].products;
    }
  }

  void getData() {
    getBanners();
    getPromos();
    getBrands();

    getProducts();



  }


  /// get banner list from api
  Future<void> getBanners() async {
    setLoading(true);
    final result = await repository?.getBanners();

    if (result is BannerResponse) {
      banners = result.banners;
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }
  Future<void> getBrands() async {
    setLoading(true);
    final result = await repository?.getBrand();
    setLoading(false);
    if (result is BrandResponse) {
      brands = result.brands;
      update();
    } else {
      showError(result);
    }
  }
  Future<void> getPromos() async {
    setLoading(true);
    final result = await repository!.getCarousels();
    setLoading(false);
    if (result is CaruselResponse) {
      promos = result.promos ?? [];
      update();
    }else {
      showError(result);
    }
  }

  Future<void> getProducts() async {
    setLoading(true);
    final result = await repository!.getAllProduct();
    setLoading(false);
    if (result is FeaturedListResponse) {
      featuredList = result.featuredLists;
      List<Price> list1=[];
      List<Price> list2=[];
      List<Price> list3=[];
      for(int i=0;i<result.featuredLists[1].products.length;i++) {
        list1.add(result.featuredLists[1].products[i].price!);
        list2.add(result.featuredLists[2].products[i].price!);
        list3.add(result.featuredLists[3].products[i].price!);
      }
      prices=list1;
      recPrice = list2;
      featPrice = list3;

      update();
    }else {
      showError(result);
    }
  }


  ///get category with products. Sort by products isNotEmpty
  // Future<void> getCategoryWithProducts() async {
  //   final result = await repository?.getCategoryWithProducts(
  //       shipperId: Constants.shipperId);
  //   if (result is CategoryResponse) {
  //     _categories = result.categories.where((element) {
  //       if (element.products.isNotEmpty)
  //         return true;
  //       else if (element.childCategories.isNotEmpty &&
  //           element.childCategories.first.products.isNotEmpty)
  //         return true;
  //       else
  //         return false;
  //     }).toList();
  //   } else {
  //     Get.snackbar('error'.tr, result.toString());
  //   }
  //   setLoading(false);
  // }

  /// search product on home page text field.
  // Future<List<Products>> searchProduct(String? search) async {
  //   setLoading(true);
  //   final result = await repository?.getSearchProducts(
  //     shipperId: Constants.shipperId,
  //     search: search ?? '',
  //   );
  //   setLoading(false);
  //   if (result is ProductsResponse) {
  //     return result.products.cast();
  //   } else {
  //     Get.snackbar('error'.tr, result.toString());
  //     return [];
  //   }
  // }
  //
  // void changeIsCheckedCategory(int index) {
  //   _categories[index].isChecked = !_categories[index].isChecked;
  //   update();
  // }
  //
  // List<Banners> get banners => _banners;
  //
  // List<Categories> get categories => _categories;
  //
  // List<Orders> get order => _orders;
  //
  // int get index => _index;
  //
  // List<Categories> get checkedCategories =>
  //     _categories.where((element) => element.isChecked).toList();
}
