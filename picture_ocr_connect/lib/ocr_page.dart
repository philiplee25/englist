import 'package:flutter/material.dart';

import 'create_page.dart';

class OcrPage extends StatefulWidget {
  @override
  _OcrPageState createState() => _OcrPageState();
}

class _OcrPageState extends State<OcrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreatePage()));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
    ),
        itemCount: 5,
        itemBuilder: (context, index) {
      return _buildListItem(context, index);
        }
        );
  }

  Widget _buildListItem(BuildContext context, int index) {
    String img_src = '';
    return Image.network(img_src, fit: BoxFit.cover);
  }

}
