import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onabe_mobile/domain/models/faq.dart';

class FAQService {
  Future<List<FAQ>> fetchFAQs() async {
    final response =
        await http.get(Uri.parse('http://3.112.223.9:8000/getall'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse.map((faq) => FAQ.fromJson(faq)).toList();
    } else {
      throw Exception('Failed to load FAQs');
    }
  }

  Future<void> postFAQ(
      BuildContext context, int questionId, String answer) async {
    try {
      await http.post(Uri.parse('http://3.112.223.9:8000/addanswer'),
          body: json.encode({
            'id': questionId,
            'answer': answer,
            'answeredAt': DateTime.now().toString()
          }),
          headers: {'Content-Type': 'application/json'});
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
