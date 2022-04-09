import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utilities/app_colors.dart';
import 'package:portfolio/web/mobx_controllers/home_controller.dart';
import 'package:portfolio/web/mobx_controllers/preferences_controller.dart';
import 'package:portfolio/web/ui/pages/home_page/components/home_app_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double appBarHeight = 80;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 9000), () {
      setState(() {
        homeController.gifBoxWidth = MediaQuery.of(context).size.width * .5;
        homeController.gifBoxHeight = MediaQuery.of(context).size.height * .5;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: preferencesController.darkMode
                ? [
                    AppColors().backgroundDarkGradientBeginColor,
                    AppColors().backgroundDarkGradientEndColor,
                  ]
                : [
                    AppColors().backgroundLightGradientBeginColor,
                    AppColors().backgroundLightGradientEndColor,
                  ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: HomeAppBar(appBarHeight: appBarHeight),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText("Olá",
                            textStyle: GoogleFonts.aubrey(
                                color: Colors.white, fontSize: 20)),
                        FadeAnimatedText("me chamo Matheus",
                            textStyle: GoogleFonts.aubrey(
                                color: Colors.white, fontSize: 20)),
                        FadeAnimatedText("e aqui apresento um pouco de mim!",
                            textStyle: GoogleFonts.aubrey(
                                color: Colors.white, fontSize: 20))
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),
                  Observer(builder: (_) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 2500),
                      width: homeController.gifBoxWidth,
                      height: homeController.gifBoxHeight,
                      // color: Colors.black,
                      alignment: Alignment.center,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child:
                              Lottie.asset("assets/lottie/arrow_down_red.json"),
                        ),
                      ),
                    );
                  })
                ]),
          ),
        ),
      );
    });
  }
}
