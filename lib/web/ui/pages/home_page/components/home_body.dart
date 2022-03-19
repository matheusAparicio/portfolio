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
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            child: AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText("Olá", textStyle: GoogleFonts.aubrey(color: Colors.white)),
                FadeAnimatedText("me chamo Matheus", textStyle: GoogleFonts.aubrey(color: Colors.white)),
                FadeAnimatedText("e aqui mostro um pouco de mim.", textStyle: GoogleFonts.aubrey(color: Colors.white))
              ],
            ),
          ), 
          Lottie.asset(
            "assets/lottie/door.json",
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }
}
