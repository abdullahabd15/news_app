import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String newsDetailRouteName = "/newsDetailScreen";

class NewsDetailScreen extends StatefulWidget {
  final String url;

  const NewsDetailScreen({this.url});

  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  bool _isLoadingPage = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              setState(() {
                _isLoadingPage = false;
              });
            },
            userAgent:
                "Mozilla/5.0 (Linux; Android 8.1.0; XXXXXXX SDK built for x86 Build/OSM 1180201026 ; wv) AppleWebkit/537.36 (KHTML, 11ke Gecko) Version/4.0 Chrome/61.0.3163.98 Mobile Safari/537.36",
          ),
          _isLoadingPage
              ? SpinKitDualRing(
                  color: Colors.blue,
                  size: 40,
                  lineWidth: 5,
                )
              : Container(),
        ],
      ),
    );
  }
}
