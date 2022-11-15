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
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const DarkModeSwitch(),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 50,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              preferencesState.switchLanguage();
                            },
                            child: Lottie.asset(
                              preferencesState.language == "english"
                                  ? "lib/assets/lottie/us_flag.json"
                                  : "lib/assets/lottie/br_flag.json",
                              repeat: false,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Observer(builder: (_) {
                return Text(
                  preferencesState.language == "english"
                      ? "This website is in early development stage."
                      : "Este site está em estado inicial de desenvolvimento.",
                  style: AppTextStyles().genericTextStyle(),
                );
              }),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          await UtilityFunctions().launchURL(
                              "https://www.linkedin.com/in/matheusaps/");
                        },
                        child: SizedBox(
                          height: 50,
                          child: Lottie.asset(
                            "lib/assets/lottie/linkedin.json",
                            repeat: false,
                          ),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          await UtilityFunctions()
                              .launchURL("https://github.com/matheusAparicio");
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors().softWhite,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Lottie.asset(
                            "lib/assets/lottie/github.json",
                            repeat: false,
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
                    1400,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              AppBarTextButton(
                width: 150,
                multilanguageTexts: const {
                  "english": "Home",
                  "portuguese": "Home"
                },
                onTap: () {
                  homeState.scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              AppBarTextButton(
                width: 150,
                multilanguageTexts: const {
                  "english": "Portfolio",
                  "portuguese": "Portfólio"
                },
                onTap: () {
                  homeState.scrollController.animateTo(
                    2890,
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
