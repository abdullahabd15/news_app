import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/request_status.dart';
import 'package:news_app/enum/request_event.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/repository/news_repository.dart';

class NewsBloc extends Bloc<RequestEvent, RequestState<News>> {
  final _repository = NewsRepository();

  NewsBloc(RequestState<News> initialState) : super(initialState) {
    add(RequestEvent.requestStarted);
  }

  @override
  Stream<RequestState<News>> mapEventToState(RequestEvent event) async* {
    if (event == RequestEvent.requestStarted) {
      yield RequestState.state(event: RequestEvent.requestStarted);
      var news = await _repository.fetchTopHeadlines();
      if (news != null) {
        yield RequestState.state(
            event: RequestEvent.requestSuccess, data: news);
      } else {
        yield RequestState.state(
            event: RequestEvent.requestError,
            errorMessage: "Failed to fetch Top Headlines News");
      }
    }
  }
}
