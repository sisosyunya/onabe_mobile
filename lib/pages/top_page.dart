import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onabe_mobile/domain/faq_converter.dart';
import 'package:onabe_mobile/domain/models/answered_question.dart';
import 'package:onabe_mobile/domain/models/un_answered_question.dart';
import 'package:onabe_mobile/domain/search_query.dart';
import 'package:onabe_mobile/pages/components/dialog/answered_question_dialog.dart';
import 'package:onabe_mobile/pages/components/dialog/un_answered_question_dialog.dart';
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
