import 'package:onabe_mobile/domain/models/faq.dart';

class AnsweredQuestion extends FAQ {
  AnsweredQuestion({
    required int id,
    required String question,
    required String answer,
    required String keyword,
    required String? createdAt,
    required String? answeredAt,
  }) : super(
          id: id,
          question: question,
          answer: answer,
          keyword: keyword,
          createdAt: createdAt,
          answeredAt: answeredAt,
        );
}
