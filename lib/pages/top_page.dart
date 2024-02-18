import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onabe_mobile/domain/faq_converter.dart';
import 'package:onabe_mobile/domain/models/answered_question.dart';
import 'package:onabe_mobile/domain/models/un_answered_question.dart';
import 'package:onabe_mobile/pages/components/dialog/answered_question_dialog.dart';
import 'package:onabe_mobile/pages/components/dialog/un_answered_question_dialog.dart';
import 'package:onabe_mobile/pages/components/search_appbar.dart';
import 'package:onabe_mobile/providers.dart';
import 'package:onabe_mobile/service/faq_service.dart';

class TopPage extends ConsumerWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqList = ref.watch(faqProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    // 部分一致検索を行う関数
    List<dynamic> searchFAQs(String query, List<dynamic> faqs) {
      return faqs.where((faq) => faq.question.contains(query)).toList();
    }

    return Scaffold(
      appBar: const SearchAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: faqList.when(
          loading: () => const CircularProgressIndicator(),
          //　エラー内容を表示する
          error: (error, stackTrace) => Text(error.toString()),
          data: (data) {
            final filteredFAQs = searchFAQs(searchQuery, data);
            if (filteredFAQs.isEmpty) {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      FAQService().postKeyword(context, searchQuery);
                    },
                    child: Text('$searchQueryについてもっと知りたい！')),
              );
            }
            return ListView.builder(
              reverse: true, 
              itemCount: filteredFAQs.length,
              itemBuilder: (context, index) {
                final faq = filteredFAQs[index];
                final specificFAQ = convertFAQToSpecificType(faq);
                if (specificFAQ is AnsweredQuestion) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      // tileColor: Color(#e4f4fc),
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
            );
          },
        ),
      ),
    );
  }
}
