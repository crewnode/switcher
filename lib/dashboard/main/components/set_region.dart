import 'package:flutter/material.dart';

class RegionSetter extends StatefulWidget {
  RegionSetter({Key key}) : super(key: key);

  @override
  _RegionSetterState createState() => _RegionSetterState();
}

class _RegionSetterState extends State<RegionSetter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Text('hi'),
    );
  }
}
