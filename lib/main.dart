import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_platformapp/screens/screen1.dart';
import 'package:flutter_platformapp/screens/screen2.dart';
import 'package:flutter_platformapp/screens/screen3.dart';
import 'package:flutter_platformapp/screens/screen4.dart';

final materialThemeData = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  accentColor: Colors.blue,
  appBarTheme: AppBarTheme(color: Colors.blue.shade600),
  primaryColor: Colors.blue,
  secondaryHeaderColor: Colors.blue,
  canvasColor: Colors.blue,
  backgroundColor: Colors.red,
  // textTheme: TextTheme().copyWith(body1: TextTheme().body1),
);
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white);

// Styles
final bottomNavTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarButtonTextStyle = TextStyle(color: Colors.white, fontSize: 14.0);
final toolbarTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      material: (context, platform) {
        return MaterialAppData(theme: materialThemeData);
      },
      cupertino: (context, platform) {
        return CupertinoAppData(theme: cupertinoTheme);
      },
      home: MyHomePage(title: 'Flutter Platform Aware'),
    );
  }
}

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
              Navigator.push(
                context,
                platformPageRoute(
                    builder: (BuildContext context) {
                      return Screen4();
                    },
                    context: context),
              );
            },
            tooltip: 'Screen 4',
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
          )
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
      default:
        return Screen1();
    }
  }
}
