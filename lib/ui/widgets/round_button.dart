import 'package:flutter/material.dart';
import 'package:dart_testing/ui/res/app_theme.dart';

/// Круглая кнопка
class RoundButton extends StatelessWidget {
  final String title;
  final double size;
  final double fontSize;
  final VoidCallback onPressed;

  const RoundButton({
    required this.title,
    required this.size,
    required this.onPressed,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              fontSize: fontSize,
              color: Theme.of(context).colorScheme.white,
            ),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(size, size),
        side: BorderSide(
          width: 4.0,
          color: Theme.of(context).colorScheme.white,
        ),
        primary: Theme.of(context).colorScheme.splashButton,
        backgroundColor: Theme.of(context).colorScheme.bgButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size / 2),
        ),
        elevation: 6,
      ),
    );
  }
}
