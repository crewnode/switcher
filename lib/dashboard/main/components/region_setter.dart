import 'package:crewnode_switcher/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegionSetter extends StatefulWidget {
  RegionSetter({Key key}) : super(key: key);

  @override
  _RegionSetterState createState() => _RegionSetterState();
}

class _RegionSetterState extends State<RegionSetter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Container(
            child: Theme(
                data: ThemeData(
                  primaryColor: Colors.white,
                  primaryColorDark: Colors.white54,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'Set the IP Address and Port to connect to a custom Among Us server that you want to join.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(
                      height: ScreenUtil().setHeight(25),
                    ),
                    TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          // TODO: Update State
                          print("IP changed to $text");
                        },
                        decoration: InputDecoration(
                            labelText: 'Server IP Address',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.wifi, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)))),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    TextField(
                        style: TextStyle(
                            color: Colors.white, decorationColor: Colors.white),
                        cursorColor: Colors.white,
                        controller: TextEditingController()..text = '22023',
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          // TODO: Update State
                          print("Port changed to $text");
                        },
                        decoration: InputDecoration(
                            labelText: 'Server Port',
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.add, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)))),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                            hoverElevation: 0,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            focusColor: Color(Colours().averageBlue),
                            hoverColor: Color(Colours().averageBlue),
                            splashColor: Color(Colours().averageBlue),
                            child: Icon(Icons.bookmark, color: Colors.white),
                            onPressed: () {}),
                        Spacer(),
                        FlatButton.icon(
                            key: Key('setServerBtn'),
                            onPressed: () {
                              print("set btn pressed");
                            },
                            padding: EdgeInsets.fromLTRB(
                                ScreenUtil().setSp(15.0),
                                ScreenUtil().setSp(7.5),
                                ScreenUtil().setSp(15.0),
                                ScreenUtil().setSp(7.5)),
                            color: Color(Colours().averageBlue),
                            icon: Icon(Icons.swap_horiz, color: Colors.white),
                            label: Text('Set',
                                style: TextStyle(color: Colors.white))),
                      ],
                    )
                  ],
                )))
      ],
    ));
  }
}
