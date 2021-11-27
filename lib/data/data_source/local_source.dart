import 'package:get_storage/get_storage.dart';
import 'package:my_goodzone/data/floor/app_database.dart';
import 'package:my_goodzone/data/floor/dao/product_dao.dart';
import 'package:my_goodzone/data/floor/entity/products.dart';
import 'package:my_goodzone/data/keys/app_keys.dart';
import 'package:my_goodzone/data/models/customer/customer.dart';

class LocalSource {
  var _localStorage = GetStorage();
  ProductDao _productDao = AppDatabase.instance.productDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else
      return LocalSource._();
  }

  Stream<List<Products>>? getAllBasketProducts() {
    return _productDao.getBasketProducts();
  }

  Future<void> updateQuantity(
      {bool isMinus = false,
      bool isDelete = false,
      required Products product}) async {
    if (isMinus) {
      if (product.quantity > 1) {
        product.quantity = product.quantity - 1;
        await updateProduct(product);
      } else if (isDelete) {
        removeProduct(product);
      }
    } else {
      product.quantity = product.quantity + 1;
      await updateProduct(product);
    }
  }

  Future<List<Products>>? getAllBasketProductsAsync() {
    return _productDao.getBasketProductsAsync();
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

  Future<void> insertProduct(Products product) async {
    await _productDao.insertProduct(product);
  }

  Future<void> removeProduct(Products product) async {
    await _productDao.removeProduct(product);
  }

  Future<void> updateProduct(Products product) async {
    await _productDao.updateProduct(product);
  }

  Future<void> removeAll(List<Products> products) async {
    await _productDao.removeAll(products);
  }

  bool hasProfile() {
    return _localStorage.read<bool>(AppKeys.HAS_PROFILE) ?? false;
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
