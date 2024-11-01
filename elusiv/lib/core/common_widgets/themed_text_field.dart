import 'package:elusiv/core/common_widgets/borders/themed_border.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemedTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final double? height;
  final String? hintText;
  final double? borderWidth;
  final bool alternateColors;
  final BorderRadius? borderRadius;
  final double? borderRadiusValue;
  final bool obscureText;
  final TextInputType? keyboardType; // New property

  const ThemedTextField({
    super.key,
    required this.controller,
    this.borderWidth,
    this.borderRadiusValue,
    this.borderRadius,
    this.width,
    this.height,
    this.hintText,
    this.alternateColors = false,
    this.obscureText = false,
    this.keyboardType, // New property initialization
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = !alternateColors ? secondary : primary;

    BorderRadius finalBorderRadius;
    if (borderRadius != null) {
      finalBorderRadius = borderRadius!;
    } else {
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

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType, // Use the new property
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: finalBorderRadius,
            borderSide: ThemedBorderSide(width: borderWidth, alternateColors: !alternateColors).getBorderSide()
          ),
          filled: true,
          fillColor: fillColor,
        ),
      ),
    );
  }
}
