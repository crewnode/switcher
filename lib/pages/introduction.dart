import 'package:crewnode_switcher/blocs/dashboard.dart';
import 'package:crewnode_switcher/pages/dashboard.dart';
import 'package:crewnode_switcher/system/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crewnode_switcher/utils/intro_items.dart';
import 'package:crewnode_switcher/utils/colours.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_configuration/global_configuration.dart';

class IntroductionPage extends StatelessWidget {
  static const String routeName = "/intro";
  final _pageViewController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color(Colours().darkBlue),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(45),
            margin: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () async {
                GlobalConfiguration().updateValue('introComplete', true);
                await CrewNodeHandler()
                    .getStorage()
                    .writeConfig(GlobalConfiguration().appConfig);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider<DashboardCubit>(
                            create: (context) => DashboardCubit(),
                            child: Dashboard())));
              },
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
      body: Column(
        children: <Widget>[
          Hero(
            tag: "crewnode-logo",
            child: Image.asset(
              'assets/images/crewnode_text.png', // IntroItems.welcomeData[index]['image'],
              width: ScreenUtil().setWidth(326),
              height: ScreenUtil().setHeight(150),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(65)),
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(375),
              decoration: BoxDecoration(
                  color: Color(Colours().averageBlue),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: SafeArea(
                  child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageViewController,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      SizedBox(height: ScreenUtil().setHeight(25)),
                      Text(
                        IntroItems.introData[index]['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        IntroItems.introData[index]['text'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                            IntroItems.introData.length,
                            (indicator) => CupertinoButton(
                              onPressed: () {
                                _pageViewController.animateToPage(indicator,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Column(children: [
                                Text(IntroItems.introData[indicator]['title'],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                                SizedBox(height: ScreenUtil().setHeight(5)),
                                Container(
                                  height: ScreenUtil().setHeight(10),
                                  width: ScreenUtil().setWidth(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: indicator != index
                                        ? Color(0xff3A4653)
                                        : Color(0xffedf1f9),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          if (index < IntroItems.introData.length - 1) {
                            _pageViewController.animateToPage(index + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          } else {
                            GlobalConfiguration()
                                .updateValue('introComplete', true);
                            await CrewNodeHandler()
                                .getStorage()
                                .writeConfig(GlobalConfiguration().appConfig);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BlocProvider<DashboardCubit>(
                                            create: (context) =>
                                                DashboardCubit(),
                                            child: Dashboard())));
                          }
                        },
                        color: index != IntroItems.introData.length - 1
                            ? Colors.transparent
                            : Color(0xff2E4053),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Color(0xff485960),
                          ),
                        ),
                        child: Container(
                          width: ScreenUtil().setWidth(160),
                          height: ScreenUtil().setHeight(40),
                          alignment: Alignment.center,
                          child: Text(
                            index != IntroItems.introData.length - 1
                                ? 'Next'
                                : 'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(25))
                    ],
                  );
                },
                itemCount: IntroItems.introData.length,
              )),
            ),
          )
        ],
      ),
    );
  }
}
