import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utils/image_strings.dart';
import '../models/post.dart';

String generateUid() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}

final postProvider = StateNotifierProvider<PostNotifier, List<Post>>((ref) {
  return PostNotifier();
});

class PostNotifier extends StateNotifier<List<Post>> {
  PostNotifier() : super([
    Post(
      id: '1',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
      media: [],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 0,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '2',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah just got a new laptop, hehe.',
      media: [
        Media(
          mediaUrl: AppImages.laptops,
          mediaType: 'image',
        ),
      ],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 4,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '3',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
      media: [],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 0,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '4',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah just got a new laptop, hehe.',
      media: [
        Media(
          mediaUrl: AppImages.laptop,
          mediaType: 'image',
        ),
      ],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 4,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '5',
      username: '2023 Complaints',
      handle: '',
      content: 'Coca-Cola refreshments to quench your thirsts',
      media: [
        Media(
          mediaUrl: AppImages.cokeFlower,
          mediaType: 'gif',
        ),
      ],
      likes: 89,
      isLiked: false,
      comments: 400,
      reposts: 4,
      postImage: AppImages.coke,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: true,
    ),
    Post(
      id: '6',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
      media: [],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 0,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '7',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
      media: [],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 0,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '8',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
      media: [],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 0,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '9',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
      media: [],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 0,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
    Post(
      id: '10',
      username: 'Paul Adah',
      handle: '@paulsunday',
      content: 'Paul Adah What is it like to study in Orlando with their What is it like to study in Orlando with their  ',
      media: [],
      likes: 89,
      isLiked: false,
      comments: 4,
      reposts: 0,
      postImage: AppImages.person,
      postDateTime: DateTime(2021, 9, 1, 11, 23),
      isAdvertisement: false,
    ),
  ]);

  void likePost(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(
            likes: state[i].isLiked ? state[i].likes - 1 : state[i].likes + 1,
            isLiked: !state[i].isLiked,
          )
        else
          state[i]
    ];
  }
}

extension PostExtension on Post {
  Post copyWith({int? likes, bool? isLiked}) {
    return Post(
      id: id,
      username: username,
      handle: handle,
      content: content,
      media: media,
      likes: likes ?? this.likes,
      isLiked: isLiked ?? this.isLiked,
      comments: comments,
      reposts: reposts,
      postImage: postImage,
      postDateTime: postDateTime,
      isAdvertisement: isAdvertisement,
    );
  }
}