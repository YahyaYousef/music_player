import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/generated/assets.dart';

import 'now_playing_bottom_panel_controller.dart';

class NowPlayingBottomPanel extends GetView<NowPlayingBottomPanelController> {
  const NowPlayingBottomPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: ClipRect(
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: 30,
              width: Get.width * 0.5,
              margin: const EdgeInsetsDirectional.only(start: 11),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 10, vertical: 2),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                      tileMode: TileMode.repeated,
                    ),
                    child: Container(
                      width: Get.width,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Get.theme.colorScheme.primary.withOpacity(0.1),
                          Get.theme.colorScheme.primary.withOpacity(0.08),
                        ],
                      )),
                      child: InkWell(
                        onTap: controller.goToNowPlayingScreen,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.imagesNowPlaying,
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 10,),
                              Obx(() {
                                return Expanded(
                                  child: Text(
                                    controller.trackLabel.value,
                                    style: GoogleFonts.lato(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                );
                              }),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      Assets.iconsPause,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      Assets.iconsNext,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
