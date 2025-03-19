import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../providers/search_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final searchResults = ref.watch(searchResultsProvider);
    final dummyNames = [
      "John Doe",
      "Jane Smith",
      "Peter Jones",
      "Alice Johnson",
      "David Williams",
      "Sarah Brown",
      "Michael Davis",
      "Emily Wilson",
      "Christopher Garcia",
      "Jessica Rodriguez",
      "Johnathan Doe",
      "Jane John",
      "Peter Parker",
      "Alice David",
      "David Brown",
      "Sarah Wilson",
      "Michael Johnson",
      "Emily Smith",
      "Christopher Williams",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBar(
          key: Key("search_bar_key"),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: AppColors.greyColor, width: 1.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade100),
          onChanged: (value) {
            ref.read(searchQueryProvider.notifier).state = value;
            final results =
                dummyNames
                    .where(
                      (name) =>
                          name.toLowerCase().contains(value.toLowerCase()),
                    )
                    .toList();
            ref.read(searchResultsProvider.notifier).state = results;
          },
          hintText: "Search keywords like SEVIS, United States, Canada",
          onSubmitted: (value) {
            ref.read(searchQueryProvider.notifier).state = value;
            final results =
                dummyNames
                    .where(
                      (name) =>
                          name.toLowerCase().contains(value.toLowerCase()),
                    )
                    .toList();
            ref.read(searchResultsProvider.notifier).state = results;
          },
        ),
        if (searchResults.isNotEmpty && searchQuery.isNotEmpty)
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(searchResults[index]));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
