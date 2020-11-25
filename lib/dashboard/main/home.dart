import 'package:crewnode_switcher/dashboard/main/components/dashboard_appbar.dart';
import 'package:flutter/material.dart';
import 'package:crewnode_switcher/utils/colours.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
        backgroundColor: Color(Colours().darkBlue),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                constraints: BoxConstraints(maxWidth: 632),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                        titleSpacing: 10,
                        backgroundColor: Colors.transparent,
                        title: DashboardAppBar(),
                        pinned: true)
                  ],
                )))
        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: <Widget>[
        //     Column(
        //       children: <Widget>[
        //         SizedBox(height: ScreenUtil().setHeight(35)),
        //         Hero(
        //           tag: "crewnode-logo",
        //           child: Image.asset(
        //             'assets/images/crewnode_text.png',
        //             width: ScreenUtil().setWidth(325),
        //             height: ScreenUtil().setHeight(75),
        //           ),
        //         ),
        //       ]
        //     )
        //   ],
        // ),
        );
  }
}
