import 'package:crewnode_switcher/dashboard/bookmarks/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crewnode_switcher/utils/colours.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
        backgroundColor: Color(Colours().darkBlue),
        appBar: AppBar(
            titleSpacing: ScreenUtil().setSp(10),
            automaticallyImplyLeading: false,
            backgroundColor: Color(Colours().darkBlue),
            elevation: 0,
            title: BookmarkAppBar()),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setSp(15)),
                child: Column(
                  children: [],
                ))));
  }
}
