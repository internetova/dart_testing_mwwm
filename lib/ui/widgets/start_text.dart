import 'package:flutter/material.dart';

/// Текст для стартовой страницы перед началом тестирования
class StartText extends StatelessWidget {
  final String content;

  const StartText({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        content,
        style: Theme.of(context).textTheme.headline5,
        textAlign: TextAlign.center,
        maxLines: 4,
      ),
    );
  }
}
