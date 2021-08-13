import 'package:flutter/material.dart';
import 'package:dart_testing/ui/res/app_theme.dart';

/// Обёртка для контента экрана
class ContentWrapper extends StatelessWidget {
  final Widget child;

  const ContentWrapper({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.colorShadow,
            spreadRadius: 4,
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.white,
          ),
          child: child,
        ),
      ),
    );
  }
}
