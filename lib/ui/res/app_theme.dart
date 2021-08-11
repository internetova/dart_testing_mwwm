import 'dart:ui';

import 'package:dart_testing/ui/res/app_colors.dart';
import 'package:flutter/material.dart';

/// Тема приложения
class AppTheme {
  AppTheme();

  static ThemeData buildTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,
    );
  }

  ///DARK
  static ThemeData buildThemeDark() {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,
    );
  }
}

/// постоянные цвета в обоих темах
extension CustomColorScheme on ColorScheme {
  Color get white => AppColors.white;

  Color get bgScreenOneLight => AppColors.bgScreenOneLight;

  Color get bgScreenOneDark => AppColors.bgScreenOneDark;

  Color get bgScreenTwoLight => AppColors.bgScreenTwoLight;

  Color get bgScreenTwoDark => AppColors.bgScreenTwoDark;

  Color get bgScreenThreeLight => AppColors.bgScreenThreeLight;

  Color get bgScreenThreeDark => AppColors.bgScreenThreeDark;

  Color get bgButton => AppColors.bgButton;

  Color get splashButton => AppColors.splashButton;
}
