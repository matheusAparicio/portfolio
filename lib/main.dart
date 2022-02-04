import 'package:flutter/material.dart';
import 'package:portfolio/ui/web/pages/home_page/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Aparicio's Portfolio",
      home: HomePage(),
    );
  }
}
