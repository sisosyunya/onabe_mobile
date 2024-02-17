import 'package:flutter/material.dart';
import 'package:onabe_mobile/domain/models/faq.dart';

class FAQPage extends StatelessWidget {
  final FAQ faq;

  const FAQPage(this.faq, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(faq.question)),
      body: const Center(
        // child: Text("Page Title: ${faq.question} \nPage Content: ${faq.answer}"),
        child: Text("Page Content"),
      ),
    );
  }
}
