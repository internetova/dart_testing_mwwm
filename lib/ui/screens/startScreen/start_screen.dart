import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/screens/startScreen/start_screen_wm.dart';
import 'package:dart_testing/ui/widgets/custom_text_button.dart';
import 'package:dart_testing/ui/widgets/result_page.dart';
import 'package:dart_testing/ui/widgets/start_text.dart';
import 'package:dart_testing/ui/widgets/testing_page.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

class StartScreen extends CoreMwwmWidget<StartScreenWidgetModel> {
  const StartScreen({
    required WidgetModelBuilder<StartScreenWidgetModel> widgetModelBuilder,
    Key? key,
  }) : super(widgetModelBuilder: widgetModelBuilder, key: key);

  @override
  WidgetState<StartScreen, StartScreenWidgetModel> createWidgetState() =>
      _StartScreenState();
}

class _StartScreenState
    extends WidgetState<StartScreen, StartScreenWidgetModel> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.titleAppBarHome),
        ),
        body: StreamedStateBuilder<StatusStartScreen>(
          streamedState: wm.currentStatusState,
          builder: (context, state) {
            Widget child;

            switch (state) {
              case StatusStartScreen.testing:
                child = TestingPage(
                  question: wm.currentQuestionState,
                  onPressed: wm.onRespondAction,
                );
                break;
              case StatusStartScreen.finish:
                child = Center(
                  child: ResultPage(resultTestingState: wm.resultTestingState),
                );
                break;
              default:
                child = const StartText(content: AppStrings.textStart);
            }

            return child;
          },
        ),
        floatingActionButton: StreamedStateBuilder<String>(
          streamedState: wm.buttonState,
          builder: (_, buttonStateTitle) {
            return CustomTextButton(
              onPressed: buttonStateTitle == AppStrings.buttonLabelFinish
                  ? wm.onFinishAction
                  : wm.onStartAction,
              title: buttonStateTitle,
            );
          },
        ),
      );
}
