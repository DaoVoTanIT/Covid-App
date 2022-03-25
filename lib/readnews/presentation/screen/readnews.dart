import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReadNews extends StatelessWidget {
  const ReadNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://covid19.gov.vn/vaccine-tiem-chung.htm',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
