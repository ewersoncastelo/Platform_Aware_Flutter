import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_platformapp/App.dart';

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
      home: App(title: 'Flutter Platform Aware'),
    );
  }
}
