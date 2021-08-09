import 'package:flutter/material.dart';

/// Текстовая кнопка для ответа с маленьким текстом
class CustomTextButtonResponse extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomTextButtonResponse({
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.2),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          minimumSize: const Size(double.infinity, 40),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
