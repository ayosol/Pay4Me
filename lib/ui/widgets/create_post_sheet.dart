import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/image_strings.dart';

void showCreatePostBottomSheet(
  BuildContext context,
  TextEditingController postController,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.85,
        widthFactor: 1,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profile),
                        radius: 24,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Paul Adah',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '@paulsunday',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: TextField(
                    key: Key("post_text_field"),
                    controller: postController,
                    decoration: InputDecoration(
                      hintText: 'Write your post',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    maxLines: 8,
                    autofocus: true,
                  ),
                ),
                Divider(height: 1, thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: ImageIcon(
                              AssetImage(AppImages.imgIcon),
                              color: AppColors.blackColor,
                            ),
                            onPressed: () {
                              // Handle image upload
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.video_call, color: Colors.grey),
                            onPressed: () {
                              // Handle video upload
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.gif, color: Colors.grey),
                            onPressed: () {
                              // Handle GIF selection
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.list, color: Colors.grey),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      ElevatedButton(
                        key: Key("post_button"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
