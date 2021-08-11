import 'package:flutter/material.dart';
import 'package:dart_testing/ui/res/app_theme.dart';

/// Закругленная кнопка
class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RoundedButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Theme.of(context).colorScheme.white),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 3.0,
          color: Theme.of(context).colorScheme.white,
        ),
        primary: Theme.of(context).colorScheme.splashButton,
        backgroundColor: Theme.of(context).colorScheme.bgButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      ),
    );
  }
}
