import 'package:elusiv/core/common_widgets/borders/themed_border.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemedTextField extends StatelessWidget {
  final TextEditingController controller;

  /// Determines the border width for all edges of the container.
  /// 
  /// This value is not used if [border] is not `null`.
  final double? borderWidth;

  /// Whether the alternate color scheme is used or not.
  /// 
  /// Set to `true` to use the alternate colors.
  final bool alternateColors;

  /// Determines the [borderRadius] of the container.
  /// 
  /// Overrides [borderRadiusValue] if not `null`.
  final BorderRadius? borderRadius;

  /// Determines the border radius value for all corners of the container.
  /// 
  /// This value is not used if [borderRadius] is not `null`.
  final double? borderRadiusValue;

  const ThemedTextField({
    super.key,
    required this.controller,
    this.borderWidth,
    this.borderRadiusValue,
    this.borderRadius,
    this.alternateColors = false,
  });

  @override
  Widget build(BuildContext context) {

    final fillColor = !alternateColors ? secondary : primary;

    BorderRadius finalBorderRadius;
    if (borderRadius != null) {finalBorderRadius = borderRadius!;}
    else {
      final borderRadiusvalues = borderRadiusValue != null 
      ? Radius.circular(borderRadiusValue!)
      : const Radius.circular(8);
      finalBorderRadius = BorderRadius.only(
        topLeft: borderRadiusvalues,
        topRight: borderRadiusvalues,
        bottomLeft: borderRadiusvalues,
        bottomRight: borderRadiusvalues,
      );
    }

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: finalBorderRadius,
          borderSide: ThemedBorderSide(width: borderWidth, alternateColors: !alternateColors).getBorderSide()
        ),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }
}