import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onabe_mobile/providers.dart';

class SearchAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = TextEditingController();
    return AppBar(
      title: SizedBox(
        height: 40,
        child: TextField(
          onChanged: (value) {
            ref.watch(searchQueryProvider.notifier).state = value;
          },
          controller: searchTextController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: '検索',
          ),
        ),
      ),
    );
  }
}
