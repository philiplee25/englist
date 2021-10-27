import 'package:flutter/material.dart';

import 'insert_word_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedPageIndex = 0;

  List _pages = [
    Text('하고싶은거 다 떠있는 화면'),
    OcrPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedPageIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedPageIndex,
          items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
  });
  }
}
