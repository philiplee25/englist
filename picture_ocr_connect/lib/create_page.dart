import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: null,
      child: Icon(Icons.add_a_photo),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: Icon(Icons.send),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Text('No Image'),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEditingController,
        )
      ],
    );
  }
}