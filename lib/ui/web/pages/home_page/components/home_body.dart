import 'package:flutter/material.dart';
import 'package:portfolio/utilities/app_colors.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors().backgroundDarkGradientBeginColor,
            AppColors().backgroundDarkGradientEndColor,
          ],
        ),
      ),
    );
  }
}
