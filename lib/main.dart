import 'package:flutter/material.dart';
import 'package:mobile_type_portfolio/top_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:js/js_util.dart' as js_util;
import 'dart:html' as html;

void main() {
  if (kIsWeb) {
    if (js_util.hasProperty(html.window, "flutterReady")) {
      js_util.callMethod(html.window, "flutterReady", []);
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yukiya Kuwabara',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TopPage(),
    );
  }
}
