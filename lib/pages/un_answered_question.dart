import 'package:flutter/material.dart';
import 'package:onabe_mobile/domain/models/un_answered_question.dart';
import 'package:onabe_mobile/pages/add_answer_page.dart';

class UnAnsweredQuestionPage extends StatelessWidget {
  final UnansweredQuestion faq;

  const UnAnsweredQuestionPage({Key? key, required this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unanswered Questions'),
      ),
      body: Column(
        children: [
          Text(faq.question),
          const SizedBox(height: 8),
          Text(faq.keyword),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddAnswerPage(questionId: faq.id)));
              },
              child: const Text('回答する'))
        ],
      ),
    );
  }
}
