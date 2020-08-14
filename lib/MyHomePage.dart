import 'package:flutter/material.dart';

import 'package:flutter_platformapp/screens/screen1.dart';
import 'package:flutter_platformapp/screens/screen2.dart';
import 'package:flutter_platformapp/screens/screen3.dart';

// Styles
final bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getPage(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tabIndex,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
          backgroundColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.grey),
              title: Text('Screen 1', style: bottomNavTextStyle),
              activeIcon: Icon(Icons.business, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey),
              title: Text('Screen 2', style: bottomNavTextStyle),
              activeIcon: Icon(Icons.person, color: Colors.white),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note, color: Colors.grey),
              title: Text(
                'Screen 3',
                style: bottomNavTextStyle,
              ),
              activeIcon: Icon(Icons.note, color: Colors.white),
            )
          ]),
    );
  }

  Widget getPage(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return Screen2();
      case 2:
        return Screen3();
      default:
        return Screen1();
    }
  }
}
