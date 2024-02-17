import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onabe_mobile/service/faq_service.dart';

import 'domain/models/faq.dart';

final faqProvider = FutureProvider<List<FAQ>>((ref) async {
  final faqService = FAQService();
  return faqService.fetchFAQs();
});

final searchProvider = StateProvider<String>((ref) => '');
