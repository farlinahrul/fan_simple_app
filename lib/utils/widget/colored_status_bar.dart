import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/resources.dart';

class ColoredStatusBar extends StatelessWidget {
  const ColoredStatusBar({
    Key? key,
    this.color,
    this.child,
    this.brightness = Brightness.dark,
    this.top = true,
  }) : super(key: key);

  final Color? color;
  final Widget? child;
  final Brightness brightness;
  final bool top;

  @override
  Widget build(BuildContext context) {
    final defaultColor = Resources.color.white;
    final androidIconBrightness =
        brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color ?? defaultColor,
        statusBarIconBrightness: androidIconBrightness,
        statusBarBrightness: brightness,
      ),
      child: Container(
        color: color ?? defaultColor,
        child: SafeArea(
          top: top,
          bottom: false,
          child: Container(
            color: Colors.white,
            child: SafeArea(
              top: top,
              bottom: false,
              child: Container(child: child),
            ),
          ),
        ),
      ),
    );
  }

  /// light background. dark text.
  factory ColoredStatusBar.light({required Widget child, Color? color}) {
    return ColoredStatusBar(
      color: color,
      brightness: Brightness.light,
      child: child,
    );
  }

  /// dark background. light text.
  factory ColoredStatusBar.dark(
      {required Widget child, Color? color, bool top = true}) {
    return ColoredStatusBar(
      color: color,
      brightness: Brightness.dark,
      top: top,
      child: child,
    );
  }
}
