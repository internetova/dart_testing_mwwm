import 'package:dart_testing/domain/question.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/screens/testingScreen/testing_screen_mw.dart';
import 'package:dart_testing/ui/widgets/background_screen.dart';
import 'package:dart_testing/ui/widgets/content_wrapper.dart';
import 'package:dart_testing/ui/widgets/round_button.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _ProgressIndicator(
                data: wm.dataQuestions,
                currentIndex: wm.currentQuestionIndexState,
              ),
              const SizedBox(height: 50),
              StreamedStateBuilder<Animation<Offset>>(
                streamedState: wm.cardQuestionsAnimationState,
                builder: (context, position) {
                  return SlideTransition(
                    position: position,
                    child: ContentWrapper(
                      child: StreamedStateBuilder<Question>(
                        streamedState: wm.currentQuestionState,
                        builder: (context, question) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 30),
                              _BuildQuestion(question: question.question),
                              const SizedBox(
                                width: double.infinity,
                                height: 30,
                              ),
                              _BuildResponseOptions(
                                responseOptions: question.responseOptions,
                                onPressed: wm.onRespondAction,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: RoundButton(
        title: AppStrings.buttonLabelFinish,
        onPressed: wm.onFinishAction,
        size: 100,
        fontSize: 18,
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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Text(
        question,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.dividerButtonResponse,
      ),
      child: Column(
        children: responseOptions
            .asMap()
            .map((i, element) => MapEntry(
                  i,
                  _BuildResponse(
                    onPressed: () => onPressed(i),
                    title: element,
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}

/// Текстовая кнопка с вариантом ответа
class _BuildResponse extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const _BuildResponse({
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.splashButtonResponse,
          backgroundColor: Theme.of(context).colorScheme.bgButtonResponse,
          minimumSize: const Size(double.infinity, 40),
          shape: const RoundedRectangleBorder(),
          alignment: Alignment.centerLeft,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.titleButtonResponse,
                ),
          ),
        ),
      ),
    );
  }
}

/// индикатор оставшихся вопросов
class _ProgressIndicator extends StatelessWidget {
  final List<Question> data;
  final StreamedState<int> currentIndex;

  const _ProgressIndicator({
    required this.data,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilder<int>(
      streamedState: currentIndex,
      builder: (context, currentIndex) {
        return Row(
          children: data
              .asMap()
              .map(
                (i, element) => MapEntry(
                  i,
                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: _getColor(
                          context,
                          index: i,
                          currentIndex: currentIndex,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        );
      },
    );
  }

  /// цвет меток индикатора
  Color _getColor(
    BuildContext context, {
    required int index,
    required int currentIndex,
  }) {
    if (index < currentIndex || index == currentIndex) {
      return Theme.of(context).colorScheme.colorIndicatorDark;
    } else {
      return Theme.of(context).colorScheme.colorIndicatorLight;
    }
  }
}
