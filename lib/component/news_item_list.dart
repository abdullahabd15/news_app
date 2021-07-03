import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/util/date_util.dart';

class NewsItemList extends StatelessWidget {
  final Article article;
  final Function(String) onItemTapped;

  const NewsItemList({this.article, this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemTapped.call(article.url);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Container(
          height: 110,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[400], width: 1),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                height: 100,
                width: 150,
                child: article.urlToImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        child: Image.network(
                          article.urlToImage,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.source.name,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            _getPublishedAt(article.publishedAt),
                            style: TextStyle(fontSize: 10, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPublishedAt(String strDateTime) {
    var dateTime = DateUtil.convertToDateTime(strDateTime);
    if (DateUtil.isToday(dateTime)) {
      var diffInHours = DateUtil.differenceInHour(dateTime);
      if (diffInHours == 0) {
        return "${DateUtil.differenceInMinutes(dateTime)} menit yang lalu.";
      } else {
        return "$diffInHours jam yang lalu.";
      }
    } else {
      return DateUtil.toIndonesianFormat(dateTime);
    }
  }
}
