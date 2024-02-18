import 'package:flutter/material.dart';
import 'package:onabe_mobile/domain/models/answered_question.dart';

class AnsweredQuestionDialog extends StatelessWidget {
  final AnsweredQuestion faq;

  const AnsweredQuestionDialog({Key? key, required this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('回答がある質問'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('質問：${faq.question}'),
          const SizedBox(height: 16),
          Text('回答：${faq.answer ?? ""}'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('閉じる'),
        ),
      ],
    );
  }
}
