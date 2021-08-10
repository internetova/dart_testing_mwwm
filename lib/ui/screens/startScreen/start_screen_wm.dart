import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/domain/question.dart';
import 'package:dart_testing/domain/testing.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

class StartScreenWidgetModel extends WidgetModel {
  final QuestionInteractor interactor;

  /// ДАННЫЕ ДЛЯ РАБОТЫ
  /// временное хранилище результата тестирования - сюда будем записывать
  /// id вопроса и правильность ответа
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

  /// состояние результата тестирования -> тестирование закончено
  late final StreamedState<ResultTesting> resultTestingState;

  /// состояние кнопки (название) Начать / Закончить
  final buttonState = StreamedState<String>(AppStrings.buttonLabelStart);

  /// СОБЫТИЯ
  /// клик по кнопке Начать
  final onStartAction = VoidAction();

  /// клик по выбору ответа
  /// записывает ответ и перемещает к следующему вопросу
  final onRespondAction = StreamedAction<int>();

  /// клик по кнопке Закончить
  final onFinishAction = VoidAction();

  /// Если выводим вопросы по порядку, то это для перехода к следующему вопросу
  int currentQuestion = 0;

  StartScreenWidgetModel(
    WidgetModelDependencies baseDependencies,
    this.interactor,
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
    totalQuestions = interactor.getQuestions().length;
    currentQuestionState = StreamedState<Question>(
      interactor.getQuestions().elementAt(currentQuestion),
    );

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
      currentQuestion = 0;
    }

    // меняем состояние экрана firstStart на testing
    currentStatusState.accept(StatusStartScreen.testing);

    // запускаем тест
    currentQuestionState
        .accept(interactor.getQuestions().elementAt(currentQuestion));

    // меняем состояние название кнопки
    buttonState.accept(AppStrings.buttonLabelFinish);
  }

  /// обрабатываем клик по кнопке Закончить
  void _onFinish() {
    if (testing.idsQuestions.isNotEmpty) {
      // меняем состояние экрана testing на finish
      currentStatusState.accept(StatusStartScreen.finish);

      // записываем итоговый результат
      resultTestingState.accept(ResultTesting(
        numberQuestions: testingState.value.idsQuestions.length,
        numberErrors: testingState.value.responses
            .where((element) => element == false)
            .length,
      ));

      // меняем состояние название кнопки
      buttonState.accept(AppStrings.buttonLabelRepeat);
    } else {
      // если на вопросы еще не отвечали
      // меняем состояние экрана testing на firstStart
      currentStatusState.accept(StatusStartScreen.firstStart);

      // меняем состояние название кнопки
      buttonState.accept(AppStrings.buttonLabelStart);
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
    currentQuestion++;

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
    if (currentQuestion < (totalQuestions - 1)) {
      currentQuestionState
          .accept(interactor.getQuestions().elementAt(currentQuestion));
    } else {
      _onFinish();
    }
  }
}

/// Статус экрана - только запустили, идет тестирование, закончили тест
enum StatusStartScreen { firstStart, testing, finish }
