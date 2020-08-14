import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  double _currentValue = 0.0;
  bool _currentSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformSlider(
                min: 0.0,
                max: 100.0,
                value: _currentValue,
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlatformSwitch(
          value: _currentSwitchValue,
          onChanged: (value) {
            setState(() {
              _currentSwitchValue = value;
            });
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlatformTextField(
          keyboardType: TextInputType.text,
          material: (context, platform) {
            return MaterialTextFieldData(
              decoration: InputDecoration(labelText: 'Text Field'),
            );
          },
          cupertino: (context, platform) {
            return CupertinoTextFieldData(
              placeholder: 'Text Field',
            );
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlatformButton(
          onPressed: () {},
          child: Text('Button'),
          material: (context, platform) {
            return MaterialRaisedButtonData();
          },
          cupertino: (context, platform) {
            return CupertinoButtonData();
          },
        ),
      ),
    ]);
  }
}
