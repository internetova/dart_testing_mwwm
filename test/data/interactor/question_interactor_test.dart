import 'package:dart_testing/data/data/mock.dart';
import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/data/repository/question_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class QuestionRepositoryMock extends Mock implements QuestionRepository {}

void main() {
  late final QuestionRepositoryMock repositoryMock;
  late final QuestionInteractor interactor;

  setUp(() {
    repositoryMock = QuestionRepositoryMock();
    interactor = QuestionInteractor(repositoryMock);
  });

  test('Получить данные', () {
    when(repositoryMock.getQuestions).thenAnswer((_) => questionsMock);
    expect(interactor.getQuestions(), questionsMock);
  });

  test('Получить данные по id', () {
    when(() => repositoryMock.getQuestion(1))
        .thenAnswer((_) => questionsMock.first);

    expect(
      interactor.getQuestion(1),
      equals(questionsMock.first),
    );
  });
}
