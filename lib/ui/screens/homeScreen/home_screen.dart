import 'package:dart_testing/ui/res/app_routes.dart';
import 'package:dart_testing/ui/res/app_strings.dart';
import 'package:dart_testing/ui/widgets/background_screen.dart';
import 'package:dart_testing/ui/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:dart_testing/ui/res/app_theme.dart';

/// Главный экран приложения
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        colorOne: Theme.of(context).colorScheme.bgScreenOneDark,
        colorTwo: Theme.of(context).colorScheme.bgScreenOneLight,
        child: Column(
          children: [
            const Spacer(),
            const _BuildStartText(content: AppStrings.textStart),
            RoundButton(
              title: AppStrings.buttonLabelStart,
              size: 140,
              onPressed: () => AppRoutes.goTestingScreen(context),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/// Текст для стартовой страницы перед началом тестирования
class _BuildStartText extends StatelessWidget {
  final String content;

  const _BuildStartText({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Text(
          content,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
          maxLines: 4,
        ),
      ),
    );
  }
}
