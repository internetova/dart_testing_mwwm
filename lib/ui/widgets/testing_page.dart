import 'package:dart_testing/domain/question.dart';
import 'package:dart_testing/ui/widgets/custom_text_button_response.dart';
import 'package:flutter/material.dart';
import 'package:relation/relation.dart';

/// Страница тестирования - выводит вопрос с вариантами ответа
/// [question] объект с вопросом, вариантами ответа и
/// правильным ответом
class TestingPage extends StatelessWidget {
  final StreamedState<Question> question;
  final ValueChanged<int> onPressed;

  const TestingPage({
    required this.question,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilder<Question>(
        streamedState: question,
        builder: (context, question) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              _BuildQuestion(question: question.question),
              const SizedBox(
                width: double.infinity,
                height: 20,
              ),
              _BuildResponseOptions(
                responseOptions: question.responseOptions,
                onPressed: onPressed,
              ),
            ],
          );
        });
  }
}

/// вопрос
class _BuildQuestion extends StatelessWidget {
  final String question;

  const _BuildQuestion({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }
}

/// варианты ответа
/// хранятся в списке, нажатием передаём индекс ответа
class _BuildResponseOptions extends StatelessWidget {
  final List<String> responseOptions;
  final ValueChanged<int> onPressed;

  const _BuildResponseOptions({
    Key? key,
    required this.responseOptions,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: responseOptions
          .asMap()
          .map((i, element) => MapEntry(
                i,
                CustomTextButtonResponse(
                  onPressed: () => onPressed(i),
                  title: element,
                ),
              ))
          .values
          .toList(),
    );
  }
}
