import 'package:flutter/material.dart';
import 'package:onabe_mobile/domain/models/answered_question.dart';

class AnsweredQuestionPage extends StatelessWidget {
  final AnsweredQuestion faq;

  const AnsweredQuestionPage({Key? key, required this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(faq.question)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(faq.answer!),
      ),
    );
  }
}
