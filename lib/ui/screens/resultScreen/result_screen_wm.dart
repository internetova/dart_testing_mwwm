import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:provider/provider.dart';

/// Виджет модель для
class ResultScreenWidgetModel extends WidgetModel {
  final QuestionInteractor _interactor;

  ResultScreenWidgetModel(
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

ResultScreenWidgetModel createResultScreenWidgetModel(BuildContext context) {
  return ResultScreenWidgetModel(
    const WidgetModelDependencies(),
    context.read<QuestionInteractor>(),
  );
}