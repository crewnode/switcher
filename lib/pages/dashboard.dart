import 'package:crewnode_switcher/blocs/dashboard.dart';
import 'package:crewnode_switcher/dashboard/bookmarks/bookmarks.dart';
import 'package:crewnode_switcher/dashboard/main/home.dart';
import 'package:crewnode_switcher/dashboard/servers/servers.dart';
import 'package:crewnode_switcher/dashboard/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crewnode_switcher/utils/colours.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);
    return BlocBuilder<DashboardCubit, int>(
      builder: (_, state) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: Scaffold(
            body: _buildContent(state),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: Color(Colours().averageBlue),
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                _changeContent(_, index);
              },
              currentIndex: state,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  title: Column(children: [SizedBox(height: 5), Text('Dashboard', style: TextStyle(fontSize: 10))])
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.storage),
                  title: Column(children: [SizedBox(height: 5), Text('Servers', style: TextStyle(fontSize: 10))])
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  title: Column(children: [SizedBox(height: 5), Text('Bookmarks', style: TextStyle(fontSize: 10))])
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Column(children: [SizedBox(height: 5), Text('Settings', style: TextStyle(fontSize: 10))])
                ),
              ]
            ),
          ),
        );
      }
    );
  }

  void _changeContent(BuildContext context, int index) {
    switch (index) {
      case 0: BlocProvider.of<DashboardCubit>(context).getDashboard(); break;
      case 1: BlocProvider.of<DashboardCubit>(context).getServers(); break;
      case 2: BlocProvider.of<DashboardCubit>(context).getBookmarks(); break;
      case 3: BlocProvider.of<DashboardCubit>(context).getSettings(); break;
    }
  }

  Widget _buildContent(index) {
    switch (index) {
      case 0: return HomePage(); break;
      case 1: return ServersPage(); break;
      case 2: return BookmarksPage(); break;
      case 3: return SettingsPage(); break;
    }
    return null;
  }
}