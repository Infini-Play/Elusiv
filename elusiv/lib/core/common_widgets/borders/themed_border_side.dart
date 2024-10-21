import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

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