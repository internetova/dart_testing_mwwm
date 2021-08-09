/// Модель вопроса
/// [id] - id вопроса
/// [question] - вопрос
/// [responseOptions] - список вариантов ответа, включая правильный
/// [idRightResponse] - индекс правильного ответа из [responseOptions]
class Question {
  final int id;
  final String question;
  final List<String> responseOptions;
  final int idRightResponse;

  Question({
    required this.id,
    required this.question,
    required this.responseOptions,
    required this.idRightResponse,
  });
}
