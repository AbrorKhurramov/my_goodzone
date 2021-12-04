

import 'package:my_goodzone/base/base_controller.dart';
import 'package:my_goodzone/data/models/news/news.dart';
import 'package:my_goodzone/data/repository/news/news_repository.dart';


class NewsController extends BaseController {

  List<News> news = [];
  final NewsRepository newsRepository;

  NewsController({
    required this.newsRepository
}) : assert(newsRepository!=null);

  @override
  void onReady() {
   fetchNews();
  }

  Future<void> fetchNews() async {
    setLoading(true);
    final result = await newsRepository.getNews();
    setLoading(false);
    if (result is NewsModel) {
      news = result.news ?? [];
      update();
    } else {
      showError(result);
    }
  }

}