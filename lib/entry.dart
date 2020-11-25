import 'package:crewnode_switcher/pages/dashboard.dart';
import 'package:crewnode_switcher/pages/introduction.dart';
import 'package:crewnode_switcher/pages/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    var builder;

    switch (settings.name) {
      case IntroductionPage.routeName:
        builder = Provider<IntroductionPage>(
          create: (_) => IntroductionPage(),
          builder: (context, _) {
            return context.watch<IntroductionPage>();
          },
        );
        break;
      case Dashboard.routeName:
        builder = Provider<Dashboard>(
          create: (_) => Dashboard(),
          builder: (context, _) {
            return context.watch<Dashboard>();
          },
        );
        break;
      case NewsPage.routeName:
        builder = Provider<NewsPage>(
          create: (_) => NewsPage(),
          builder: (context, _) {
            return context.watch<NewsPage>();
          },
        );
        break;
      default:
        throw new Exception('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute(builder: (context) => builder, settings: settings);
  }
}
