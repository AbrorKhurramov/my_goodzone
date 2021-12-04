import 'package:my_goodzone/base/base_controller.dart';
import 'package:my_goodzone/data/models/categories/category_response.dart';
import 'package:my_goodzone/data/repository/catalog/catalog_repository.dart';

class SearchController extends BaseController {
  List<Categories> category = [];

  List<String> names = ["Noutbuk va kompyuterlar", "Smartfon va gadjetlar", "Televizorlar va audio", "Oshxona jihozlari", "Go'zallik va salomatlik", "Uy uchun texnikalar"];

  final CatalogRepository catalogRepository;

  SearchController({
    required this.catalogRepository,
  }) : assert(catalogRepository != null);


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    setLoading(true);
    final result = await catalogRepository.getCatalogs();
    setLoading(false);
    if (result is Category) {
      category = result.categories ?? [];
      update();
    } else {
      showError(result);
    }
  }
}
