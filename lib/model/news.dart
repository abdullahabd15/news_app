import 'package:news_app/model/article.dart';

class News {
  String status;
  int totalResults;
  List<Article> articles = [];

  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  News.fromMap(Map<String, dynamic> map) {
    this.status = map["status"];
    this.totalResults = map["totalResults"];
    List<dynamic> articles = map["articles"];
    articles.forEach((element) {
      this.articles.add(Article.fromMap(element));
    });
  }
}
