import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppAllTextStyles extends AppTextStyles {
  AppAllTextStyles(AppColors colors)
      : super(
          headline1: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w700,
            fontSize: 32,
            height: 40.16 / 32,
            letterSpacing: 0.03,
            color: colors.textColor,
          ),
          headline2: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            height: 25.1 / 20,
            color: colors.textColor,
          ),
          headline3: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 19.6 / 14,
            color: colors.textColor,
          ),
          button: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 19.6 / 16,
            color: colors.backgroundColor,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 18 / 12,
            color: colors.textColor,
          ),
          subtitle: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 1,
            color: colors.hintColor,
          ),
          headline4: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            height: 18 / 12,
            color: colors.textSecondaryColor,
          ),
          infoText: TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w600,
            fontSize: 12,
            height: 20 / 12,
            color: colors.hintColor,
          ),
          bottomNavBarText: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: colors.hintColor,
          ),
        );
}

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.subtitle,
    required this.subtitle2,
    required this.infoText,
    required this.button,
    required this.bottomNavBarText,
  });

  final TextStyle? headline1;
  final TextStyle? headline2;
  final TextStyle? headline3;
  final TextStyle? headline4;
  final TextStyle? subtitle;
  final TextStyle? subtitle2;
  final TextStyle? infoText;
  final TextStyle? button;
  final TextStyle? bottomNavBarText;

  @override
  ThemeExtension<AppTextStyles> copyWith({
    final TextStyle? headline1,
    final TextStyle? headline2,
    final TextStyle? headline3,
    final TextStyle? headline4,
    final TextStyle? button,
    final TextStyle? subtitle,
    final TextStyle? infoText,
    final TextStyle? subtitle2,
    final TextStyle? bottomNavBarText,
  }) {
    return AppTextStyles(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      subtitle2: subtitle2 ?? this.subtitle2,
      button: button ?? this.button,
      subtitle: subtitle ?? this.subtitle,
      headline4: headline4 ?? this.headline4,
      infoText: infoText ?? this.infoText,
      bottomNavBarText: bottomNavBarText ?? this.bottomNavBarText,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
      ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      headline1: TextStyle.lerp(headline1, other.headline1, t),
      headline2: TextStyle.lerp(headline2, other.headline2, t),
      headline3: TextStyle.lerp(headline3, other.headline3, t),
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t),
      button: TextStyle.lerp(button, other.button, t),
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t),
      headline4: TextStyle.lerp(headline4, other.headline4, t),
      infoText: TextStyle.lerp(infoText, other.infoText, t),
      bottomNavBarText:
          TextStyle.lerp(bottomNavBarText, other.bottomNavBarText, t),
    );
  }
}
