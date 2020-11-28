import 'dart:convert';

import 'package:flutter/services.dart';

class Servers {
  // Make this class a singleton
  static final Servers _singleton = Servers._internal();
  factory Servers() {
    return _singleton;
  }
  Servers._internal();

  Future<Map<String, dynamic>> getServers() async {
    String dummyData =
        await rootBundle.loadString('assets/dummy-api/servers.json');
    Map<String, dynamic> data = json.decode(dummyData);
    return data;
  }
}
