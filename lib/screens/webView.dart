
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webView extends StatefulWidget {
  const webView({Key key}) : super(key: key);

  @override
  _webViewState createState() => _webViewState();
}

class _webViewState extends State<webView> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: WebView(
        initialUrl:
            'http://www.madehow.com/Volume-5/Soccer-Ball.html#:~:text=The%20standard%20soccer%20ball%20is,Modern%20balls%20have%20a%20valve',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      )),
    );
  }
}
