import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onabe_mobile/domain/faq_converter.dart';
import 'package:onabe_mobile/domain/models/answered_question.dart';
import 'package:onabe_mobile/domain/models/un_answered_question.dart';
import 'package:onabe_mobile/pages/answered_question_page.dart';
import 'package:onabe_mobile/pages/component/search_app_bar.dart';
import 'package:onabe_mobile/pages/un_answered_question.dart';
import 'package:onabe_mobile/providers.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final textInput = ref.watch(textInputProvider);
    final faqList = ref.watch(faqProvider);
    return Scaffold(
        appBar: const SearchAppBar(),
        body: faqList.when(
            loading: () => const CircularProgressIndicator(),
            //　エラー内容を表示する
            error: (error, stackTrace) => Text(error.toString()),
            data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final faq = data[index];
                    final specificFAQ = convertFAQToSpecificType(faq);
                    return ListTile(
                      title: Text(specificFAQ.question.toString()),
                      onTap: () {
                        if (specificFAQ is AnsweredQuestion) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AnsweredQuestionPage(faq: specificFAQ)));
                        } else if (specificFAQ is UnansweredQuestion) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  UnAnsweredQuestionPage(faq: specificFAQ)));
                        }
                      },
                    );
                  },
                )));
  }
}
