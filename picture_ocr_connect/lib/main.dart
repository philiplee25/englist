import 'package:flutter/material.dart';

import 'camera_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('Englists'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () {
                home: CameraWidget();
              },
              child: Text("사진찎기"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("시험지 만들기"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("플래시카드"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("그 무언가"),
            ),
          ]
        ),
      ),
    );
  }
}
