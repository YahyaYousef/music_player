import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    return const Center(
      child: Text(
        'Settings',
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}
