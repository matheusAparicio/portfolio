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
                            duration: const Duration(milliseconds: 500), // TODO arrumar a hitbox do botão de contato
                            width: preferencesState.showContacts
                                ? MediaQuery.of(context).size.width * .05
                                : MediaQuery.of(context).size.width * .15,
                            child: Row(
                              children: [
                                Text(
                                  "Contato",
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
                              ? MediaQuery.of(context).size.width * .1
                              : 0,
                          duration: const Duration(milliseconds: 500),
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
                                    await UtilityFunctions().launchURL(
                                        "https://github.com/matheusAparicio");
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors().softWhite,
                                      borderRadius: BorderRadius.circular(10),
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
              SizedBox(
                width: MediaQuery.of(context).size.width * .15,
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
                  "english": "Home",
                  "portuguese": "Home"
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
                  "english": "Portfolio",
                  "portuguese": "Portfólio"
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
