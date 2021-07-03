import 'package:flutter/material.dart';
import 'package:news_app/screen/news_detail_screen.dart';
import 'package:news_app/screen/news_screen.dart';
import 'package:news_app/screen/splash_screen.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRouteName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case newsRouteName:
        return MaterialPageRoute(builder: (_) => NewsScreen());
      case newsDetailRouteName:
        var url = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => NewsDetailScreen(url: url));
      default:
        throw Exception("Page Not Found");
    }
  }
}
