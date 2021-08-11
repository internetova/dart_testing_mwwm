import 'package:dart_testing/ui/screens/homeScreen/home_screen.dart';
import 'package:dart_testing/ui/screens/resultScreen/result_screen.dart';
import 'package:dart_testing/ui/screens/testingScreen/testing_screen.dart';
import 'package:flutter/material.dart';

/// основные маршруты приложения
class AppRoutes {
  /// перейти на экран тестирования
  static Future<Object?> goTestingScreen(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TestingScreen(),
      ),
    );
  }

  /// перейти на экран с результатами
  static Future<Object?> goResultScreen(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(),
      ),
    );
  }

  /// перейти на главный экран
  static Future<Object?> goHomeScreen(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  AppRoutes._();
}