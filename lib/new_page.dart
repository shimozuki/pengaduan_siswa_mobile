import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webview_pro/platform_interface.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class Webviewpage extends StatefulWidget {
  const Webviewpage({super.key});

  @override
  State<Webviewpage> createState() => _WebviewpageState();
}

class _WebviewpageState extends State<Webviewpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: WebView(
        initialUrl: 'https://lombokfuntransport.com/badminton/',
        javascriptMode: JavascriptMode.unrestricted,
        // onWebViewCreated: (WebViewController webViewController) {
        //   _controller.complete(webViewController);
        // },
        // onProgress: (int progress) {
        //   print("WebView is loading (progress : $progress%)");
        // },
        // javascriptChannels: <JavascriptChannel>{
        //   _toasterJavascriptChannel(context),
        // },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        geolocationEnabled: false, //support geolocation or not
      ),
    );
  }
}
