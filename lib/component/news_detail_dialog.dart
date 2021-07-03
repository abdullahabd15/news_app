import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screen/news_detail_screen.dart';
import 'package:news_app/util/date_util.dart';

class NewsDetailDialog extends StatelessWidget {
  final Article article;
  const NewsDetailDialog({this.article});

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var author = article.author ?? "Anonim";
    var source = article.source?.name ?? "";
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            isLandscape
                ? SizedBox(
              height: 30,
            )
                : Container(),
            InkWell(
              child: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                article.urlToImage != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  article.title,
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Oleh: $author - $source",
                  style:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  DateUtil.differencePhrase(article.publishedAt),
                  style: TextStyle(fontSize: 10, color: Colors.black54),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_getContent(article.content)),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                            context,
                            newsDetailRouteName,
                            arguments: article.url,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            "Baca Selengkapnya.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getContent(String content) {
    var splitString = content?.split("[+");
    return splitString?.first ?? "";
  }
}
