import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/mobx_state/preferences_state.dart';
import 'package:portfolio/utilities/app_colors.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        // width: preferencesState.showSettingsMenu ? 200 : 0,
        // height: preferencesState.showSettingsMenu ? 300 : 0,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .07,
          top: 24,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors().softBlack,
          ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors().backgroundDarkGradientEndColor,
                AppColors().backgroundDarkGradientBeginColor,
              ]),
        ),
      );
    });
  }
}
