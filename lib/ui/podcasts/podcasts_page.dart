import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'podcasts_controller.dart';

class PodcastsPage extends GetView<PodcastsController> {
  const PodcastsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PodcastsController());
    return const Center(
      child: Text(
        'Podcasts',
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}
