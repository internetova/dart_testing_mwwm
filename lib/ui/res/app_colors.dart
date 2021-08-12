import 'package:flutter/material.dart';

/// цвета для расширения темы
class AppColors {
  static const white = Colors.white;

  /// цвета для градиентной заливки фона экранов
  static const bgScreenOneLight = Color(0xFFF4DB20);
  static const bgScreenOneDark = Color(0xFFF59E0B);
  static const bgScreenTwoLight = Color(0xFF9163FB);
  static const bgScreenTwoDark = Color(0xFF5935DE);

  /// нет ошибок в ответах
  static const bgScreenThreeLight = Color(0xFFB2E27B);
  static const bgScreenThreeDark = Color(0xFF025A18);

  /// есть хотя бы 1 ошибка
  static const bgScreenFourLight = Colors.deepOrangeAccent;
  static const bgScreenFourDark = Colors.red;

  /// для кнопок
  static const bgButton = Colors.deepOrange;
  static const splashButton = Colors.limeAccent;

  /// для кнопки ответа
  static const bgButtonResponse = Color(0xFFF9F9F9);
  static const splashButtonResponse = Color(0xFF5935DE);
  static const titleButtonResponse = Color(0xFF656565);
  static const dividerButtonResponse = Color(0xFFE7E6E6);
  static const colorShadow = Color(0x54000000);

  AppColors._();
}
