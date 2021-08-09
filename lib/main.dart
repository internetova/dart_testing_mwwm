import 'package:dart_testing/data/data/questions_data.dart';
import 'package:dart_testing/data/repository/question_repository.dart';
import 'package:dart_testing/ui/screens/startScreen/start_screen_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/interactor/question_interactor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<QuestionsData>(
          create: (_) => QuestionsData(),
        ),
        ProxyProvider<QuestionsData, QuestionRepository>(
          update: (context, data, repo) => QuestionRepository(data),
        ),
        ProxyProvider<QuestionRepository, QuestionInteractor>(
          update: (context, repo, interactor) => QuestionInteractor(repo),
        ),
      ],
      child: MaterialApp(
        title: 'Тестирование по Dart',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        onGenerateRoute: (_) => StartScreenRoute(),
      ),
    );
  }
}

