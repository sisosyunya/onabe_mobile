import 'package:flutter/material.dart';
import 'package:onabe_mobile/service/faq_service.dart';

class AddAnswerPage extends StatelessWidget {
  final int questionId;
  final String question;

  AddAnswerPage({Key? key, required this.questionId, required this.question})
      : super(key: key);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('回答の追加をお願いします！'),
      ),
      body: SingleChildScrollView(
        // スクロール可能にする
        padding: const EdgeInsets.all(16.0), // 余白を追加
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // 子ウィジェットを幅いっぱいに広げる
          children: [
            const SizedBox(height: 32),
            Text(
              '質問: $question',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: '回答',
              ),
              maxLines: 3, // 複数行の入力を許可
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FAQService().postFAQ(context, questionId, _controller.text);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12), // ボタンのパディング
                textStyle: const TextStyle(fontSize: 16), // テキストのスタイル
              ),
              child: const Text('追加する'),
            )
          ],
        ),
      ),
    );
  }
}
