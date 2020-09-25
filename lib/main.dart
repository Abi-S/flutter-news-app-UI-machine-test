import 'package:flutter/material.dart';
import 'package:news_project/routes.dart';
import 'package:news_project/utils/helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.gernerateRoutes,
      theme: ThemeData(primaryColor: Helper.purple, fontFamily: 'Gothic'),
    );
  }
}
