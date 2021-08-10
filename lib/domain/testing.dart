/// состояние текущего тестирования
/// [idsQuestions] список id вопросов
/// [responses] список ответов правильно / неправльно
class Testing {
  final List<int> idsQuestions;
  final List<bool> responses;

  Testing({
    required this.idsQuestions,
    required this.responses,
  });
}

/// итоговый результат тестирования
/// [numberQuestions] количество вопросов
/// [numberErrors] количество ошибок
class ResultTesting {
  final int numberQuestions;
  final int numberErrors;

  const ResultTesting({
    required this.numberQuestions,
    required this.numberErrors,
  });
}
