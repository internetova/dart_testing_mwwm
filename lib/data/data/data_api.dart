import 'package:dart_testing/domain/question.dart';

/// Интерфейс для получения базовых данных для работы приложения
abstract class DataApi {
  /// Получить список всех вопросов
  Iterable<Question> getQuestions();

  /// Получить вопрос по id
  Question getQuestion(int id);
}
