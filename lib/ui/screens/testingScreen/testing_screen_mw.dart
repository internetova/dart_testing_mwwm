import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/domain/question.dart';
import 'package:dart_testing/domain/testing.dart';
import 'package:dart_testing/ui/res/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:provider/provider.dart';
import 'package:relation/relation.dart';

/// Виджет модель для экрана тестирования
class TestingScreenWidgetModel extends WidgetModel {
  /// ДАННЫЕ ДЛЯ РАБОТЫ
  /// временное хранилище результата тестирования - сюда будем записывать
  /// id вопроса и правильность ответа
  final testing = Testing(
    idsQuestions: [],
    responses: [],
  );

  /// Получим список вопросов
  /// будем использовать для построения прогресса прохождения теста
  late final List<Question> dataQuestions;

  /// Узнаем количество вопросов в тесте
  late final int totalQuestions;

  /// СОСТОЯНИЯ

  /// текущий вопрос на экране
  late final StreamedState<Question> currentQuestionState;

  /// текущий индекс вопроса на экране
  /// будем использовать для построения прогресса прохождения теста
  late final StreamedState<int> currentQuestionIndexState;

  /// состояние тестирования
  late final StreamedState<Testing> testingState;

  /// состояние результата тестирования -> тестирование закончено
  late final StreamedState<ResultTesting> resultTestingState;

  /// СОБЫТИЯ
  /// клик по кнопке Начать
  final onStartAction = VoidAction();

  /// клик по кнопке Закончить
  final onFinishAction = VoidAction();

  /// клик по выбору ответа
  /// записывает ответ и перемещает к следующему вопросу
  final onRespondAction = StreamedAction<int>();

  final QuestionInteractor _interactor;
  final BuildContext _context;

  /// Если выводим вопросы по порядку, то это для перехода к следующему вопросу
  int currentQuestionIndex = 0;

  TestingScreenWidgetModel(
    WidgetModelDependencies baseDependencies,
    this._interactor,
    this._context,
  ) : super(baseDependencies);

  @override
  void onLoad() {
    testingState = StreamedState<Testing>(testing);
    resultTestingState = StreamedState<ResultTesting>(
      const ResultTesting(
        numberQuestions: 0,
        numberErrors: 0,
      ),
    );

    dataQuestions = _interactor.getQuestions().toList();
    totalQuestions = dataQuestions.length;

    currentQuestionState = StreamedState<Question>(
      dataQuestions.elementAt(currentQuestionIndex),
    );
    currentQuestionIndexState = StreamedState<int>(currentQuestionIndex);

    super.onLoad();
  }

  @override
  void onBind() {
    subscribe(onStartAction.stream, (_) => _onStart());
    subscribe(onFinishAction.stream, (_) => _onFinish());
    subscribe(onRespondAction.stream, (index) => _onRespond(index as int));

    super.onBind();
  }

  /// обрабатываем клик по кнопке Начать
  void _onStart() {
    // очищаем временное хранилище предыдущего тестирования
    if (testing.idsQuestions.isNotEmpty) {
      testing.idsQuestions.clear();
      testing.responses.clear();
      currentQuestionIndex = 0;
    }

    // запускаем тест
    currentQuestionState
        .accept(_interactor.getQuestions().elementAt(currentQuestionIndex));

    currentQuestionIndexState.accept(currentQuestionIndex);
  }

  /// обрабатываем клик по кнопке Закончить
  void _onFinish() {
    if (testing.idsQuestions.isNotEmpty) {
      // записываем итоговый результат
      resultTestingState.accept(ResultTesting(
        numberQuestions: testingState.value.idsQuestions.length,
        numberErrors: testingState.value.responses
            .where((element) => element == false)
            .length,
      ));

      // переходим на экран с результатами
      AppRoutes.goResultScreen(
        _context,
        resultTesting: resultTestingState.value,
        results: testingState.value.responses,
      );
    } else {
      // если на вопросы еще не отвечали
      // возвращаем на главный экран
      AppRoutes.goHomeScreen(_context);
    }
  }

  /// обрабатываем клик по варианту ответа
  void _onRespond(int index) {
    // записали во временное хранилище № вопроса и правильность ответа (true / false)
    testing.idsQuestions.add(currentQuestionState.value.id);
    testing.responses.add(
      _checkResponse(
        response: index,
        idRightResponse: currentQuestionState.value.idRightResponse,
      ),
    );

    // обновили состояние результатов тестирования
    testingState.accept(testing);

    // для перехода к следующему вопросу
    currentQuestionIndex++;
    currentQuestionIndexState.accept(currentQuestionIndex);

    // обновить стейт текущего вопроса на следующий или закончить
    _goNextQuestion();
  }

  /// проверка правильности ответа
  /// [response] - индекс ответа
  /// [idRightResponse] - индекс правильного ответа
  bool _checkResponse({
    required int response,
    required int idRightResponse,
  }) {
    return response == idRightResponse;
  }

  /// переход к следующему вопросу
  /// если вопрос последний, то показываем результат
  void _goNextQuestion() {
    if (currentQuestionIndex < (totalQuestions - 1)) {
      currentQuestionState
          .accept(_interactor.getQuestions().elementAt(currentQuestionIndex));
    } else {
      _onFinish();
    }
  }
}

TestingScreenWidgetModel createTestingScreenWidgetModel(BuildContext context) {
  return TestingScreenWidgetModel(
    const WidgetModelDependencies(),
    context.read<QuestionInteractor>(),
    context,
  );
}
