import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

extension ThemePicker on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
}