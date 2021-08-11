import 'package:dart_testing/domain/testing.dart';
import 'package:dart_testing/ui/screens/homeScreen/home_screen.dart';
import 'package:dart_testing/ui/screens/resultScreen/result_screen.dart';
import 'package:dart_testing/ui/screens/testingScreen/testing_screen.dart';
import 'package:flutter/material.dart';

/// основные маршруты приложения
class AppRoutes {
  AppRoutes._();

  /// перейти на экран тестирования
  static Future<Object?> goTestingScreen(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const TestingScreen(),
      ),
    );
  }

  /// перейти на экран с результатами
  static Future<Object?> goResultScreen(
    BuildContext context, {
    required ResultTesting resultTesting,
    required List<bool> results,
  }) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          resultTesting: resultTesting,
          results: results,
        ),
      ),
    );
  }

  /// перейти на главный экран
  static Future<Object?> goHomeScreen(BuildContext context) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
