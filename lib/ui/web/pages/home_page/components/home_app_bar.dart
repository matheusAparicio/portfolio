import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/mobx_state/home_state.dart';
import 'package:portfolio/mobx_state/preferences_state.dart';
import 'package:portfolio/ui/web/custom_widgets/app_bar_text_button.dart';
import 'package:portfolio/ui/web/custom_widgets/dark_mode_switch.dart';
import 'package:portfolio/utilities/app_colors.dart';
import 'package:portfolio/utilities/app_text_styles.dart';
import 'package:portfolio/utilities/constants.dart' as constants;
import 'package:portfolio/utilities/utility_functions.dart';

class HomeAppBar extends StatefulWidget {
  final double? appBarHeight;
  const HomeAppBar({Key? key, this.appBarHeight}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  double shadowHeight = 15;
  double secondaryAppBarHeight = 35;

  bool hoveringPortfolio = false;
  bool hoveringContacts = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: (widget.appBarHeight ?? 90) - shadowHeight,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MouseRegion(
                onExit: (event) {
                  preferencesState.showContacts = false;
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .15,
                  height: MediaQuery.of(context).size.height,
                  child: Observer(builder: (_) {
                    return Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (event) {
                            preferencesState.showContacts = true;
                          },
                          child: AnimatedContainer(
                            duration: const Duration(
                                milliseconds:
                                    500), // TODO arrumar a hitbox do botão de contato
                            width: preferencesState.showContacts
                                ? MediaQuery.of(context).size.width * .07
                                : MediaQuery.of(context).size.width * .15,
                            child: Row(
                              children: [
                                Text(
                                  preferencesState.language == "portuguese"
                                      ? "Linguagens"
                                      : "Languages",
                                  style: AppTextStyles().genericTextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                Icon(
                                  preferencesState.showContacts
                                      ? Icons.keyboard_arrow_left
                                      : Icons.keyboard_arrow_right,
                                  color: AppColors().softWhite,
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          width: preferencesState.showContacts
                              ? MediaQuery.of(context).size.width * .08
                              : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    preferencesState.language = "portuguese";
                                  },
                                  child: Text(
                                    "PT-BR",
                                    style: AppTextStyles().genericTextStyle(),
                                  ),
                                ),
                              ),
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    preferencesState.language = "english";
                                  },
                                  child: Text(
                                    "EN-US",
                                    style: AppTextStyles().genericTextStyle(),
                                  ),
                                ),
                              ),
                              // MouseRegion(
                              //   cursor: SystemMouseCursors.click,
                              //   child: GestureDetector(
                              //     onTap: () async {
                              //       await UtilityFunctions().launchURL(
                              //           "https://www.linkedin.com/in/matheusaps/");
                              //     },
                              //     child: SizedBox(
                              //       height: 50,
                              //       child: Lottie.asset(
                              //         "lib/assets/lottie/linkedin.json",
                              //         repeat: false,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // MouseRegion(
                              //   cursor: SystemMouseCursors.click,
                              //   child: GestureDetector(
                              //     onTap: () async {
                              //       await UtilityFunctions().launchURL(
                              //           "https://github.com/matheusAparicio");
                              //     },
                              //     child: Container(
                              //       height: 40,
                              //       decoration: BoxDecoration(
                              //         color: AppColors().softWhite,
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //       child: Lottie.asset(
                              //         "lib/assets/lottie/github.json",
                              //         repeat: false,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Matheus",
                    style: AppTextStyles().genericTextStyle(fontSize: 28),
                  ),
                  Observer(builder: (_) {
                    return Text(
                      preferencesState.language == "english"
                          ? "This website is in early development stage."
                          : "Este site está em estado inicial de desenvolvimento.",
                      style: AppTextStyles().genericTextStyle(),
                    );
                  }),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * .15,
                // color: AppColors().backgroundLightGradientEndColor,
                child: Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) {
                        setState(() {
                          hoveringPortfolio = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          hoveringPortfolio = false;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .075,
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Colors.amberAccent,
                          border: hoveringPortfolio
                              ? Border(
                                  bottom: BorderSide(
                                    color: AppColors().softWhite,
                                  ),
                                )
                              : null,
                        ),
                        child: Text(
                          "Portfólio",
                          style: AppTextStyles().genericTextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          hoveringContacts = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          hoveringContacts = false;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .075,
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent,
                          border: hoveringContacts
                              ? Border(
                                  bottom: BorderSide(
                                    color: AppColors().softWhite,
                                  ),
                                )
                              : null,
                        ),
                        child: Text(
                          "Contato",
                          style: AppTextStyles().genericTextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: secondaryAppBarHeight,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBarTextButton(
                width: 150,
                multilanguageTexts: const {
                  "english": "My history",
                  "portuguese": "Minha história"
                },
                onTap: () {
                  homeState.scrollController.animateTo(
                    constants.MY_HISTORY_OFFSET,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              AppBarTextButton(
                width: 150,
                multilanguageTexts: const {
                  "english": "Part II",
                  "portuguese": "Parte II"
                },
                onTap: () {
                  homeState.scrollController.animateTo(
                    constants.HOME_OFFSET,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              AppBarTextButton(
                width: 150,
                multilanguageTexts: const {
                  "english": "Part III",
                  "portuguese": "Parte III"
                },
                onTap: () {
                  homeState.scrollController.animateTo(
                    constants.PORTFOLIO_OFFSET,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),

        // Custom shadow
        Container(
          width: MediaQuery.of(context).size.width,
          height: shadowHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.2),
                  Colors.transparent,
                ]),
          ),
        ),
      ],
    );
  }
}
