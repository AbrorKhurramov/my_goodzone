

import 'package:dio/dio.dart';
import 'package:my_goodzone/base/base_repository.dart';
import 'package:my_goodzone/data/provider/api_client.dart';
import 'package:my_goodzone/data/provider/server_error.dart';

class NewsRepository extends BaseRepository {
  ApiClient? apiClient;
  NewsRepository({required this.apiClient}) : assert(apiClient != null);


  Future<dynamic> getNews() async {
    dynamic response ;
    try {
      response = await apiClient!.getNews(10);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      response = ServerError.withError(error: error as DioError);
    }
    return response;

  }

}