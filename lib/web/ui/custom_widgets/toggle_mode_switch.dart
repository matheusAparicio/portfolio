import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/web/mobx_controllers/preferences_controller.dart';

class ToggleModeSwitch extends StatefulWidget {
  const ToggleModeSwitch({Key? key}) : super(key: key);

  @override
  State<ToggleModeSwitch> createState() => _ToggleModeSwitchState();
}

class _ToggleModeSwitchState extends State<ToggleModeSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController toggleLightModeController;

  @override
  void initState() {
    toggleLightModeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      reverseDuration: const Duration(milliseconds: 800),
    );
    toggleLightModeController.animateTo(1, duration: const Duration(milliseconds: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          preferencesController.darkMode = !preferencesController.darkMode;
          preferencesController.darkMode
              ? toggleLightModeController.forward()
              : toggleLightModeController.animateTo(0);
        },
        child: Observer(builder: (_) {
          return Lottie.asset(
            "assets/lottie/toggle_light_mode.json",
            // repeat: false,
            // animate: false,
            controller: toggleLightModeController,
          );
        }),
      ),
    );
  }
}
