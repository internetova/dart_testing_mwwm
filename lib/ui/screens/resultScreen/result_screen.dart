import 'package:dart_testing/domain/testing.dart';
import 'package:dart_testing/ui/res/app_routes.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/widgets/background_screen.dart';
import 'package:dart_testing/ui/widgets/content_wrapper.dart';
import 'package:dart_testing/ui/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:dart_testing/ui/res/app_theme.dart';

/// Экран с результатами
/// [resultTesting]
/// [results] - для построения прогресса
class ResultScreen extends StatelessWidget {
  final ResultTesting resultTesting;
  final List<bool> results;

  const ResultScreen({
    required this.resultTesting,
    required this.results,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        colorOne: _getColorScreen(
          colorCorrect: Theme.of(context).colorScheme.bgScreenThreeDark,
          colorError: Theme.of(context).colorScheme.bgScreenFourDark,
        ),
        colorTwo: _getColorScreen(
          colorCorrect: Theme.of(context).colorScheme.bgScreenThreeLight,
          colorError: Theme.of(context).colorScheme.bgScreenFourLight,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              ContentWrapper(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const _BuildHeaderResult(),
                    const SizedBox(height: 40),
                    _BuildNumberQuestions(
                      questions: resultTesting.numberQuestions.toString(),
                    ),
                    const SizedBox(width: double.infinity, height: 20),
                    _BuildNumberErrors(
                      errors: resultTesting.numberErrors.toString(),
                    ),
                    const SizedBox(height: 40),
                    _BuildProgress(results: results),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: RoundButton(
        title: AppStrings.buttonLabelRepeat,
        onPressed: () => AppRoutes.goTestingScreen(context),
        size: 100,
        fontSize: 18,
      ),
    );
  }

  /// цвета в зависимости от наличия ошибок в ответах
  Color _getColorScreen({
    required Color colorCorrect,
    required Color colorError,
  }) {
    return resultTesting.numberErrors == 0 ? colorCorrect : colorError;
  }
}

/// заголовок
class _BuildHeaderResult extends StatelessWidget {
  const _BuildHeaderResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(
        AppStrings.textResultPageResult,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// количество вопросов
class _BuildNumberQuestions extends StatelessWidget {
  final String questions;

  const _BuildNumberQuestions({
    required this.questions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            AppStrings.textResultPageQuestions,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.titleButtonResponse,
                ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            questions,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// количество ошибок
class _BuildNumberErrors extends StatelessWidget {
  final String errors;

  const _BuildNumberErrors({
    required this.errors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            AppStrings.textResultPageErrors,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.titleButtonResponse,
                ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            errors,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Theme.of(context).colorScheme.bgScreenFourDark,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// шкала результатов
class _BuildProgress extends StatelessWidget {
  final List<bool> results;

  const _BuildProgress({
    required this.results,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(),
              width: double.infinity,
              height: 16,
            ),
            Row(
              children:
                  results.map((e) => _BuildColoredBox(isRight: e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

/// цвет для шкалы прогресса
/// [isRight] - правильный ответ
class _BuildColoredBox extends StatelessWidget {
  final bool isRight;

  const _BuildColoredBox({
    required this.isRight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: isRight == true
            ? Theme.of(context).colorScheme.bgScreenTwoLight
            : Theme.of(context).colorScheme.bgScreenFourDark,
        child: const Text(''),
      ),
    );
  }
}
