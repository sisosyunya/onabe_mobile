import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onabe_mobile/domain/faq_converter.dart';
import 'package:onabe_mobile/domain/models/answered_question.dart';
import 'package:onabe_mobile/domain/models/un_answered_question.dart';
import 'package:onabe_mobile/domain/search_query.dart';
import 'package:onabe_mobile/pages/add_answer_page.dart';
import 'package:onabe_mobile/providers.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final textInput = ref.watch(textInputProvider);
    final faqList = ref.watch(faqProvider);
    return Scaffold(
      appBar: const SearchAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: faqList.when(
          loading: () => const CircularProgressIndicator(),
          //　エラー内容を表示する
          error: (error, stackTrace) => Text(error.toString()),
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final faq = data[index];
              final specificFAQ = convertFAQToSpecificType(faq);
              if (specificFAQ is AnsweredQuestion) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/wanko.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: Text("[回答済み]${specificFAQ.question}"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              AnsweredQuestionDialog(faq: specificFAQ));
                    },
                  ),
                );
              } else if (specificFAQ is UnansweredQuestion) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      'assets/images/wanko.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: Text("[未回答]${specificFAQ.question}"),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              UnAnsweredQuestionDialog(faq: specificFAQ));
                    },
                  ),
                );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

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
