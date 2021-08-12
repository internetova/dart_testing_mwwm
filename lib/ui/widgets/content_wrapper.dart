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
        color: Theme.of(context).colorScheme.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
