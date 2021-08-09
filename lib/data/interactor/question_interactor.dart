import 'dart:math';

import 'package:dart_testing/data/repository/question_repository.dart';
import 'package:dart_testing/domain/question.dart';

/// Интерактор для вопросов
class QuestionInteractor {
  final QuestionRepository repository;

  QuestionInteractor(this.repository);

  /// получить все вопросы
  List<Question> getQuestions() => repository.getQuestions();

  /// получить вопрос по id
  Question getQuestion(int id) => repository.getQuestion(id);

  /// получить рандомный вопрос
  Question getRandomQuestion() {
    // сколько всего вопросов в базе
    final totalQuestions = repository.getQuestions().length;
    final random = Random();

    return repository.getQuestion(random.nextInt(totalQuestions + 1));
  }
}
