import 'package:dart_testing/data/data/questions_data.dart';
import 'package:dart_testing/data/interactor/question_interactor.dart';
import 'package:dart_testing/data/repository/question_repository.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/res/app_theme.dart';
import 'package:dart_testing/ui/screens/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final ThemeData _lightTheme = AppTheme.buildTheme();
final ThemeData _darkTheme = AppTheme.buildThemeDark();

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

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
        title: AppStrings.appTitle,
        theme: _lightTheme,
        darkTheme: _darkTheme,
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
