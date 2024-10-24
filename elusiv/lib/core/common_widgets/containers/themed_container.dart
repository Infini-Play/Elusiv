
import 'package:elusiv/core/common_widgets/borders/themed_border.dart';
import 'package:elusiv/core/common_widgets/containers/themed_container_no_borders.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// A container consitent with the theme of the app.
class ThemedContainer extends ThemedContainerNoBorders {


  /// Determines the border width for all edges of the container.
  /// 
  /// This value is not used if [border] is not `null`.
  final double? borderWidth;

  /// Determines the [border] of the container.
  /// 
  /// Overrides [borderWidth] if not `null`.
  final Border? border;

  const ThemedContainer({
    super.key,
    super.child,
    super.width,
    super.height,
    super.padding,
    super.margin,
    super.borderRadiusValue,
    super.borderRadius,
    super.alternateColors,
    super.elevation,
    this.borderWidth,
    this.border,
  });

  @override
  Widget build(BuildContext context) {

    final double shownElevation = elevation ?? 0.0;
    final containerColor = alternateColors ? secondary : primary;

    final borderSide = ThemedBorderSide(width: borderWidth, alternateColors: alternateColors);
    final finalBorder = ThemedBorder(borderSide: borderSide).getBorder();

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
          border: finalBorder,
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