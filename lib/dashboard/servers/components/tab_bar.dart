import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServersTabBar extends StatelessWidget {
  final TabController tabController;
  final Function onTap;

  const ServersTabBar({Key key, this.tabController, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      onTap: this.onTap,
      isScrollable: true,
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      indicatorWeight: 2.0,
      unselectedLabelColor: Colors.grey,
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      tabs: <Widget>[
        Tab(child: Text('All', style: TextStyle(fontWeight: FontWeight.w600))),
        Tab(
            child: Text('Featured',
                style: TextStyle(fontWeight: FontWeight.w600))),
        Tab(
            child:
                Text('Popular', style: TextStyle(fontWeight: FontWeight.w600))),
        Tab(child: Text('New', style: TextStyle(fontWeight: FontWeight.w600))),
        Tab(
            child: Text('Low Ping',
                style: TextStyle(fontWeight: FontWeight.w600))),
        Tab(
            child: Text('Top Picks',
                style: TextStyle(fontWeight: FontWeight.w600))),
        Tab(
            child: Text('CrewNode',
                style: TextStyle(fontWeight: FontWeight.w600))),
        Tab(
            child: Text('Skeld.net',
                style: TextStyle(fontWeight: FontWeight.w600))),
      ],
    );
  }
}
