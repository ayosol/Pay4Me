import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/image_strings.dart';
import '../../models/post.dart';
import '../../providers/post_provider.dart';

class PostWidget extends ConsumerWidget {
  final Post post;
  final int index;

  const PostWidget({Key? key, required this.post, required this.index})
      : super(key: key);

  String showTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12
        ? 'PM'
        : 'AM'}';
  }

  void _showMediaDialog(BuildContext context) {
    {
      bool isNotified = false;

      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 16),
                  ListTile(
                    leading: Text(
                      "Actions",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(Icons.close, size: 32),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading:
                    isNotified
                        ? Icon(
                      Icons.notifications,
                      color: Colors.blueAccent,
                      size: 30,
                    )
                        : ImageIcon(
                      AssetImage(AppImages.notificationOff),
                      size: 24,
                      color:
                      isNotified
                          ? Colors.blueAccent
                          : AppColors.greyColor,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(isNotified ? "Don't Notify Me" : 'Notify Me'),
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      setState(() {
                        isNotified = !isNotified;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  ListTile(
                    leading: ImageIcon(
                      AssetImage(AppImages.editPost),
                      size: 24,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('Edit Post'),
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      //Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  ListTile(
                    leading: ImageIcon(
                      AssetImage(AppImages.flagPost),
                      size: 24,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('Flag Post'),
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      //Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 8),
                  Divider(),
                ],
              );
            },
          );
        },
      );
    }
  }

  Widget buildMediaWidget(BuildContext context, Media media) {
    double screenWidth = MediaQuery.of(context).size.width;
    BoxFit fit = screenWidth > 600 ? BoxFit.fitWidth : BoxFit.cover;

    switch (media.mediaType) {
      case 'image':
        return Image.asset(media.mediaUrl, fit: fit);
      case 'gif':
        return Image.asset(media.mediaUrl, fit: BoxFit.contain);
      default:
        return Container();
    }
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double itemHeight = MediaQuery.of(context).size.width > 600 ? 400 : 300;

    return Card(
      color: AppColors.cardColor,
      elevation: 0.5,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(post.postImage),
                      radius: 20,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.username,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        post.isAdvertisement
                            ? Container(
                          decoration: BoxDecoration(
                            color: AppColors.darkGreyColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Text(
                              'Sponsored Ad',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                            : Text(
                          post.handle,
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      showTime(post.postDateTime),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    IconButton(
                      onPressed: () => _showMediaDialog(context),
                      icon: Icon(Icons.more_horiz, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),

            // Post Content (Text)
            Text(post.content),
            SizedBox(height: 8),

            // Post Content (Media)
            if (post.media.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: SizedBox(
                  height: itemHeight,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 1.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: post.media.length,
                    itemBuilder: (context, mediaIndex) {
                      return Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: buildMediaWidget(
                            context,
                            post.media[mediaIndex],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

            // Action Buttons (Like, Comment, Repost)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: ImageIcon(AssetImage(AppImages.comment), size: 24),
                  onPressed: () {
                    // Open comments screen
                    print("Comment Icon pressed!");
                  },
                ),
                Text('${post.comments}'),
                SizedBox(width: 16),
                IconButton(
                  icon: ImageIcon(
                    AssetImage(post.isLiked ? AppImages.liked : AppImages.like),
                    size: 24,
                    color:
                    post.isLiked
                        ? AppColors.greenColor
                        : AppColors.blackColor,
                  ),
                  onPressed: () {
                    print("Like Icon pressed!");
                    ref.read(postProvider.notifier).likePost(index);
                  },
                ),
                Text('${post.likes}'),
                SizedBox(width: 16),
                IconButton(
                  icon: ImageIcon(AssetImage(AppImages.repost), size: 24),
                  onPressed: () {
                    print("Repost Icon pressed!");
                  },
                ),
                Text('${post.reposts}'),
              ],
            ),

            // Replies Bar
            if (post.comments > 0)
              Container(
                decoration: BoxDecoration(
                  color:
                  post.isAdvertisement
                      ? AppColors.adRepliesBarColor
                      : AppColors.repliesBarColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'View replies',
                        style: TextStyle(
                          color:
                          post.isAdvertisement
                              ? AppColors.whiteColor
                              : AppColors.repliesBarTextColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Open replies screen
                          print("Replies Icon pressed!");
                        },
                        icon: Row(
                          children: [
                            Text(
                              '${post.comments} Replies',
                              style: TextStyle(
                                color:
                                post.isAdvertisement
                                    ? AppColors.whiteColor
                                    : AppColors.repliesBarTextColor,
                              ),
                            ),
                            SizedBox(width: 8),
                            ImageIcon(
                              AssetImage(AppImages.arrowRight),
                              size: 16,
                              color:
                              post.isAdvertisement
                                  ? AppColors.whiteColor
                                  : AppColors.repliesBarTextColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

}