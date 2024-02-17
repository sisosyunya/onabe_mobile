import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onabe_mobile/service/faq_service.dart';

import 'domain/models/faq.dart';

final faqProvider = FutureProvider<List<FAQ>>((ref) async {
  final faqService = FAQService();
  return faqService.fetchFAQs();
});

// テキスト入力の状態を管理するプロバイダ
final textInputProvider = StateProvider<String>((ref) => "");
