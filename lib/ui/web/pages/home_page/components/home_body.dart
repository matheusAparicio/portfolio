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
import 'package:portfolio/utilities/app_text_styles.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool showContent = false;
  bool showScrollUp = false;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 5000), () {
      // TODO increase timer
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
            NotificationListener(
              onNotification: (notification) {
                if (homeState.scrollController.offset == 0 && showScrollUp) {
                  setState(() {
                    showScrollUp = false;
                  });
                } else if (homeState.scrollController.offset > 0 &&
                    !showScrollUp) {
                  setState(() {
                    showScrollUp = true;
                  });
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: homeState.scrollController,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height:
                      showContent ? 5000 : MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: showContent
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: showContent ? 250 : 0,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                        child: AnimatedTextKit(
                          pause: const Duration(
                              milliseconds: 500), //TODO aumentar a duração
                          animatedTexts: [
                            FadeAnimatedText(
                              preferencesState.language == "english"
                                  ? "Greetings"
                                  : "Olá",
                              textStyle: AppTextStyles().genericTextStyle(),
                            ),
                            FadeAnimatedText(
                              preferencesState.language == "english"
                                  ? "my name is Matheus"
                                  : "me chamo Matheus",
                              textStyle: AppTextStyles().genericTextStyle(),
                            ),
                            FadeAnimatedText(
                              preferencesState.language == "english"
                                  ? "and here I present some of myself!"
                                  : "e aqui apresento um pouco de mim!",
                              textStyle: AppTextStyles().genericTextStyle(),
                            ),
                          ],
                          isRepeatingAnimation: false,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          homeState.scrollController.animateTo(
                            1250,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 2500),
                          width: homeState.gifBoxWidth,
                          height: homeState.gifBoxHeight,
                          alignment: Alignment.center,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              child: Lottie.asset(
                                  "lib/assets/lottie/arrow_down_red.json"),
                            ),
                          ),
                        ),
                      ),

                      // Spacing before text block
                      showContent
                          ? const SizedBox(height: 1000)
                          : const SizedBox(),

                      // First text block
                      showContent
                          ? Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  // Main title
                                  TextSpan(
                                    text: preferencesState.language == "english"
                                        ? "A brief summary of my history in computing:\n\n\n\n\n\n\n"
                                        : "Um breve resumo de minha história na computação:\n\n\n\n\n\n\n",
                                    style: AppTextStyles().genericTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),

                                  // Beggining title
                                  TextSpan(
                                    text: preferencesState.language == "english"
                                        ? "The beggining\n\n"
                                        : "O início\n\n",
                                    style: AppTextStyles().genericTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),

                                  // Beggining body
                                  TextSpan(
                                    text: preferencesState.language == "english"
                                        ? "english text aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
                                        : "Meu primeiro contato com desenvolvimento foi aos 11 anos de idade, quando fiz um curso profissionalizante de informática.\nNele, adquiri conhecimentos básicos a respeito de design e desenvolvimento web.",
                                  ),
                                ],
                              ),
                              style: AppTextStyles().genericTextStyle(),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
            const HomeAppBar(),
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedOpacity(
                opacity: showScrollUp
                    ? 1
                    : 0,
                duration: const Duration(milliseconds: 500),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      homeState.scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 15,
                        bottom: 15,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        size: 60,
                        color: AppColors().softWhite,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
