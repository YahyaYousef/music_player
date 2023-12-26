import 'dart:ui';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_player/components/animated_icon.dart';
import 'package:music_player/generated/assets.dart';

import 'now_playing_controller.dart';

class NowPlayingPage extends GetView<NowPlayingController> {
  const NowPlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NowPlayingController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Now Playing'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.iconsSearch,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesCoverImage,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      _buildCoverImage(),
                      _buildButtons(),
                      _buildTrackInfo(),
                      const SizedBox(
                        height: 50,
                      ),
                      _buildSeekBar(),
                      _buildMediaController(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoverImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesWave,
          width: Get.width,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        Container(
          width: 250,
          height: 250,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                Assets.imagesCoverImage,
              ),
            ),
          ),
          child: Center(
            child: Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              label: const Text(
                'FOLLOW',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.shuffle,
                color: Colors.white,
              ),
              label: const Text(
                'SHUFFLE PLAY',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackInfo() {
    return const Column(
      children: [
        Text(
          'Finally Found You',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 19,
          ),
        ),
        Text(
          'enrique iglesias',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w100,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSeekBar() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Obx(() {
        return ProgressBar(
          progress: controller.currentProgress.value,
          total: const Duration(minutes: 3, seconds: 50),
          timeLabelType: TimeLabelType.remainingTime,
          timeLabelLocation: TimeLabelLocation.sides,
          timeLabelTextStyle: const TextStyle(color: Colors.white),
          progressBarColor: Get.theme.colorScheme.secondary,
          baseBarColor: Colors.white24,
          thumbColor: Colors.white,
          barHeight: 3.0,
          thumbRadius: 5,
          thumbGlowRadius: 10,
          onSeek: controller.onSeek,
        );
      }),
    );
  }

  Widget _buildMediaController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildControlButton(icon: Assets.iconsRewind),
        _buildControlButton(icon: Assets.iconsBackward),
        GetBuilder<NowPlayingController>(builder: (controller) {
          return FloatingActionButton(
            onPressed: controller.playPausePressed,
            backgroundColor: Colors.white,
            child: CustomAnimatedIcon(
              child: controller.timer.isActive
                  ? SvgPicture.asset(
                Assets.iconsPause,
                key: const ValueKey('pause'),
                width: 25,
                colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              )
                  : SvgPicture.asset(
                Assets.iconsPlay,
                key: const ValueKey('play'),
                width: 20,
                colorFilter: ColorFilter.mode(
                  Get.theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        }),
        _buildControlButton(icon: Assets.iconsNext),
        _buildControlButton(icon: Assets.iconsForward),
      ],
    );
  }

  Widget _buildControlButton({
    required String icon,
  }) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        icon,
        width: 25,
      ),
    );
  }
}
