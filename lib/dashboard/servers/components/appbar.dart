import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServersAppBar extends StatelessWidget {
  const ServersAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: <Widget>[
            SizedBox(width: ScreenUtil().setWidth(10)),
            Text('Servers', style: TextStyle(color: Colors.white)),
            Spacer(),
            Container(
                width: 90,
                child: Hero(
                  tag: "crewnode-logo",
                  child: Image.asset(
                    'assets/images/crewnode_text.png', // IntroItems.welcomeData[index]['image'],
                    width: ScreenUtil().setWidth(326),
                    height: ScreenUtil().setHeight(150),
                  ),
                )),
            SizedBox(width: ScreenUtil().setWidth(10))
          ],
        ));
  }
}
