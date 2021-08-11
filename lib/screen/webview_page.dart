import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  final String url;

  const WebviewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebviewPage();
}

class _WebviewPage extends State<WebviewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('iThome'), centerTitle: true),
        body: SafeArea(child: WebView(initialUrl: widget.url)));
  }
}
