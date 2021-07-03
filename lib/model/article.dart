import 'package:news_app/model/source.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromMap(Map<String, dynamic> map) {
    var source = map["source"];
    if (source != null) {
      this.source = Source.fromMap(source);
    }
    this.author = map["author"];
    this.title = map["title"];
    this.description = map["description"];
    this.url = map["url"];
    this.urlToImage = map["urlToImage"];
    this.publishedAt = map["publishedAt"];
    this.content = map["content"];
  }

  static Map<String, dynamic> toMap(Article article) {
    var map = Map<String, dynamic>();
    map["source"] = Source.toMap(article.source);
    map["author"] = article.author;
    map["title"] = article.title;
    map["description"] = article.description;
    map["url"] = article.url;
    map["urlToImage"] = article.urlToImage;
    map["publishedAt"] = article.publishedAt;
    map["content"] = article.content;
    return map;
  }
}
