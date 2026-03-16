import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WIndow extends StatefulWidget {
  final String url;

  const WIndow({super.key, required this.url});

  @override
  State<WIndow> createState() => _WIndowState();
}

class _WIndowState extends State<WIndow> {
  InAppWebViewController? webViewController;
  late String root;

  @override
  void initState() {
    super.initState();
    if (!widget.url.startsWith("https://")) {
      root = "https://${widget.url}";
    } else {
      root = widget.url;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            'Loading ...',
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 32.0,
              color: getColor("divider-color")
            ),
          ),
        ),
        InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(root),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ),
      ]
    );
  }
}