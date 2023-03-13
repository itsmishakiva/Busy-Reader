import 'package:flutter/material.dart';

class AppLightColors extends AppColors {
  const AppLightColors()
      : super(
          backgroundColor: const Color(0xFFFFFFFF),
          cardColor: const Color(0xFFF6F6F6),
          borderColor: const Color(0xFFF2F2F2),
          textFieldColor: const Color(0xFFF9F9F9),
          textColor:  const Color(0xFF282828),
          hintColor: const Color(0xFF8C8C8C),
          textSecondaryColor: const Color(0xFF595858),
          accentColor: const Color(0xFF282828),
        );
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.backgroundColor,
    required this.borderColor,
    required this.cardColor,
    required this.textFieldColor,
    required this.textColor,
    required this.hintColor,
    required this.textSecondaryColor,
    required this.accentColor,
  });

  final Color? backgroundColor;
  final Color? cardColor;
  final Color? borderColor;
  final Color? textFieldColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? textSecondaryColor;
  final Color? accentColor;

  @override
  ThemeExtension<AppColors> copyWith({
    final Color? backgroundColor,
    final Color? borderColor,
    final Color? textFieldColor,
    final Color? cardColor,
    final Color? textColor,
    final Color? hintColor,
    final Color? textSecondaryColor,
    final Color? accentColor,
  }) {
    return AppColors(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardColor: cardColor ?? this.cardColor,
      borderColor: borderColor ?? this.borderColor,
      textFieldColor: textFieldColor ?? this.textFieldColor,
      textColor: textColor ?? this.textColor,
      hintColor: hintColor ?? this.hintColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      accentColor: accentColor ?? this.accentColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
      textFieldColor: Color.lerp(textFieldColor, other.textFieldColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      hintColor: Color.lerp(hintColor, other.hintColor, t),
      textSecondaryColor:
          Color.lerp(textSecondaryColor, other.textSecondaryColor, t),
      accentColor: Color.lerp(accentColor, other.accentColor, t),
    );
  }
}
