final class Video {
  final String title;
  final String thumbnailUrl;
  final String videoId;
  bool shouldShowVideo = false;

  Video({
    required this.title,
    required this.thumbnailUrl,
    required this.videoId
  });
}