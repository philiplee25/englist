import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class OcrPage extends StatefulWidget {
  @override
  _OcrPageState createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {

  var imageFile = null;
  List<String> a = [];

  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Choose option"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(height: 1,color: Colors.blue,),
                  ListTile(
                    onTap: (){
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(Icons.camera,color: Colors.blue,),
                  ),

                  ListTile(
                    onTap: (){
                    },
                    title: Text("excel 가져오기"),
                    leading: Icon(Icons.file_copy,color: Colors.blue,),
                  ),

                ],
              ),
          ),);
    });
  }

  void _openCamera(BuildContext context)  async{
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    maxHeight: 1080,
    maxWidth: 1080,);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _cropImage(filePath) async {
    var croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      aspectRatioPresets: Platform.isAndroid
      ? [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
      ]
      : [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio5x3,
      CropAspectRatioPreset.ratio5x4,
      CropAspectRatioPreset.ratio7x5,
      CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),);
    if (croppedImage != null) {
      setState(() {
        imageFile = croppedImage;
        print('======================================================================' + imageFile.path.toString());
        a.add(imageFile..path.toString());
      });
    }
  }

  Widget _buildBody() {
    return Column(
      children: [
        imageFile == null ? Text('No Image') :
            // Image.file(File(imageFile.path))
            uploadImage('image', File('assets/222.jpg')),
      ],
    );

    // return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //   crossAxisCount: 0,
    //   mainAxisSpacing: 0,
    //   crossAxisSpacing: 3,
    // ),
    //   itemCount: _imageFiles.length,
    //   itemBuilder: (context, index) {
    //
    //   },
    // )
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,
          // MaterialPageRoute(builder: (context) => CreatePage()));
          _showImageDialog();
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }


  uploadImage(String title, File file) async{

    var request = http.MultipartRequest("POST", Uri.parse('https://dapi.kakao.com/v2/vision/text/ocr'));

    request.fields['title'] = "first";
    request.headers['Authorization'] = "KakaoAK 3673f1be1964ab5060521c62a015bb2f";

    var picture = http.MultipartFile.fromBytes('image', (await rootBundle.load("assets/222.jpg")).buffer.asUint8List(),
        filename: '222.jpg');

    request.files.add(picture);

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    var result1 = String.fromCharCodes(responseData);

    print('formCharCodes =====> ' + result1);

    var result = utf8.decode(responseData);
    print(result);

  }

}






// ==========================================================================================