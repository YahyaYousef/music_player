import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_controller.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SearchPageController());
    return const Center(
      child: Text(
        'Search....',
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}
