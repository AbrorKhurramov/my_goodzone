import 'package:dio/dio.dart';
import 'package:my_goodzone/base/base_repository.dart';
import 'package:my_goodzone/data/models/products/products_response.dart';
import 'package:my_goodzone/data/provider/api_client.dart';
import 'package:my_goodzone/data/provider/response_handler.dart';
import 'package:my_goodzone/data/provider/server_error.dart';

class HomeRepository extends BaseRepository {
  ApiClient? apiClient;
 // final LocalSource _localSource = LocalSource.getInstance();

  HomeRepository({required this.apiClient}) : assert(apiClient != null);

  Future<dynamic> getBanners() async {
    dynamic response ;
    try {
      response = await apiClient?.getBanner(10);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
    response =  ServerError.withError(error: error as DioError).getErrorMessage();
    }
    return response;
  }


  Future<dynamic> getCarousels() async {
    dynamic response ;
    try {
      response = await apiClient!.getPromo();
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
     response = ServerError.withError(error: error as DioError);
    }
    return response;

  }
  Future<dynamic> getRecommended() async {
    dynamic response;

    try {
      response = await apiClient!.getRecommended(10,true);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
     response = ServerError.withError(error: error as DioError);
    }
    return response;
  }
  Future<dynamic> getAllProduct() async {
    dynamic response;

    try {
      response = await apiClient!.getFeaturedList(10);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
     response = ServerError.withError(error: error as DioError);
    }
    return response;
  }

  Future<dynamic> getBrand() async {
    dynamic response;
    try {
      response = await apiClient!.getBrand(13);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      response  = ServerError.withError(error: error as DioError);
    }
    return response;
  }

  Future<dynamic> getPopularProducts() async {
    dynamic response ;
    try {
      response = await apiClient!.getFamousProduct(10,true);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");

       response = ServerError.withError(error: error as DioError);
    }
    return response;
  }

  Future<dynamic> getProductDetail( String slug) async {
    dynamic response;

    try {
      response = await apiClient!.getSlug(slug);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
     response = ServerError.withError(error: error as DioError);
    }
    return  response;
  }
 Future<dynamic> getShopDetail( String slug) async {
    dynamic response;

    try {
      response = await apiClient!.getShops(slug);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
     response = ServerError.withError(error: error as DioError);
    }
    return  response;
  }


}
