import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemedBorder {

  final Border border;
  ThemedBorder({
    ThemedBorderSide? borderSide,
  }) : border = Border(
    top: borderSide?.getBorderSide() ?? ThemedBorderSide().getBorderSide(),
    bottom: borderSide?.getBorderSide() ?? ThemedBorderSide().getBorderSide(),
    left: borderSide?.getBorderSide() ?? ThemedBorderSide().getBorderSide(),
    right: borderSide?.getBorderSide() ?? ThemedBorderSide().getBorderSide(),
  );

  Border getBorder() {
    return border;
  }

}


class ThemedBorderSide {

  final double? width;
  final bool alternateColors;
  final BorderSide borderSide;
  ThemedBorderSide({
    this.width,
    this.alternateColors = false,
  }): borderSide = BorderSide(
    color: alternateColors ? onSecondary : onPrimary, 
    width: width ?? 2,
  );

  BorderSide getBorderSide() {
    return borderSide;
  }
}