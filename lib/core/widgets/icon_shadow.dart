import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IconShadow extends StatelessWidget {
  final Icon icon;
  final bool showShadow;
  final Color shadowColor;

  const IconShadow({
    required this.icon,
    this.showShadow = true,
    this.shadowColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    var opacity = 0.2;
    var opacity2 = 0.06;
    var opacity3 = 0.01;
    var dimens = 1.0;
    var dimens2 = 2.0;
    var dimens3 = 3.0;
    var list = <Widget>[];

    if (showShadow) {
      list.addAll([
        Positioned(
          bottom: dimens3,
          right: dimens3,
          child: IconTheme(
            data: IconThemeData(opacity: opacity3),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          bottom: dimens3,
          left: dimens3,
          child: IconTheme(
            data: IconThemeData(opacity: opacity3),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          top: dimens3,
          left: dimens3,
          child: IconTheme(
            data: IconThemeData(opacity: opacity3),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          top: dimens3,
          right: dimens3,
          child: IconTheme(
            data: IconThemeData(opacity: opacity3),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
      ]);

      list.addAll([
        Positioned(
          bottom: dimens2,
          right: dimens2,
          child: IconTheme(
            data: IconThemeData(opacity: opacity2),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          bottom: dimens2,
          left: dimens2,
          child: IconTheme(
            data: IconThemeData(opacity: opacity2),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          top: dimens2,
          left: dimens2,
          child: IconTheme(
            data: IconThemeData(opacity: opacity2),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          top: dimens2,
          right: dimens2,
          child: IconTheme(
            data: IconThemeData(opacity: opacity2),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
      ]);

      list.addAll([
        Positioned(
          bottom: dimens,
          right: dimens,
          child: IconTheme(
            data: IconThemeData(opacity: opacity),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          bottom: dimens,
          left: dimens,
          child: IconTheme(
            data: IconThemeData(opacity: opacity),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          top: dimens,
          left: dimens,
          child: IconTheme(
            data: IconThemeData(opacity: opacity),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
        Positioned(
          top: dimens,
          right: dimens,
          child: IconTheme(
            data: IconThemeData(opacity: opacity),
            child: Icon(
              icon.icon,
              key: icon.key,
              color: shadowColor,
              size: icon.size,
              semanticLabel: icon.semanticLabel,
              textDirection: icon.textDirection,
            ),
          ),
        ),
      ]);
    }

    list.add(
      ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 0.9,
            sigmaY: 0.9,
          ),
          child: IconTheme(
            data: const IconThemeData(
              opacity: 1,
            ),
            child: icon,
          ),
        ),
      ),
    );

    list.add(
      IconTheme(
        data: const IconThemeData(
          opacity: 1,
        ),
        child: icon,
      ),
    );

    return Stack(
      alignment: Alignment.center,
      children: list,
    );
  }
}
