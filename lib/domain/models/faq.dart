class FAQ {
  final int id;
  final String question;
  final String? answer;
  final String keyword;
  final String? createdAt;
  final String? answeredAt;

  FAQ({
    required this.id,
    required this.question,
    this.answer,
    required this.keyword,
    this.createdAt,
    this.answeredAt,
  });

  factory FAQ.fromJson(Map<dynamic, dynamic> json) {
    return FAQ(
        id: json['id'], question: json['question'], keyword: json['keyword']);
  }
}
