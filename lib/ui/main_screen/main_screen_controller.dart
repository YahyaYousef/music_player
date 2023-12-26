import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_player/generated/assets.dart';
import 'package:music_player/models/pages_model.dart';
import 'package:music_player/ui/music_list/music_list_page.dart';
import 'package:music_player/ui/podcasts/podcasts_page.dart';
import 'package:music_player/ui/search/search_page.dart';
import 'package:music_player/ui/settings/settings_page.dart';

class MainScreenController extends GetxController {
  var selectedIndex = 0.obs;

  var pages = [
    PagesModel(
      icon: Assets.iconsHome,
      page: const MusicListPage(),
    ),
    PagesModel(
      icon: Assets.iconsSearch,
      page: const SearchPage(),
    ),
    PagesModel(
      icon: Assets.iconsHeadphone,
      page: Container(),
      isCircleButton: true,
    ),
    PagesModel(
      icon: Assets.iconsPodcasts,
      page: const PodcastsPage(),
    ),
    PagesModel(
      icon: Assets.iconsSettings,
      page: const SettingsPage(),
    ),
  ];

  var pageViewController = PageController();

  void changeScreen(int index) {
    selectedIndex(index);
    pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  double getCorrectPosition() {
    var screenWidth = Get.width;
    switch(selectedIndex.value){
      case 0:
        return ((screenWidth - 150) * selectedIndex.value / pages.length) + 10;
      case 1:
        return ((screenWidth + 100/1) * selectedIndex.value / pages.length);
      case 3:
        return ((screenWidth + 100/3) * selectedIndex.value / pages.length) + 15;
      case 4:
        return ((screenWidth + 100/4) * selectedIndex.value / pages.length) + 25;
    }
    return ((screenWidth + 100) * selectedIndex.value / pages.length);
  }
}
