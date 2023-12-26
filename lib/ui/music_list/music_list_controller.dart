import 'package:get/get.dart';
import 'package:music_player/components/now_playing_bottom_panel/now_playing_bottom_panel_controller.dart';
import 'package:music_player/models/music_model.dart';

class MusicListController extends GetxController {


  var bottomPanelController = Get.find<NowPlayingBottomPanelController>();

  var music = <MusicModel>[
    MusicModel(title: 'Bailando', singer: 'Billy Ray Cyrus', duration: '3:54'),
    MusicModel(title: 'Cuando Me Enamoron', singer: 'Mabel', duration: '3:54'),
    MusicModel(title: 'Dirty Dancer', singer: 'Alec Benjamin', duration: '3:54'),
    MusicModel(title: 'Finally Found You', singer: 'Alec Benjamin', duration: '3:54',isPlaying: true),
    MusicModel(title: 'Heart Attack', singer: 'Bazzi', duration: '3:54'),
    MusicModel(title: 'Heartbeat', singer: 'Jonas Brothers', duration: '3:54'),
    MusicModel(title: 'Hero', singer: 'BLACKPINK', duration: '3:54'),
    MusicModel(title: 'Move To Miami', singer: 'BLACKPINK', duration: '3:54'),
    MusicModel(title: 'Bailando', singer: 'Billy Ray Cyrus', duration: '3:54'),
    MusicModel(title: 'Cuando Me Enamoron', singer: 'Mabel', duration: '3:54'),
    MusicModel(title: 'Dirty Dancer', singer: 'Alec Benjamin', duration: '3:54'),
    MusicModel(title: 'Finally Found You', singer: 'Alec Benjamin', duration: '3:54'),
    MusicModel(title: 'Heart Attack', singer: 'Bazzi', duration: '3:54'),
    MusicModel(title: 'Heartbeat', singer: 'Jonas Brothers', duration: '3:54'),
    MusicModel(title: 'Hero', singer: 'BLACKPINK', duration: '3:54'),
    MusicModel(title: 'Move To Miami', singer: 'BLACKPINK', duration: '3:54'),
  ];

  void onPlayPausePressed(int index) {
    var currentPlayingMusic = music.firstWhere((element) => element.isPlaying);
    currentPlayingMusic.isPlaying = false;
    music[index].isPlaying = true;
    bottomPanelController.changeTrackLabel(music[index].title);
    update();
  }

}
