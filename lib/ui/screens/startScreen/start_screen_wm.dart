import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/domain/question.dart';
import 'package:mwwm/mwwm.dart';

class StartScreenWidgetModel extends WidgetModel {
  final QuestionInteractor interactor;

  StartScreenWidgetModel(
    WidgetModelDependencies baseDependencies,
    this.interactor,
  ) : super(baseDependencies);

  // для теста что правильно подключила всё
  // todo del
  late final Question testItem;

  @override
  void onLoad() {
    super.onLoad();

    testItem = interactor.getRandomQuestion();
  }

  @override
  void onBind() {
    super.onBind();
  }
}
