import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _productsSearcher = HitsSearcher(
    applicationID: 'YN6GNHV33F',
    apiKey: '70439f32ac90dd19d92102206459997f',
    indexName: 'faq');

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
