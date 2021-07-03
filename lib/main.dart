import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/request_status.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/splash_bloc.dart';
import 'package:news_app/route/app_route.dart';
import 'package:news_app/screen/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => SplashBloc(),
      ),
      BlocProvider(
        create: (_) => NewsBloc(RequestState.state()),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: (settings) => AppRoute.onGenerateRoute(settings),
    ),
  ));
}
