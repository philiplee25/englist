import 'package:flutter/material.dart';
import 'camera_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CameraWidget(),

    );
  }
}




// print('경로==================================> ' + imageFile!.path);