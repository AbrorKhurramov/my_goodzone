import 'package:my_goodzone/core/constants/constants.dart';
import 'package:alice/alice.dart';
import 'package:my_goodzone/data/models/brands/brand_response.dart';
import 'package:my_goodzone/data/models/carousel/carousel_response.dart';
import 'package:my_goodzone/data/models/popular/popular_response.dart';
import 'package:my_goodzone/data/models/products/featured_list_response.dart';
import 'package:my_goodzone/data/models/products/shop_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:my_goodzone/data/models/banners/banners_response.dart';
import 'package:my_goodzone/data/models/categories/category_response.dart';
import 'package:my_goodzone/data/models/products/products_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://dev.goodzone.uz/v1/")
abstract class ApiClient {
  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));
    dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));
    return dio;
  }


  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;
  //
  static ApiClient getInstance({String baseUrl = Constants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }
  //
  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/promo")
  Future<CaruselResponse> getPromo();


  @GET("/banner")
  Future<BannerResponse> getBanner(
      @Query("limit") int limit);

  @GET("/brand")
  Future<BrandResponse> getBrand(
      @Query("limit") int limit);
  @GET("/featured-list")
  Future<FeaturedListResponse> getFeaturedList(
      @Query("limit") int limit);

  @GET("/product")
  Future<PopularResponse> getFamousProduct(
      @Query("limit") int limit,
      @Query("popular") bool popular);

  @GET("/product")
  Future<PopularResponse> getRecommended(
      @Query("limit") int limit,
      @Query("recommended") bool recommended);


  @GET("/category")
  Future<Category> getCategory(
      @Query("limit") int limit,
      );


  @GET("/product/{id}")
  Future<ProductDetail> getSlug(
      @Path("id") String id
      );
  @GET("/product/{id}/shops")
  Future<ShopDetail> getShops(
      @Path("id") String id
      );

}
