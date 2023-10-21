import 'package:flutter/material.dart';
import 'package:movies_app/Views/searchScreen.dart';
import 'package:movies_app/Widgets/widget_navBar.dart';

import 'Views/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black
      ),
      home: NavBar(),
    );
  }
}
