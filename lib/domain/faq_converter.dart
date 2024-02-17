import 'package:onabe_mobile/domain/models/answered_question.dart';
import 'package:onabe_mobile/domain/models/faq.dart';
import 'package:onabe_mobile/domain/models/un_answered_question.dart';

FAQ convertFAQToSpecificType(FAQ faq) {
  if (faq.answer != null) {
    return AnsweredQuestion(
      id: faq.id,
      question: faq.question,
      answer: faq.answer!,
      keyword: faq.keyword,
      createdAt: faq.createdAt,
      answeredAt: faq.answeredAt!,
    );
  } else {
    return UnansweredQuestion(
      id: faq.id,
      question: faq.question,
      keyword: faq.keyword,
      createdAt: faq.createdAt,
    );
  }
}
