import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        appBar: AppBar(title: const Text('WebView')),
        body: Center(
          child: TextButton(
            onPressed: () {},
            child: Text('Abrir: $url'),
          ),
        ),
      );
    }

    // Mobile (Android/iOS)
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        backgroundColor: Colors.white,
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
