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
  TextSpan TextSpanSpace = const TextSpan(text: "\n\n\n\n\n\n\n\n\n\n");
  SizedBox ContentSpace = const SizedBox();

  @override
  void initState() {
    Timer(const Duration(milliseconds: 9000), () {
      // TODO increase timer
      setState(() {
        homeState.gifBoxWidth = 200;
        homeState.gifBoxHeight = 300;
        showContent = true;
        ContentSpace = const SizedBox(height: 1000);
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
                print(notification);
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
                              milliseconds: 1250), //TODO aumentar a duração
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
                            1400,
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
                      ContentSpace,

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
                                        ? "The beginning\n\n"
                                        : "O início\n\n",
                                    style: AppTextStyles().genericTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),

                                  // Beggining body
                                  TextSpan(
                                    text: preferencesState.language == "english"
                                        ? "For as long as I can remember, I've been interested in computing. Whenever possible, I used my family's computer to access the internet and discover new things.\nMy first contact with development was at the age of 11, when I took a professional computer course, which lasted approximately 1 year.\nIn it, I acquired basic knowledge about design and web development."
                                        : "Desde que me conheço por gente, tenho interesse por computação. Sempre que possível, usava o computador de minha família para acessar a internet e descobrir coisas novas.\nMeu primeiro contato com desenvolvimento foi aos 11 anos de idade, quando fiz um curso profissionalizante de informática, com duração aproximada de 1 ano.\nNele, adquiri conhecimentos básicos a respeito de design e desenvolvimento web.",
                                  ),

                                  // Block spacing
                                  TextSpanSpace,

                                  // First game title
                                  TextSpan(
                                    text: preferencesState.language == "english"
                                        ? "When I had the definitive decision to become a developer.\n\n"
                                        : "Quando tive a decisão definitiva de me tornar um desenvolvedor.\n\n",
                                    style: AppTextStyles().genericTextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),

                                  // First game body
                                  TextSpan(
                                    text: preferencesState.language == "english"
                                        ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras commodo sapien ac nibh rhoncus, eget mattis urna volutpat.\nFusce ut tortor nibh. Nam sit amet finibus mi. Duis justo felis, scelerisque sit amet ex ut, maximus bibendum ligula. Nam ut sem pharetra, vulputate dolor id, mattis magna.\nSed eget purus dui. Curabitur imperdiet enim posuere, euismod metus ut, maximus lorem. Donec posuere sit amet tellus quis sagittis."
                                        : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras commodo sapien ac nibh rhoncus, eget mattis urna volutpat.\nFusce ut tortor nibh. Nam sit amet finibus mi. Duis justo felis, scelerisque sit amet ex ut, maximus bibendum ligula. Nam ut sem pharetra, vulputate dolor id, mattis magna.\nSed eget purus dui. Curabitur imperdiet enim posuere, euismod metus ut, maximus lorem. Donec posuere sit amet tellus quis sagittis.",
                                  ),
                                ],
                              ),
                              style: AppTextStyles().genericTextStyle(),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      ContentSpace,
                      showContent
                          ? Text(
                              preferencesState.language == "english"
                                  ? "Portfolio"
                                  : "Portfólio",
                              style: AppTextStyles().genericTextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : const SizedBox(),
                      showContent
                          ? Text(
                              preferencesState.language == "english"
                                  ? "Website under development. For now, check my Github profile on the link at app bar."
                                  : "Site em desenvolvimento. Por enquanto, cheque meu perfil do Github no link na app bar.",
                              style: AppTextStyles().genericTextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
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
                opacity: showScrollUp ? 1 : 0,
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
