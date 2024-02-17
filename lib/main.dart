import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onabe_mobile/pages/top_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'おなべモバイル',
      home: const TopPage(),
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
    );
  }
}
