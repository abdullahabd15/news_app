import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/request_status.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/component/news_detail_dialog.dart';
import 'package:news_app/component/news_item_list.dart';
import 'package:news_app/component/news_shimmer.dart';
import 'package:news_app/enum/request_event.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/news.dart';

const String newsRouteName = "/newsScreen";

class NewsScreen extends StatelessWidget {
  const NewsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Top Headlines News"),
        ),
      ),
      body: BlocBuilder<NewsBloc, RequestState<News>>(
        builder: (context, state) {
          switch (state.event) {
            case RequestEvent.requestStarted:
              return _buildLoading();
            case RequestEvent.requestSuccess:
              return _buildNewsList(state.data);
            case RequestEvent.requestError:
              return _buildErrorScreen(state.errorMessage);
            default:
              return _buildErrorScreen("Something went wrong!");
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsShimmer();
      },
      itemCount: 7,
    );
  }

  Widget _buildErrorScreen(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  Widget _buildNewsList(News news) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var article = news.articles[index];
        return NewsItemList(
          article: article,
          onItemTapped: () {
            _showDialogDetail(context, article);
          },
        );
      },
      scrollDirection: Axis.vertical,
      itemCount: news.articles.length,
    );
  }

  void _showDialogDetail(BuildContext context, Article article) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return NewsDetailDialog(
          article: article,
        );
      },
    );
  }
}
