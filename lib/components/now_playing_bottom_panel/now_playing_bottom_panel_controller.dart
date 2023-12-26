import 'package:get/get.dart';

import 'package:music_player/ui/now_playing/now_playing_page.dart';

class NowPlayingBottomPanelController extends GetxService {

  RxString trackLabel = RxString('Finally Found You');


  void changeTrackLabel(String newLabel){
    trackLabel(newLabel);
  }

  void goToNowPlayingScreen(){
    Get.to(
          () => const NowPlayingPage(),
      transition: Transition.downToUp,
    );
  }

}
