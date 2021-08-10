import 'package:dart_testing/domain/testing.dart';
import 'package:flutter/material.dart';
import 'package:relation/relation.dart';

/// Страница с результатом тестирования
class ResultPage extends StatelessWidget {
  final StreamedState<Testing> result;

  const ResultPage({
    required this.result,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilder<Testing>(
        streamedState: result,
        builder: (context, result) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity,
                height: 20,
              ),
            ],
          );
        });
  }
}
