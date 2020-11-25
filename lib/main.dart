import 'package:crewnode_switcher/entry.dart';
import 'package:crewnode_switcher/pages/introduction.dart';
import 'package:crewnode_switcher/utils/error_page.dart';
import 'package:flutter/material.dart';
import 'package:crewnode_switcher/system/loader.dart';

// Definitions
final loader = new Loader();

void main() async {
  // Initialise bundles
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise CrewNode
  bool success = await loader.initLoad();
  if (!success) {
    runApp(ErrorApp());
    return;
  }

  // Start our application
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
