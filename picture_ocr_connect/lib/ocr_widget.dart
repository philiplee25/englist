import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('Image Upload'),),
        body: Center(
          child: Container(
            child: TextButton(onPressed: (){
              uploadImage('image', File('222.jpg'));
            }, child: Text('Upload'),),
          ),
        ),
      ),
    );
  }
}

uploadImage(String title, File file) async{

  var request = http.MultipartRequest("POST", Uri.parse('https://dapi.kakao.com/v2/vision/text/ocr'));

  request.fields['title'] = "first";
  request.headers['Authorization'] = "KakaoAK 3673f1be1964ab5060521c62a015bb2f";

  List<String> a = ["assets/222.jpg"];

  var picture = http.MultipartFile.fromBytes('image', (await rootBundle.load(a[0])).buffer.asUint8List(),
      filename: '222.jpg');

  request.files.add(picture);

  var response = await request.send();

  var responseData = await response.stream.toBytes();

  var result1 = String.fromCharCodes(responseData);

  print('formCharCodes =====> ' + result1);

  var result = utf8.decode(responseData);
  print(result);

}

// 이미지 찾기  assets/111.jpg 를 picker 이용해서 post 전송