import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolio/mobx_state/preferences_state.dart';
import 'package:portfolio/utilities/app_colors.dart';
import 'package:portfolio/utilities/app_text_styles.dart';

class AppBarTextButton extends StatefulWidget {
  final Map<String, String> multilanguageTexts;
  final double? width;
  final double? height;
  final Function()? onTap;
  const AppBarTextButton({
    Key? key,
    required this.multilanguageTexts,
    this.width,
    this.height,
    this.onTap,
  }) : super(key: key);

  @override
  State<AppBarTextButton> createState() => _AppBarTextButtonState();
}

class _AppBarTextButtonState extends State<AppBarTextButton> {
  bool mouseHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          mouseHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          mouseHover = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: widget.width ?? 120,
          height: widget.height ?? 35,
          decoration: BoxDecoration(
            border: mouseHover
                ? Border(
                    bottom: BorderSide(
                      color: AppColors().softWhite,
                    ),
                  )
                : null,
          ),
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Observer(builder: (_) {
            return Text(
              widget.multilanguageTexts[preferencesState.language]!,
              style: AppTextStyles().genericTextStyle(),
            );
          }),
        ),
      ),
    );
  }
}
