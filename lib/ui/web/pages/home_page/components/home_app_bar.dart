import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/mobx_controllers/preferences_controller.dart';
import 'package:portfolio/ui/web/custom_widgets/dark_mode_switch.dart';

class HomeAppBar extends StatefulWidget {
  final double appBarHeight;
  const HomeAppBar({Key? key, required this.appBarHeight}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.appBarHeight,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .1),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DarkModeSwitch(),
          Observer(builder: (_) {
            return SizedBox(
              height: widget.appBarHeight / 1.5,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    preferencesController.switchLanguage();
                  },
                  child: Lottie.asset(
                    preferencesController.language == "english" ? "assets/lottie/us_flag.json" : "assets/lottie/br_flag.json",
                    repeat: false,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
