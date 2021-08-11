import 'package:dart_testing/ui/res/app_routes.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/screens/resultScreen/result_screen_wm.dart';
import 'package:dart_testing/ui/widgets/background_screen.dart';
import 'package:dart_testing/ui/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:dart_testing/ui/res/app_theme.dart';

/// Экран с результатами
class ResultScreen extends CoreMwwmWidget<ResultScreenWidgetModel> {
  ResultScreen({
    Key? key,
  }) : super(
          key: key,
          widgetModelBuilder: (context) => createResultScreenWidgetModel(
            context,
          ),
        );

  @override
  WidgetState<CoreMwwmWidget<ResultScreenWidgetModel>, ResultScreenWidgetModel>
      createWidgetState() {
    return _ResultScreenState();
  }
}

class _ResultScreenState
    extends WidgetState<ResultScreen, ResultScreenWidgetModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        colorOne: Theme.of(context).colorScheme.bgScreenThreeDark,
        colorTwo: Theme.of(context).colorScheme.bgScreenThreeLight,
        child: Center(
          child: RoundButton(
            title: AppStrings.buttonLabelStart,
            size: 140,
            onPressed: () => AppRoutes.goHomeScreen(context),
          ),
        ),
      ),
    );
  }
}
