import 'package:flutter/material.dart';
import 'package:onabe_mobile/domain/models/answered_question.dart';

class AnsweredQuestionPage extends StatelessWidget {
  final AnsweredQuestion faq;

  const AnsweredQuestionPage({Key? key, required this.faq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '回答がある質問',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // タイトルを中央に配置
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            elevation: 4.0, // カードの影を追加
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // コンテンツに合わせてカードのサイズを最小限にする
                crossAxisAlignment: CrossAxisAlignment.center, // 要素を中央揃えにする
                children: [
                  Text(
                    '質問：${faq.question}',
                    textAlign: TextAlign.center, // テキストを中央揃えにする
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '回答：${faq.answer ?? ""}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center, // テキストを中央揃えにする
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
