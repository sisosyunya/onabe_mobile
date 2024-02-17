import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchAppBar extends HookWidget implements PreferredSizeWidget{
  const SearchAppBar({super.key});
 @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const TextField(
        // onChanged: (value) => searchQueryState.state = value,
        decoration: InputDecoration(
          hintText: 'Search FAQs...',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
