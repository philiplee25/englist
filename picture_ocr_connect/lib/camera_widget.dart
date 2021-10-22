
// 자 한번 해보자
// camera_widget.dart 내부에 ocr 코드를 삽입한다.










import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CameraWidgetState();
  }

}

class CameraWidgetState extends State<CameraWidget>{
  XFile? imageFile=null;
  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Pick Image Camera1"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child:( imageFile==null)?Text("Choose Image"): Image.file( File(  imageFile!.path)),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.pink,
                onPressed: (){
                  _showChoiceDialog(context);
                },
                child: Text("Select Image"),

              )
            ],
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera ,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }
}

