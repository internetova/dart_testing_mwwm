import 'package:dart_testing/domain/question.dart';

/// Моковые данные для теста, пока генерирую рыбу
/// пока правильный ответ всегда первый
/// позже заменю на вопросы
final List<Question> questionsMock = List<Question>.generate(
  30,
  (index) => Question(
    id: index,
    question: 'Вопрос $index',
    responseOptions: [
      'Вариант ответа 1',
      'Вариант ответа 2',
      'Вариант ответа 3',
    ],
    idRightResponse: index,
  ),
);
