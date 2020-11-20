import 'package:crewnode_switcher/entry.dart';
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
      initialRoute: '/welcome',
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: {
      //   '/welcome': (context) {
      //     return IntroductionPage();
      //   },
      //   '/': (context) {
      //     return BlocProvider(
      //       create: (_) => DashboardCubit(),
      //       child: Dashboard()
      //     );
      //   } 
      // }
    );
  }
}
