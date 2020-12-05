import 'package:crewnode_switcher/system/storage.dart';
import 'package:crewnode_switcher/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:global_configuration/global_configuration.dart';

class RegionSetter extends StatefulWidget {
  RegionSetter({Key key}) : super(key: key);

  @override
  _RegionSetterState createState() => _RegionSetterState();
}

class _RegionSetterState extends State<RegionSetter> {
  var ip = GlobalConfiguration().getValue('ipAddress');
  var port = GlobalConfiguration().getValue('portNumber');

  TextEditingController ipField = TextEditingController();
  TextEditingController portField = TextEditingController();

  _RegionSetterState() {
    if (ip == null) ip = "play.crewno.de";
    if (port == null) port = "22023";

    // Set defaults
    ipField.text = ip;
    portField.text = port;
  }

  setServer() {
    // Update configuration
    if (GlobalConfiguration().appConfig.containsKey('ipAddress')) {
      GlobalConfiguration().updateValue('ipAddress', ip);
      GlobalConfiguration().updateValue('portNumber', port);
    } else {
      // Add configuration
      GlobalConfiguration().addValue('ipAddress', ip);
      GlobalConfiguration().addValue('portNumber', port);
    }

    // Set configuration file
    Storage().writeConfig(GlobalConfiguration().appConfig);

    // Show toast
    Fluttertoast.showToast(
      msg: '$ip:$port\nhas been set!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color(Colours().lightBlue),
      textColor: Colors.white,
      fontSize: ScreenUtil().setSp(16),
    );
  }

  List<Widget> getServerHistory() {
    List<String> servers = [
      "127.0.0.1:22023",
      "192.168.2.1:22023",
      "192.168.1.3",
      "107.170.12.80",
      "play.crewno.de",
      "play.crewnode.net",
      "127.0.0.1:22023",
      "192.168.2.1:22023",
      "192.168.1.3",
      "107.170.12.80",
      "play.crewno.de",
      "play.crewnode.net",
    ];

    List<Widget> builtWidgets = new List<Widget>();
    for (String s in servers) {
      builtWidgets.add(InkWell(
          onTap: () {
            setState(() {
              if (s.contains(":")) {
                ip = s.split(":")[0];
                port = s.split(":")[1];
              } else {
                ip = s;
                port = "22023";
              }

              ipField.text = ip;
              portField.text = port;
            });
          },
          child: Row(children: [
            SizedBox(
                height: ScreenUtil().setHeight(40),
                width: ScreenUtil().setWidth(3)),
            Text(s, style: TextStyle(color: Colors.white)),
          ])));
    }

    return builtWidgets;
  }

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
                          controller: ipField,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            this.setState(() {
                              ip = text;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Server IP Address or Domain',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(Icons.wifi, color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () => ipField.clear(),
                                icon: Icon(Icons.clear, color: Colors.white24),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white)))),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      TextField(
                          style: TextStyle(
                              color: Colors.white,
                              decorationColor: Colors.white),
                          cursorColor: Colors.white,
                          controller: portField,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            this.setState(() {
                              port = text;
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Server Port',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(Icons.add, color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () => portField.clear(),
                                icon: Icon(Icons.clear, color: Colors.white24),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white24)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white)))),
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
                              onPressed: () {
                                // TODO: Run set button first (domain lookup)
                                // TODO: Check if bookmark exists
                                Fluttertoast.showToast(
                                  msg: '$ip:$port\nadded to bookmarks!',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Color(Colours().lightBlue),
                                  textColor: Colors.white,
                                  fontSize: ScreenUtil().setSp(16),
                                );
                              }),
                          Spacer(),
                          FlatButton.icon(
                              key: Key('setServerBtn'),
                              onPressed: () => setServer(),
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
                      ),
                      Column(
                        children: <Widget>[
                          Divider(
                            height: ScreenUtil().setHeight(15),
                            thickness: ScreenUtil().setSp(2),
                            color: Color(Colours().averageBlue),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(10)),
                          Row(children: <Widget>[
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Text('Server History',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ]),
                          SizedBox(height: ScreenUtil().setHeight(15)),
                          SizedBox(
                            // TODO: Figure out a way for this sized box to stretch for all sizes
                            height: ScreenUtil().setHeight(275),
                            child: ListView(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              children: getServerHistory(),
                            ),
                          ),
                        ],
                      )
                    ])))
      ],
    ));
  }
}
