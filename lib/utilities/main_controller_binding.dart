import 'package:get/get.dart';
import 'package:music_player/components/now_playing_bottom_panel/now_playing_bottom_panel_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NowPlayingBottomPanelController());
  }
}