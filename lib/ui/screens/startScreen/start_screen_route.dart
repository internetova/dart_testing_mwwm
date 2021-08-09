import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/ui/screens/startScreen/start_screen.dart';
import 'package:dart_testing/ui/screens/startScreen/start_screen_wm.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:provider/provider.dart';


class StartScreenRoute extends MaterialPageRoute {
  StartScreenRoute()
      : super(
          builder: (context) => StartScreen(
            widgetModelBuilder: _widgetModelBuilder,
          ),
        );
}

StartScreenWidgetModel _widgetModelBuilder(BuildContext context) =>
    StartScreenWidgetModel(
      WidgetModelDependencies(),
      context.read<QuestionInteractor>(),
    );
