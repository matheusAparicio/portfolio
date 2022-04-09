import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/web/mobx_controllers/preferences_controller.dart';
import 'package:portfolio/web/ui/custom_widgets/sequential_buttons.dart';
import 'package:portfolio/web/ui/custom_widgets/toggle_mode_switch.dart';

class HomeAppBar extends StatefulWidget {
  final double appBarHeight;
  const HomeAppBar({Key? key, required this.appBarHeight}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  double usFlagSize = 0;
  double brFlagSize = 0;
  double flagUnselectedSize = 0;
  double flagSelectedSize = 0;

  @override
  void initState() {
    flagSelectedSize = widget.appBarHeight / 1.8;
    flagUnselectedSize = widget.appBarHeight / 1.4;
    usFlagSize = flagSelectedSize;
    brFlagSize = flagUnselectedSize;
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
          const ToggleModeSwitch(),
          SequencialButtons(children: [
            SizedBox(
              height: usFlagSize,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      usFlagSize = flagSelectedSize;
                      brFlagSize = flagUnselectedSize;
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
                      brFlagSize = flagSelectedSize;
                      usFlagSize = flagUnselectedSize;
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
