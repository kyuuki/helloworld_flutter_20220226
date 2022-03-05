import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Hello, world!';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,  // What is this? (https://stackoverflow.com/questions/50615006/flutter-where-is-the-title-of-material-app-used)
      home: Center(
        child: Text("hello, world")
      )
    );
  }
}
