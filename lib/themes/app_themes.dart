import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  static const _appLightColors = AppLightColors();
  static final _appLightTextStyles = AppAllTextStyles(_appLightColors);

  static final lightThemeData = ThemeData.light().copyWith(
    scaffoldBackgroundColor: _appLightColors.backgroundColor,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    extensions: [
      _appLightColors,
      _appLightTextStyles,
    ],
  );
}
