import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utilities/app_colors.dart';

class AppTextStyles {
  TextStyle genericTextStyle({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
  }) {
    return GoogleFonts.aubrey(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? AppColors().softWhite,
    );
  }
}
