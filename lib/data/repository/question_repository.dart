import 'package:dart_testing/data/data/questions_data.dart';
import 'package:dart_testing/domain/question.dart';

/// Репозиторий для работы с полученными данными от источника данных
class QuestionRepository {
  final QuestionsData data;

  QuestionRepository(this.data);

  /// получить все вопросы
  List<Question> getQuestions() => data.getQuestions();


  /// получить вопрос по id
  Question getQuestion(int id) => data.getQuestion(id);
}