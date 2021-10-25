import 'package:flutter/material.dart';
import 'package:picture_ocr_connect/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ocr to camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}
