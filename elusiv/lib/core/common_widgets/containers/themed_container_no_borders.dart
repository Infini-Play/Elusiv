import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// A container consitent with the theme of the app.
/// 
/// This version does not have any borders.
class ThemedContainerNoBorders extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;

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

  /// A container consistent with the theme of the app
  const ThemedContainerNoBorders({
    super.key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.elevation,
    this.borderRadiusValue,
    this.borderRadius,
    this.alternateColors = false,
  });

  @override
  Widget build(BuildContext context) {

    final double shownElevation = elevation ?? 0.0;
    final containerColor = alternateColors ? secondary : primary;

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

    return Material(
      elevation: shownElevation,
      borderRadius: finalBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: finalBorderRadius,
        ),
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        child: child,
      ),
    );
  }
}