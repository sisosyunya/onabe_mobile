import 'package:onabe_mobile/domain/models/faq.dart';

class UnansweredQuestion extends FAQ {
  UnansweredQuestion({
    required int id,
    required String question,
    required String keyword,
    required String? createdAt,
  }) : super(
          id: id,
          question: question,
          keyword: keyword,
          createdAt: createdAt,
        );
}
