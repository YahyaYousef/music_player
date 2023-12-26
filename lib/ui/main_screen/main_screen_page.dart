import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music_player/components/now_playing_bottom_panel/now_playing_bottom_panel.dart';

import 'main_screen_controller.dart';

class MainScreenPage extends GetView<MainScreenController> {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MainScreenController());
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: controller.pageViewController,
            physics: const NeverScrollableScrollPhysics(),
            children: controller.pages.map((e) => e.page).toList(),
          ),
          const NowPlayingBottomPanel(),
        ],
      ),
      bottomNavigationBar: Obx(
        () {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              BottomAppBar(
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: controller.pages
                            .map(
                              (pageData) => pageData.isCircleButton
                                  ? _buildBottomButton(pageData.icon)
                                  : _buildBottomIcon(
                                      pageData.icon,
                                      index: controller.pages.indexOf(pageData),
                                    ),
                            )
                            .toList(),
                      ),
                    ),
                    AnimatedPositioned(
                      left: controller.getCorrectPosition(),
                      duration: const Duration(milliseconds: 500),
                      width: 30,
                      height: 8,
                      curve: Curves.ease,
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 4,
                          left: 4,
                          right: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBottomButton(String icon) {
    return FloatingActionButton(
      onPressed: () {},
      mini: true,
      heroTag: UniqueKey(),
      child: SvgPicture.asset(
        icon,
        width: 20,
        height: 20,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildBottomIcon(String icon, {required int index}) {
    return IconButton(
      onPressed: () {
        _onIconTap(index);
      },
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: controller.selectedIndex.value == index ? 25 : 20,
        height: controller.selectedIndex.value == index ? 25 : 20,
        child: SvgPicture.asset(icon),
      ),
    );
  }

  void _onIconTap(int index) {
    controller.changeScreen(index);
  }
}
