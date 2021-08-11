import 'package:dart_testing/ui/res/app_routes.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/screens/testingScreen/testing_screen_mw.dart';
import 'package:dart_testing/ui/widgets/background_screen.dart';
import 'package:dart_testing/ui/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:dart_testing/ui/res/app_theme.dart';

/// Экран тестирования
class TestingScreen extends CoreMwwmWidget<TestingScreenWidgetModel> {
  TestingScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: (context) => createTestingScreenWidgetModel(
            context,
          ),
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
          child: RoundButton(
            title: AppStrings.buttonLabelFinish,
            size: 160,
            onPressed: () => AppRoutes.goResultScreen(context),
          ),
        ),
      ),
    );
  }
}
