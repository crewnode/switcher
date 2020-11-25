import 'package:crewnode_switcher/entry.dart';
import 'package:crewnode_switcher/pages/introduction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CrewNode());
}

class CrewNode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrewNode',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: IntroductionPage.routeName,
      routes: <String, WidgetBuilder>{
        IntroductionPage.routeName: (context) => IntroductionPage(),
      },
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
