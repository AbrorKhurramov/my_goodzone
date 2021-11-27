import 'package:my_goodzone/base/base_repository.dart';

class AuthRepository extends BaseRepository {
  // Future<ResponseHandler<BannersResponse>> _fetchBanners(
  //     {@required String shipperId, int page, int limit}) async {
  //   BannersResponse response;
  //   try {
  //     response = await apiClient.getBanners(shipperId, page, limit);
  //   } catch (error, stacktrace) {
  //     print("Exception occurred: $error stacktrace: $stacktrace");
  //     return ResponseHandler()
  //       ..setException(ServerError.withError(error: error));
  //   }
  //   return ResponseHandler()..data = response;
  // }
  // Future<dynamic> getBanners({@required String shipperId}) async {
  //   final response = await remoteSource.fetchBanners(
  //       shipperId: shipperId, limit: 100, page: 1);
  //   if (response.data != null) {
  //     return response.data;
  //   } else if (response.getException().getErrorMessage() != "Canceled") {
  //     return await getErrorMessage(response.getException().getErrorMessage());
  //   }
  // }

}
