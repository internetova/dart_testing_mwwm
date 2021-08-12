import 'dart:ui';

import 'package:dart_testing/ui/res/app_colors.dart';
import 'package:flutter/material.dart';

/// Тема приложения
class AppTheme {
  AppTheme();

  static ThemeData buildTheme() {
    final base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.bgButton,
    );
  }

  ///DARK
  static ThemeData buildThemeDark() {
    final base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: AppColors.bgButton,
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

  Color get bgScreenFourLight => AppColors.bgScreenFourLight;

  Color get bgScreenFourDark => AppColors.bgScreenFourDark;

  Color get bgButton => AppColors.bgButton;

  Color get splashButton => AppColors.splashButton;

  Color get bgButtonResponse => AppColors.bgButtonResponse;

  Color get splashButtonResponse => AppColors.splashButtonResponse;

  Color get titleButtonResponse => AppColors.titleButtonResponse;

  Color get dividerButtonResponse => AppColors.dividerButtonResponse;

  Color get colorShadow => AppColors.colorShadow;

  Color get colorIndicatorLight => AppColors.colorIndicatorLight;

  Color get colorIndicatorDark => AppColors.colorIndicatorDark;
}
