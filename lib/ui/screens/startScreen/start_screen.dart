import 'package:dart_testing/ui/screens/startScreen/start_screen_wm.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

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
        body: Center(
          child: Text('id ${wm.testItem.id},  ${wm.testItem.question}'),
        ),
      );
}
