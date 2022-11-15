import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/mobx_state/home_state.dart';
import 'package:portfolio/mobx_state/preferences_state.dart';
import 'package:portfolio/ui/web/pages/home_page/components/home_app_bar.dart';
import 'package:portfolio/utilities/app_colors.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  double appBarHeight = 90;
  bool showContent = false;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Timer(const Duration(milliseconds: 8000), () {
      setState(() {
        homeState.gifBoxWidth = 200;
        homeState.gifBoxHeight = 300;
        showContent = true;
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
            colors: preferencesState.darkMode
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
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: showContent ? 5000 : MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                        child: AnimatedTextKit(
                          pause: const Duration(milliseconds: 500), //TODO aumentar a duração
                          animatedTexts: [
                            FadeAnimatedText(preferencesState.language == "english" ? "Greetings" : "Olá",
                                textStyle: GoogleFonts.aubrey(
                                    color: AppColors().softWhite, fontSize: 20),),
                            FadeAnimatedText(preferencesState.language == "english" ? "my name is Matheus" : "me chamo Matheus",
                                textStyle: GoogleFonts.aubrey(
                                    color: AppColors().softWhite, fontSize: 20),),
                            FadeAnimatedText(preferencesState.language == "english" ? "and here I present some of myself!" : "e aqui apresento um pouco de mim!",
                                textStyle: GoogleFonts.aubrey(
                                    color: AppColors().softWhite, fontSize: 20),),
                          ],
                          isRepeatingAnimation: false,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            scrollController.animateTo(1000, duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 2500),
                            width: homeState.gifBoxWidth,
                            height: homeState.gifBoxHeight,
                            alignment: Alignment.center,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                child:
                                    Lottie.asset("assets/lottie/arrow_down_red.json"),
                              ),
                            ),
                          ),
                        ),
                    ]),
              ),
            ),
            HomeAppBar(appBarHeight: appBarHeight),
          ],
        ),
      );
    });
  }
}
