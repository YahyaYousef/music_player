import 'dart:async';

import 'package:get/get.dart';

class NowPlayingController extends GetxController {

  Rx<Duration> currentProgress = Rx(Duration.zero);
  Duration totalDuration = const Duration(minutes: 3, seconds: 50);

  late Timer timer;

  @override
  void onInit() {
    initTimer();
    super.onInit();
  }

  void onSeek(Duration value) {
    currentProgress(currentProgress.value + value);
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void initTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        onSeek(const Duration(seconds: 1));
        var compare = currentProgress.value.compareTo(totalDuration);
        if(compare != -1) {
          timer.cancel();
        }
      },
    );
  }

  void playPausePressed() {
    if(timer.isActive){
      timer.cancel();
    }else{
      initTimer();
    }
    update();
  }
}
