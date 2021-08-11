import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:provider/provider.dart';

/// Виджет модель для экрана тестирования
class TestingScreenWidgetModel extends WidgetModel {
  final QuestionInteractor _interactor;

  TestingScreenWidgetModel(
    WidgetModelDependencies baseDependencies,
    this._interactor,
  ) : super(baseDependencies);

  @override
  void onLoad() {
    super.onLoad();
  }

  @override
  void onBind() {
    super.onBind();
  }
}

TestingScreenWidgetModel createTestingScreenWidgetModel(BuildContext context) {
  return TestingScreenWidgetModel(
    const WidgetModelDependencies(),
    context.read<QuestionInteractor>(),
  );
}
