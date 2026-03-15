import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WIndow extends StatefulWidget {
  final String url;

  const WIndow({
    super.key,
    required this.url
  });

  @override
  State<WIndow> createState() => _WIndowState();
}

class _WIndowState extends State<WIndow> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}