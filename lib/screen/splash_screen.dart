import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/bloc/splash_bloc.dart';
import 'package:news_app/screen/news_screen.dart';

const String splashRouteName = "/splashScreen";

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, bool>(
        listener: (context, isLoadingDone) {
          if (isLoadingDone) {
            Navigator.pushReplacementNamed(context, newsRouteName);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Top News",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SpinKitDualRing(
              color: Colors.blue,
              size: 40,
              lineWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}
