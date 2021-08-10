import 'package:dart_testing/domain/testing.dart';
import 'package:flutter/material.dart';
import 'package:relation/relation.dart';

/// Страница с результатом тестирования
class ResultPage extends StatelessWidget {
  final StreamedState<ResultTesting> resultTestingState;

  const ResultPage({
    required this.resultTestingState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilder<ResultTesting>(
      streamedState: resultTestingState,
      builder: (context, state) => Column(
        children: [
          const SizedBox(height: 40),
          const _BuildHeaderResult(),
          const SizedBox(height: 40),
          _BuildNumberQuestions(
            questions: state.numberQuestions.toString(),
          ),
          const SizedBox(width: double.infinity, height: 20),
          _BuildNumberErrors(
            errors: state.numberErrors.toString(),
          ),
        ],
      ),
    );
  }
}

/// заголовок
class _BuildHeaderResult extends StatelessWidget {
  const _BuildHeaderResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Результаты',
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
            'Вопросов:',
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
            'Ошибок:',
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
