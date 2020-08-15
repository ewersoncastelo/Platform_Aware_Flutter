import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

PlatformTabController tabController;

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWithPlatformAppBar();
  }
}

class PageWithPlatformAppBar extends StatelessWidget {
  const PageWithPlatformAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 300,
        width: 300,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("A Switch"),
                    ),
                    PlatformSwitch(
                      value: false,
                      onChanged: (value) => {},
                    ),
                    PlatformButton(
                      child: Text("Action Sheet"),
                      onPressed: () {
                        if (Platform.isIOS) {
                          showCupertinoModalPopup<int>(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                title: Text("Some Choice"),
                                actions: [
                                  CupertinoActionSheetAction(
                                    child: Text("One"),
                                    onPressed: () {
                                      Navigator.pop(context, 1);
                                      print(1);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text("Two"),
                                    onPressed: () {
                                      Navigator.pop(context, 2);
                                      print(2);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: Text("Three"),
                                    onPressed: () {
                                      Navigator.pop(context, 3);
                                      print(3);
                                    },
                                  )
                                ],
                              );
                            },
                          );
                        } else {
                          print("Android");
                        }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
