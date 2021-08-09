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
