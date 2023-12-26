class MusicModel {
  String title;
  String singer;
  String duration;
  bool isPlaying;

  MusicModel({
    required this.title,
    required this.singer,
    required this.duration,
    this.isPlaying = false
  });
}
