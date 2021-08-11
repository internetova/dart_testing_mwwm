import 'package:dart_testing/domain/testing.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:relation/relation.dart';

/// Страница с результатом тестирования
class ResultPage extends StatelessWidget {
  final StreamedState<ResultTesting> resultTestingState;
  final List<bool> results; // для построения прогресса

  const ResultPage({
    required this.resultTestingState,
    required this.results,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilder<ResultTesting>(
      streamedState: resultTestingState,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const _BuildHeaderResult(),
              const SizedBox(height: 40),
              _BuildNumberQuestions(
                questions: state.numberQuestions.toString(),
              ),
              const SizedBox(width: double.infinity, height: 20),
              _BuildNumberErrors(
                errors: state.numberErrors.toString(),
              ),
              const SizedBox(height: 40),
              _BuildProgress(results: results),
            ],
          ),
        );
      },
    );
  }
}

/// заголовок
class _BuildHeaderResult extends StatelessWidget {
  const _BuildHeaderResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.textResultPageResult,
      style: Theme.of(context).textTheme.headline3,
      textAlign: TextAlign.right,
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
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            questions,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.left,
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
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Theme.of(context).errorColor),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            errors,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Theme.of(context).errorColor),
            textAlign: TextAlign.left,
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
    return ClipRRect(
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
            children: results.map((e) => _BuildColoredBox(isRight: e)).toList(),
          ),
        ],
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
        color: isRight == true ? Colors.green : Colors.red,
        child: const Text(''),
      ),
    );
  }
}
