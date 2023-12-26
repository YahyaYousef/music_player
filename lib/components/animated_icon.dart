import 'package:flutter/material.dart';

class CustomAnimatedIcon extends StatelessWidget {
  final Widget child;

  const CustomAnimatedIcon({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) => RotationTransition(
        turns: child.key == const ValueKey('play')
            ? Tween<double>(begin: 0.5, end: 1).animate(anim)
            : Tween<double>(begin: 0.5, end: 1).animate(anim),
        child: ScaleTransition(scale: anim, child: child),
      ),
      child: child,
    );
  }
}
