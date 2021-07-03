import 'package:news_app/enum/request_event.dart';

class RequestState<T> {
  T data;
  String errorMessage;
  RequestEvent event;

  RequestState.state({this.event, this.data, this.errorMessage});
}
