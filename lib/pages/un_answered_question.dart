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
        title: const Text(
          '未回答の質問',
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
                  const Text(
                    'もし回答できる場合は、ぜひお願いします！',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center, // テキストを中央揃えにする
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AddAnswerPage(questionId: faq.id, question: faq.question)));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10), // ボタンのパディングを調整
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('回答する',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
