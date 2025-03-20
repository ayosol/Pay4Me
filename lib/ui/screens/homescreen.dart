import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/post_provider.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/create_post_fab.dart';
import '../widgets/create_post_sheet.dart';
import '../widgets/post_widget.dart';
import '../widgets/search_bar.dart';
import '../widgets/top_nav_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postProvider);

    final TextEditingController postController = TextEditingController();

    return Scaffold(
      appBar: TopNavBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                "Community",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SearchBarWidget(),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostWidget(post: posts[index], index: index);
                  },
                ),
              ),
            ],
          ),
        )
      ),
      bottomNavigationBar: bottomNavBar(context),
      floatingActionButton: CreatePostFAB(
        onPressed: () {
          showCreatePostBottomSheet(context, postController);
        },
      ),
    );
  }
}
