import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:my_goodzone/data/provider/api_client.dart';
import 'package:my_goodzone/data/repository/home/home_repository.dart';

class ProductDetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController(repository: HomeRepository(apiClient: ApiClient.getInstance()
    )));
  }
}
