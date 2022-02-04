import 'package:flutter/material.dart';
import 'package:portfolio/ui/web/pages/home_page/components/home_app_bar_component.dart';
import 'package:portfolio/ui/web/pages/home_page/components/home_body_component.dart';
import 'package:portfolio/ui/web/pages/home_page/components/home_bottom_bar_component.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: HomeAppBarComponent(),
      ),
      body: HomeBodyComponent(),
      bottomNavigationBar: HomeBottomBarComponent(),
    );
  }
}
