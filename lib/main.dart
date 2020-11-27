import 'package:crewnode_switcher/blocs/dashboard.dart';
import 'package:crewnode_switcher/entry.dart';
import 'package:crewnode_switcher/pages/dashboard.dart';
import 'package:crewnode_switcher/pages/introduction.dart';
import 'package:crewnode_switcher/utils/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crewnode_switcher/system/loader.dart';

// Definitions
final handler = CrewNodeHandler();

void main() async {
  // Initialise bundles
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise CrewNode
  bool success = await handler.initLoad();
  if (!success) {
    runApp(ErrorApp());
    return;
  }

  // Start our application
  Map<String, dynamic> conf = await CrewNodeHandler().getConfig();
  runApp(CrewNode(conf: conf));
}

class CrewNode extends StatelessWidget {
  final Map<String, dynamic> conf;
  CrewNode({this.conf});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrewNode',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: !conf['introComplete']
          ? IntroductionPage.routeName
          : Dashboard.routeName,
      routes: <String, WidgetBuilder>{
        IntroductionPage.routeName: (context) => IntroductionPage(),
        Dashboard.routeName: (context) => BlocProvider<DashboardCubit>(
            create: (context) => DashboardCubit(), child: Dashboard())
      },
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
