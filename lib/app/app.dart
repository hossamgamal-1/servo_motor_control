import 'package:flutter/material.dart';

import '../presentation/app_screen.dart';
import 'app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _myApp = MyApp._internal();

  factory MyApp.getInstance() => _myApp;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Servo Motor App',
      home: const AppPage(),
      theme: getLightTheme(),
    );
  }
}
