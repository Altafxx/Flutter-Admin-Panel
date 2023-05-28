import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './default.dart';

import './theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.6
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      title: 'Admin Panel',
      theme: lightThemeDataCustom,
      darkTheme: darkThemeDataCustom,
      home: const Default(title: "Home"),
    );
  }
}
