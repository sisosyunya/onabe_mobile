import 'package:flutter/material.dart';
import 'package:onabe_mobile/domain/models/un_answered_question.dart';
import 'package:onabe_mobile/pages/add_answer_page.dart';

class UnAnsweredQuestionDialog extends StatelessWidget {
  final UnansweredQuestion faq;

  const UnAnsweredQuestionDialog({Key? key, required this.faq})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('質問：${faq.question}'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text('質問：${faq.question}'),
          SizedBox(height: 16),
          Text('もし回答できる場合は、ぜひお願いします！'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    AddAnswerPage(questionId: faq.id, question: faq.question)));
          },
          child: const Text('回答する'),
        ),
      ],
    );
  }
}
