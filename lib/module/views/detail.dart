import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  late InAppWebViewController webViewController;
  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)!.settings.arguments as String;
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse("${url}"))),
    );
  }
}
