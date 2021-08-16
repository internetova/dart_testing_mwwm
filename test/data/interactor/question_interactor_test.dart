import 'package:dart_testing/data/data/mock.dart';
import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/data/repository/question_repository.dart';
import 'package:dart_testing/domain/question.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class QuestionRepositoryMock extends Mock implements QuestionRepository {}

void main() {
  late final List<Question> dataMock;
  late final QuestionRepositoryMock repositoryMock;
  late final QuestionInteractor interactor;

  late Question question;

  setUp(() {
    dataMock = questionsMock;
    repositoryMock = QuestionRepositoryMock();
    interactor = QuestionInteractor(repositoryMock);
  });

  test('Получить данные', () {
    when(repositoryMock.getQuestions()).thenAnswer((_) => dataMock);

    expect(interactor.getQuestions(), dataMock);
  });

  test('Получить данные по id', () {
    when(repositoryMock.getQuestion(2)).thenAnswer(
      (_) {
        question = dataMock.firstWhere((element) => element.id == 2);
        return question;
      },
    );

    expect(
      interactor.getQuestion(2),
      question.id == 2,
    );
  });
}
