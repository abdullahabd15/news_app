import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/enum/splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, bool> {

  SplashBloc() : super(false) {
    add(SplashEvent.loading);
  }

  @override
  Stream<bool> mapEventToState(SplashEvent event) async* {
    if (event == SplashEvent.loading) {
      await Future.delayed(Duration(milliseconds: 500));
      add(SplashEvent.loadingDone);
    } else {
      yield true;
    }
  }
}