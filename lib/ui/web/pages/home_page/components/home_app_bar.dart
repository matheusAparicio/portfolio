import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/mobx_state/preferences_state.dart';
import 'package:portfolio/ui/web/custom_widgets/dark_mode_switch.dart';
import 'package:portfolio/utilities/app_colors.dart';
import 'package:portfolio/utilities/utility_functions.dart';

class HomeAppBar extends StatefulWidget {
  final double appBarHeight;
  const HomeAppBar({Key? key, required this.appBarHeight}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: widget.appBarHeight - 15,
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
              Text(
                preferencesState.language == "english"
                    ? "This website is in early development stage."
                    : "Este site está em estado inicial de desenvolvimento.",
                style: GoogleFonts.aubrey(
                    color: AppColors().softWhite, fontSize: 20),
              ),
              SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () async {
                          await UtilityFunctions().launchURL("https://www.linkedin.com/in/matheusaps/");
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
                          await UtilityFunctions().launchURL("https://github.com/matheusAparicio");
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
          width: MediaQuery.of(context).size.width,
          height: 15,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(.2),
                  Colors.transparent,
                ]),
          ),
        )
      ],
    );
  }
}
