import 'package:dart_testing/domain/question.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/screens/testingScreen/testing_screen_mw.dart';
import 'package:dart_testing/ui/widgets/background_screen.dart';
import 'package:dart_testing/ui/widgets/custom_text_button_response.dart';
import 'package:dart_testing/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:dart_testing/ui/res/app_theme.dart';
import 'package:relation/relation.dart';

/// Экран тестирования
class TestingScreen extends CoreMwwmWidget<TestingScreenWidgetModel> {
  const TestingScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: createTestingScreenWidgetModel,
        );

  @override
  WidgetState<CoreMwwmWidget<TestingScreenWidgetModel>,
      TestingScreenWidgetModel> createWidgetState() {
    return _TestingScreenState();
  }
}

class _TestingScreenState
    extends WidgetState<TestingScreen, TestingScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        colorOne: Theme.of(context).colorScheme.bgScreenTwoDark,
        colorTwo: Theme.of(context).colorScheme.bgScreenTwoLight,
        child: Center(
          child: StreamedStateBuilder<Question>(
            streamedState: wm.currentQuestionState,
            builder: (context, question) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _BuildQuestion(question: question.question),
                    const SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                    _BuildResponseOptions(
                      responseOptions: question.responseOptions,
                      onPressed: wm.onRespondAction,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: RoundedButton(
        title: AppStrings.buttonLabelFinish,
        onPressed: wm.onFinishAction,
      ),
    );
  }
}

/// вопрос
class _BuildQuestion extends StatelessWidget {
  final String question;

  const _BuildQuestion({
    required this.question,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: Theme.of(context).textTheme.headline5,
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
    required this.responseOptions,
    required this.onPressed,
    Key? key,
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