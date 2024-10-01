
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemedContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Border? border;
  final double? borderRadiusValue;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ThemedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.borderWidth,
    this.borderRadiusValue,
    this.borderRadius,
    this.padding,
    this.margin,
    this.border,
  });

  @override
  Widget build(BuildContext context) {

    // Border logic
    // borderWidth is ignored if a border is passed in
    Border finalBorder;
    if (border != null) {finalBorder = border!;}
    else {
      final borders = borderWidth != null 
      ? BorderSide(color: onPrimary, width: borderWidth!)
      : const BorderSide(color: onPrimary, width: 2);
      finalBorder = Border(top: borders, bottom: borders, left: borders, right: borders);
    }

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
    

    return Container(
      decoration: BoxDecoration(
        color: primary,
        border: finalBorder,
        borderRadius: finalBorderRadius,
      ),
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}