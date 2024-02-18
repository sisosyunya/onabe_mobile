import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:onabe_mobile/domain/models/faq.dart';

class FAQService {
  final dio = Dio();

  Future<List<FAQ>> fetchFAQs() async {
    final response = await dio.get('http://3.112.223.9:8000/getall');

    if (response.statusCode == 200) {
      List jsonResponse = response.data;
      print(jsonResponse);
      final List<FAQ> faqs =
          jsonResponse.map((faq) => FAQ.fromJson(faq)).toList();
      return faqs;
    } else {
      throw Exception('Failed to load FAQs');
    }
  }

  Future<void> postFAQ(
      BuildContext context, int questionId, String answer) async {
    try {
      final response = await dio.post('http://3.112.223.9:8000/addanswer',
          data: {
            'id': questionId,
            'answer': answer,
            'answeredAt': DateTime.now().toString()
          });
      if (response.statusCode == 200) {
        showSnackBar('回答の追加に成功しました', context);
      } else {
        showSnackBar('回答の送信に失敗しました', context);
      }
    } catch (e) {
      print(e.toString());
      showSnackBar(e.toString(), context);
    }
  }
}

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ),
  );
}
