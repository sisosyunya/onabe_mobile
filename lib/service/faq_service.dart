import 'dart:convert';

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
}