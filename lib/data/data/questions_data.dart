import 'package:dart_testing/data/data/data_api.dart';
import 'package:dart_testing/data/data/mock.dart';
import 'package:dart_testing/domain/question.dart';

/// Имитация получения данных от какого-либо источника данных,
/// в данном случае пока использую моковый массив с данными
class QuestionsData implements DataApi {
  final List<Question> _data = questionsMock;

  /// Получить список всех вопросов
  @override
  Iterable<Question> getQuestions() => _data;

  /// Получить вопрос по id
  @override
  Question getQuestion(int id) =>
      _data.firstWhere((element) => element.id == id);
}
