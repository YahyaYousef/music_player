import 'package:flutter/material.dart';

class PagesModel {
  String icon;

  Widget page;

  bool isCircleButton;

  PagesModel({
    required this.icon,
    required this.page,
    this.isCircleButton = false,
  });
}
