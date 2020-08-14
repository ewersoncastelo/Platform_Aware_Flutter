import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_platformapp/screens/screen1.dart';
import 'package:flutter_platformapp/screens/screen2.dart';
import 'package:flutter_platformapp/screens/screen3.dart';
import 'package:flutter_platformapp/screens/screen4.dart';

import 'screens/screen4.dart';

// Styles
final bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          widget.title,
          style: toolbarTextStyle,
        ),
        cupertino: (context, platform) {
          return CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
            trailing: PlatformButton(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  platformPageRoute(
                    builder: (BuildContext context) {
                      return Screen4();
                    },
                    context: context,
                  ),
                );
              },
            ),
          );
        },
      ),
      material: (context, platform) {
        return MaterialScaffoldData(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("Button Tapped");
            },
            tooltip: 'Screen 5',
            child: Icon(Icons.add),
          ),
        );
      },
      body: getPage(_tabIndex),
      bottomNavBar: PlatformNavBar(
        currentIndex: _tabIndex,
        itemChanged: (index) {
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note, color: Colors.grey),
            title: Text(
              'Screen 4',
              style: bottomNavTextStyle,
            ),
            activeIcon: Icon(Icons.note, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget getPage(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return Screen2();
      case 2:
        return Screen3();
      case 3:
        return Screen4();
      default:
        return Screen1();
    }
  }
}
