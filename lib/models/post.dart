class Post {
  final String id;
  final String username;
  final String handle;
  final String content;
  final List<Media> media;
  final int likes;
  final bool isLiked;
  final int comments;
  final int reposts;
  final String postImage;
  final DateTime postDateTime;
  final bool isAdvertisement;


  Post({
    required this.id,
    required this.username,
    required this.handle,
    required this.content,
    required this.media,
    required this.likes,
    required this.isLiked,
    required this.comments,
    required this.reposts,
    required  this.postImage,
    required this.postDateTime,
    required this.isAdvertisement,
  });
}


class Media {
  final String mediaUrl;
  final String mediaType;

  Media({
    required this.mediaUrl,
    required this.mediaType,
  });
}