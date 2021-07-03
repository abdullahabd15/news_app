import 'package:news_app/api/api_client.dart';
import 'package:news_app/model/news.dart';

class NewsRepository {
  final apiClient = ApiClient();
  
  Future<News> fetchTopHeadlines() async {
    var result = await apiClient.get("top-headlines?country=id");
    if (result != null) {
      var news = News.fromMap(result);
      return news;
    } else {
      return null;
    }
  }
}