import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utilities/app_colors.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  void initState() {
    Timer(const Duration(milliseconds: 9000), () {
      setState(() {
        boxWidth = 650;
        boxHeight = 300;
      });
      print("Cabô");
    });
    super.initState();
  }

  double boxWidth = 0;
  double boxHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText("Olá", textStyle: GoogleFonts.aubrey(color: Colors.white)),
                FadeAnimatedText("me chamo Matheus", textStyle: GoogleFonts.aubrey(color: Colors.white)),
                FadeAnimatedText("e aqui mostro um pouco de mim.", textStyle: GoogleFonts.aubrey(color: Colors.white))
              ],
              isRepeatingAnimation: false,
            ),
          ), 
          AnimatedContainer(
            duration: const Duration(milliseconds: 2500),
            width: boxWidth,
            height: boxHeight,
            alignment: Alignment.center,
            child: boxWidth > 0 ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  "assets/lottie/door.json",
                  width: 200,
                  height: 200,
                  animate: false,
                  // fit: BoxFit.fitWidth
                ),
                Lottie.asset(
                  "assets/lottie/door.json",
                  width: 200,
                  height: 200,
                  animate: false,
                  // fit: BoxFit.fitWidth
                ),
                Lottie.asset(
                  "assets/lottie/door.json",
                  width: 200,
                  height: 200,
                  animate: false,
                  // fit: BoxFit.fitWidth
                ),
              ],
            ) : const Center(),
          ),
        ],
      ),
    );
  }
}
