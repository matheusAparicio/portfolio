import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/web/mobx_controllers/preferences_controller.dart';
import 'package:portfolio/web/ui/custom_widgets/sequential_buttons.dart';

class HomeAppBar extends StatefulWidget {
  final double appBarHeight;
  const HomeAppBar({Key? key, required this.appBarHeight}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  double usFlagSize = 0;
  double brFlagSize = 0;

  @override
  void initState() {
    usFlagSize = widget.appBarHeight;
    brFlagSize = widget.appBarHeight;
    super.initState();
  }

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
          Switch(
              value: preferencesController.darkMode,
              onChanged: (_) {
                setState(() {
                  preferencesController.switchDarkMode();
                });
              }),
          SequencialButtons(children: [
            SizedBox(
              height: usFlagSize,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      usFlagSize = widget.appBarHeight / 1.5;
                      brFlagSize = widget.appBarHeight;
                    });
                  },
                  child: Lottie.asset(
                    "assets/lottie/us_flag.json",
                    repeat: false,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: brFlagSize,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      brFlagSize = widget.appBarHeight / 1.5;
                      usFlagSize = widget.appBarHeight;
                    });
                  },
                  child: Lottie.asset(
                    "assets/lottie/br_flag.json",
                    repeat: false,
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
