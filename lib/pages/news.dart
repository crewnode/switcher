import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crewnode_switcher/utils/colours.dart';

class NewsPage extends StatelessWidget {
  static const String routeName = "/news";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color(Colours().darkBlue),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(45),
            margin: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(15),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(children: <Widget>[
        Hero(
          tag: "crewnode-logo",
          child: Image.asset(
            'assets/images/crewnode_text.png', // IntroItems.welcomeData[index]['image'],
            width: ScreenUtil().setWidth(326),
            height: ScreenUtil().setHeight(150),
          ),
        ),
        SizedBox(height: 65),
      ]),
    );
  }
}
