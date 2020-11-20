import 'package:crewnode_switcher/pages/dashboard.dart';
import 'package:crewnode_switcher/pages/introduction.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    WidgetBuilder builder;

    switch (settings.name) {
      case '/welcome':
        builder = (BuildContext _) => new IntroductionPage();
        break;
      case '/':
        builder = (BuildContext _) => new Dashboard();
        break;
      default:
        throw new Exception('Invalid route: ${settings.name}');
    }
    return new MaterialPageRoute(builder: builder, settings: settings);
  }
}
