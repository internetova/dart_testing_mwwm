import 'package:flutter/material.dart';

/// Фон для экрана
class BackgroundScreen extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;
  final Widget child;

  const BackgroundScreen({
    required this.colorOne,
    required this.colorTwo,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorOne,
            colorTwo,
          ],
        ),
      ),
      child: child,
    );
  }
}
