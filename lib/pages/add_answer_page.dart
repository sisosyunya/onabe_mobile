import 'package:flutter/material.dart';
import 'package:onabe_mobile/service/faq_service.dart';

class AddAnswerPage extends StatelessWidget {
  final int questionId;

  AddAnswerPage({Key? key, required this.questionId}) : super(key: key);
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Answer'),
      ),
      body: Column(
        children: [
          Text('Question ID: $questionId'),
          const SizedBox(height: 8),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Answer',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              FAQService().postFAQ(context, questionId, _controller.text);
            },
            child: const Text('追加する'),
          )
        ],
      ),
    );
  }
}


// addのモデル
// id
// answer
// answeredAt