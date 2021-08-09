import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/domain/question.dart';
import 'package:dart_testing/domain/testing.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

class StartScreenWidgetModel extends WidgetModel {
  final QuestionInteractor interactor;

  StartScreenWidgetModel(
    WidgetModelDependencies baseDependencies,
    this.interactor,
  ) : super(baseDependencies);

  /// ДАННЫЕ ДЛЯ РАБОТЫ
  /// Сюда будем записывать id вопроса и правильность ответа
  final testing = Testing(
    idsQuestions: [],
    responses: [],
  );

  /// Узнаем количество вопросов в тесте
  late final int totalQuestions;

  /// СОСТОЯНИЯ
  /// текущий статус экрана
  final currentStatusState =
      StreamedState<StatusStartScreen>(StatusStartScreen.firstStart);

  /// текущий вопрос на экране
  late final StreamedState<Question> currentQuestionState;

  /// состояние тестирования
  late final StreamedState<Testing> testingState;

  /// состояние кнопки (название) Начать / Закончить
  final buttonState = StreamedState<String>(AppStrings.buttonLabelStart);

  /// СОБЫТИЯ
  /// клик по кнопке Начать
  final onStartAction = VoidAction();

  /// клик по выбору ответа
  /// записывает ответ и перемещает к следующему вопросу
  final onRespondAction = VoidAction();

  /// клик по кнопке Закончить
  final onFinishAction = VoidAction();

  @override
  void onLoad() {
    testingState = StreamedState<Testing>(testing);
    totalQuestions = interactor.getQuestions().length;
    currentQuestionState =
        StreamedState<Question>(interactor.getQuestions().elementAt(0));

    super.onLoad();
  }

  @override
  void onBind() {
    subscribe(onStartAction.stream, _onStart);
    subscribe(onFinishAction.stream, _onFinish);
    subscribe(onRespondAction.stream, _onRespond);

    super.onBind();
  }

  /// обрабатываем клик по кнопке Начать
  void _onStart(_) {
    // меняем состояние экрана firstStart на testing
    currentStatusState.accept(StatusStartScreen.testing);

    // запускаем тест
    currentQuestionState.accept(interactor.getQuestions().elementAt(0));

    // меняем состояние название кнопки
    buttonState.accept(AppStrings.buttonLabelFinish);
  }

  /// обрабатываем клик по кнопке Закончить
  void _onFinish(_) {
    // меняем состояние экрана testing на finish
    currentStatusState.accept(StatusStartScreen.finish);

    // меняем состояние название кнопки
    buttonState.accept(AppStrings.buttonLabelRepeat);

    // todo считаем результат, выводим на экран
  }

  /// обрабатываем клик по варианту ответа
  void _onRespond(_) {
    // todo
    print('_onRespond');

    // 1. записать в стейт № вопроса и правильность ответа (true / false)
    // 2. обновить стейт текущего вопроса на следующий
  }
}

/// Статус экрана - только запустили, идет тестирование, закончили тест
enum StatusStartScreen { firstStart, testing, finish }
