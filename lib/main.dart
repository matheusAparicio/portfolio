import 'package:flutter/material.dart';
import 'package:portfolio/web/ui/pages/home_page/home_page.dart';


void main() {
  runApp(const MyApp());
}
// TODO fazer escolher o idioma antes de começar
// TODO já implementar o mobx
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Aparicio's Portfolio",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}