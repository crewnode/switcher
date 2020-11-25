import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  final appTitle = "An error has occurred!";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primarySwatch: Colors.red),
      home: ErrorPage(title: appTitle),
    );
  }
}

class ErrorPage extends StatefulWidget {
  ErrorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("An error has occurred!"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("There was an error initialising this application.")],
        ),
      ),
    );
  }
}
