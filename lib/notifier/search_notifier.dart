import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onabe_mobile/domain/models/faq.dart';

class SearchNotifier extends StateNotifier<List<FAQ>> {
  SearchNotifier() : super([]);

  void search(String query, List<FAQ> faqs) {
    state = faqs.where((faq) {
      return faq.question.contains(query);
    }).toList();
  }

  void reset(List<FAQ> faqs) {
    state = faqs;
  }
}
