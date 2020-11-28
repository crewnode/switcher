import 'package:crewnode_switcher/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingList extends StatelessWidget {
  const SettingList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Manage the CrewNode application settings here.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70)),
        SizedBox(height: ScreenUtil().setHeight(35)),
        Row(children: <Widget>[
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: ScreenUtil().setWidth(10)),
          Text('General',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ]),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Divider(
          height: ScreenUtil().setHeight(15),
          thickness: ScreenUtil().setSp(2),
          color: Color(Colours().averageBlue),
        ),
        SizedBox(height: ScreenUtil().setHeight(15)),
        GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('Reset configuration',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[100],
                size: ScreenUtil().setSp(18),
              )
            ])),
        SizedBox(height: ScreenUtil().setHeight(25)),
        GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('Change Language',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[100],
                size: ScreenUtil().setSp(18),
              )
            ])),
        SizedBox(height: ScreenUtil().setHeight(50)),
        Row(children: <Widget>[
          Image.asset('assets/images/crewnode_icon.png',
              width: ScreenUtil().setWidth(30)),
          SizedBox(width: ScreenUtil().setWidth(10)),
          Text('CrewNode',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ]),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Divider(
          height: ScreenUtil().setHeight(15),
          thickness: ScreenUtil().setSp(2),
          color: Color(Colours().averageBlue),
        ),
        SizedBox(height: ScreenUtil().setHeight(25)),
        GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('Discord',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[100],
                size: ScreenUtil().setSp(18),
              )
            ])),
        SizedBox(height: ScreenUtil().setHeight(25)),
        GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('Website',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[100],
                size: ScreenUtil().setSp(18),
              )
            ])),
        SizedBox(height: ScreenUtil().setHeight(25)),
        GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('GitHub',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[100],
                size: ScreenUtil().setSp(18),
              )
            ])),
        SizedBox(height: ScreenUtil().setHeight(25)),
        GestureDetector(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text('Terms and Conditions',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[100],
                size: ScreenUtil().setSp(18),
              )
            ])),
      ],
    ));
  }
}
