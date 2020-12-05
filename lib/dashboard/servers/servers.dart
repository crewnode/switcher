import 'package:crewnode_switcher/dashboard/servers/components/appbar.dart';
import 'package:crewnode_switcher/dashboard/servers/components/tab_bar.dart';
import 'package:crewnode_switcher/system/api/servers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crewnode_switcher/utils/colours.dart';

class ServersPage extends StatefulWidget {
  const ServersPage({Key key}) : super(key: key);

  @override
  _ServersPageState createState() => _ServersPageState();
}

class _ServersPageState extends State<ServersPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  Map<String, dynamic> servers;
  bool _progressController = true;
  Map<String, bool> shownServers = Map<String, bool>();

  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);
    super.initState();
    grabServers();
  }

  grabServers() async {
    servers = await Servers().getServers();
    setState(() {
      _progressController = false;
    });
  }

  Widget getIndicator() {
    if (!this._progressController) {
      return Row();
    }

    return Column(children: [
      SizedBox(height: ScreenUtil().setHeight(50)),
      CircularProgressIndicator(
          backgroundColor: Color(Colours().averageBlue),
          valueColor:
              AlwaysStoppedAnimation<Color>(Color(Colours().lightBlue))),
      SizedBox(height: ScreenUtil().setHeight(25)),
      Text('Loading', style: TextStyle(color: Color(Colours().lightBlue))),
    ]);
  }

  List<Widget> getServerData() {
    if (this._progressController) return [];

    List<Widget> srvs = <Widget>[];
    for (Map<String, dynamic> server in servers['servers']) {
      if (!shownServers.containsKey(server['uuid'])) {
        shownServers[server['uuid']] = false;
      }

      srvs.add(Column(key: Key(server['uuid']), children: [
        GestureDetector(
            onTap: () {
              print("Pressed ${server['uuid']}");
              setState(() {
                bool valBefore = this.shownServers[server['uuid']];
                for (String uuid in this.shownServers.keys) {
                  this.shownServers[uuid] = false;
                }

                this.shownServers[server['uuid']] = !valBefore;
              });
            },
            child: Column(children: [
              Row(
                children: [
                  Text(server['name'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: this.shownServers[server['uuid']]
                              ? FontWeight.bold
                              : FontWeight.normal)),
                  SizedBox(width: ScreenUtil().setWidth(5)),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        color: Color(0xff2b3044),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: ScreenUtil().setSp(14),
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Text("${server['players']} / ${server['max_players']}",
                            style: TextStyle(color: Colors.white, fontSize: 12))
                      ])),
                ],
              ),
              Visibility(
                  visible: shownServers[server['uuid']],
                  child: Container(
                    child: Row(children: [
                      Text(server['description'],
                          style: TextStyle(color: Colors.grey)),
                    ]),
                  )),
            ])),
        Divider(
          color: Color(Colours().averageBlue),
          thickness: 1,
          height: ScreenUtil().setHeight(30),
        )
      ]));
    }

    return srvs;
  }

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
            title: ServersAppBar()),
        body: SafeArea(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setSp(15), right: ScreenUtil().setSp(15)),
              child: Column(children: [
                ServersTabBar(tabController: this._tabController)
              ])),
          getIndicator(),
          Expanded(
              child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.all(ScreenUtil().setSp(15)),
                  children: getServerData()))
        ])));
  }
}
