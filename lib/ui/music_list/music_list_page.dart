import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_player/components/animated_icon.dart';
import 'package:music_player/generated/assets.dart';
import 'package:music_player/ui/now_playing/now_playing_page.dart';

import 'music_list_controller.dart';

class MusicListPage extends GetView<MusicListController> {
  const MusicListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MusicListController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALL SONGS'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.iconsSearch,
            ),
          )
        ],
      ),
      body: GetBuilder<MusicListController>(builder: (controller) {
        return ListView.builder(
          padding: const EdgeInsets.only(left: 8,right: 8,bottom: 60),
          itemCount: controller.music.length,
          itemBuilder: (context, index) {
            return _buildMusicListTile(index);
          },
        );
      }),
    );
  }

  Widget _buildMusicListTile(int index) {
    var music = controller.music[index];
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        tileColor: music.isPlaying ? Colors.white12 : null,
        onTap: () {
          controller.onPlayPausePressed(index);
          Get.to(
            () => const NowPlayingPage(),
            transition: Transition.downToUp,
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        title: Text(
          music.title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          music.singer,
          style: const TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w100),
        ),
        trailing: Text(
          music.duration,
          style: const TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.w100),
        ),
        leading: FloatingActionButton(
          heroTag: music.hashCode,
          onPressed: () {
            controller.onPlayPausePressed(index);
          },
          mini: true,
          backgroundColor:
              music.isPlaying ? Get.theme.colorScheme.secondary : Colors.white,
          child: CustomAnimatedIcon(
            child: music.isPlaying
                ? SvgPicture.asset(
                    Assets.iconsPause,
                    key: const ValueKey('pause'),
                  )
                : SvgPicture.asset(
                    Assets.iconsPlay,
                    key: const ValueKey('play'),
                  ),
          ),
        ),
      ),
    );
  }
}
