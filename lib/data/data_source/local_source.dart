import 'package:get_storage/get_storage.dart';
import 'package:my_goodzone/data/floor/app_database.dart';
import 'package:my_goodzone/data/floor/dao/product_dao.dart';
import 'package:my_goodzone/data/floor/entity/basket_products.dart';
import 'package:my_goodzone/data/floor/entity/products.dart';
import 'package:my_goodzone/data/keys/app_keys.dart';
import 'package:my_goodzone/data/models/customer/customer.dart';

class LocalSource {
  final _localStorage = GetStorage();
  final ProductDao _productDao = AppDatabase.instance.productDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  //Favourites
  Stream<List<FavouriteProduct>>? getAllFavouriteProducts() {
    return _productDao.getFavouriteProducts();
  }


  Future<List<FavouriteProduct>?>? getAllFavouriteProductsAsync() async {
    return await _productDao.getFavouriteProductsAsync();
  }


  Future<void> insertProduct(FavouriteProduct product) async {
    await _productDao.insertFavouriteProduct(product);
  }

  Future<void> removeProduct(String id) async {
    await _productDao.deleteById(id);
  }

  Future<void> updateProduct(FavouriteProduct product) async {
    await _productDao.updateFavouriteProduct(product);
  }

  // Basket

  Stream<List<BasketProduct>>? getAllBasketProducts() {
    return _productDao.getBasketProducts();
  }

  Future<void> insertBasketProduct(BasketProduct product) async {
    await _productDao.insertProduct(product);
  }

  Future<void> removeBasketProduct(String id) async {
    await _productDao.deleteFromBasketById(id);
  }

  Future<void> updateBasketProduct(BasketProduct product) async {
    await _productDao.updateBasketProduct(product);
  }


  Future<void> removeAll(List<BasketProduct> products) async {
    await _productDao.removeAllProducts(products);
  }


  Future<void> updateQuantity(
      {bool isMinus = false,
      required BasketProduct product}) async {
    if (isMinus) {
      if (product.quantity > 1) {
        product.quantity = product.quantity - 1;
        await updateBasketProduct(product);
      } else  {
        removeBasketProduct(product.id);
      }
    } else {
      product.quantity = product.quantity + 1;
      await updateBasketProduct(product);
    }
  }

  ////

  bool hasProfile() {
    return _localStorage.read<bool>(AppKeys.HAS_PROFILE) ?? false;
  }

  Future<void> removeProfile() async {
    await _localStorage.remove(AppKeys.HAS_PROFILE);
    await _localStorage.remove(AppKeys.CUSTOMER_ID);
    await _localStorage.remove(AppKeys.NAME);
    await _localStorage.remove(AppKeys.LOCALE);
    await _localStorage.remove(AppKeys.PHONE);
    await _localStorage.remove(AppKeys.ACCESS_TOKEN);
    await _localStorage.remove(AppKeys.REFRESH_TOKEN);
  }

  Future<void> setCustomer(Customer customer) async {
    await _localStorage.write(AppKeys.HAS_PROFILE, true);
    await _localStorage.write(AppKeys.CUSTOMER_ID, customer.id);
    await _localStorage.write(AppKeys.NAME, customer.name);
    await _localStorage.write(AppKeys.PHONE, customer.phone);
    await _localStorage.write(AppKeys.DATE_OF_BIRTH, customer.dateOfBirth);
    await _localStorage.write(AppKeys.ACCESS_TOKEN, customer.accessToken);
    await _localStorage.write(AppKeys.REFRESH_TOKEN, customer.refreshToken);
  }

  String getAccessToken() {
    return _localStorage.read<String>(AppKeys.ACCESS_TOKEN) ?? '';
  }

  String getLocale() {
    return _localStorage.read<String>(AppKeys.LOCALE) ?? 'ru';
  }

  String getRefreshToken() {
    return _localStorage.read<String>(AppKeys.REFRESH_TOKEN) ?? '';
  }

  String getFcmToken() {
    return _localStorage.read<String>(AppKeys.FCM_TOKEN) ?? '';
  }

  Customer getCustomer() => Customer(
        id: _localStorage.read<String>(AppKeys.CUSTOMER_ID) ?? '',
        name: _localStorage.read<String>(AppKeys.NAME) ?? '',
        phone: _localStorage.read<String>(AppKeys.PHONE) ?? '',
        dateOfBirth: _localStorage.read<String>(AppKeys.DATE_OF_BIRTH) ?? '',
        accessToken: _localStorage.read<String>(AppKeys.ACCESS_TOKEN) ?? '',
        refreshToken: _localStorage.read<String>(AppKeys.REFRESH_TOKEN) ?? '',
      );

  Future<void> setRefreshedTokens(
      {required String? refreshToken, required String? accessToken}) async {
    await _localStorage.write(AppKeys.REFRESH_TOKEN, refreshToken ?? '');
    await _localStorage.write(AppKeys.ACCESS_TOKEN, accessToken ?? '');
  }
}
