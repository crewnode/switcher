import 'package:crewnode_switcher/system/loader.dart';
import 'package:crewnode_switcher/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext diagCtx) {
                    return SimpleDialog(
                      title: Text('Are you sure?'),
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              left: ScreenUtil().setSp(15),
                              right: ScreenUtil().setSp(15),
                              top: ScreenUtil().setSp(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Clearing the configuration will reset this application back to its default settings.',
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: ScreenUtil().setHeight(25)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlatButton.icon(
                                        onPressed: () {
                                          Navigator.of(diagCtx).pop();
                                        },
                                        icon: Icon(Icons.cancel),
                                        color: Colors.transparent,
                                        textColor: Colors.grey,
                                        label: Text('Cancel')),
                                    SizedBox(width: ScreenUtil().setWidth(25)),
                                    FlatButton.icon(
                                        onPressed: () {
                                          CrewNodeHandler()
                                              .getStorage()
                                              .resetConfig();
                                          Navigator.of(diagCtx).pop();
                                          Fluttertoast.showToast(
                                            msg:
                                                'The configuration has been reset.',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor:
                                                Color(Colours().lightBlue),
                                            textColor: Colors.white,
                                            fontSize: ScreenUtil().setSp(16),
                                          );
                                        },
                                        icon: Icon(Icons.check),
                                        color: Colors.green,
                                        textColor: Colors.white,
                                        label: Text('Clear')),
                                  ],
                                )
                              ],
                            ))
                      ],
                      // content: Column(children: <Widget>[]),
                    );
                  });
            },
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
            onTap: () {
              // TODO: Implement
              Fluttertoast.showToast(
                msg: 'We do not currently support other languages.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Color(Colours().lightBlue),
                textColor: Colors.white,
                fontSize: ScreenUtil().setSp(16),
              );
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Change language',
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
            onTap: () async {
              const url = 'https://crewnode.net/app/discord';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                Fluttertoast.showToast(
                  msg: 'Unable to launch browser! :(',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Color(Colours().lightBlue),
                  textColor: Colors.white,
                  fontSize: ScreenUtil().setSp(16),
                );
              }
            },
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
            onTap: () async {
              const url = 'https://crewnode.net/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                Fluttertoast.showToast(
                  msg: 'Unable to launch browser! :(',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Color(Colours().lightBlue),
                  textColor: Colors.white,
                  fontSize: ScreenUtil().setSp(16),
                );
              }
            },
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
            onTap: () async {
              const url = 'https://crewnode.net/app/github';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                Fluttertoast.showToast(
                  msg: 'Unable to launch browser! :(',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Color(Colours().lightBlue),
                  textColor: Colors.white,
                  fontSize: ScreenUtil().setSp(16),
                );
              }
            },
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
      ],
    ));
  }
}
