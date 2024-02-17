import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:onabe_mobile/domain/models/faq.dart';

List<FAQ> filterFaqs(String query , List<FAQ> faqs) {
  final newFilteredFaqs = useState(<FAQ>[]);
    newFilteredFaqs.value = faqs.where((faq) {
      return faq.question.toLowerCase().contains(query.toLowerCase());
    }).toList();
  return newFilteredFaqs.value;
  }
