import 'package:elusiv/core/common_widgets/custom_shape_button.dart';
import 'package:elusiv/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginRegisterButton extends StatelessWidget {
  final void Function()? onTap;
  final String message;
  final bool borders;
  final bool alternateColors;
  final double elevation;

  const LoginRegisterButton({
    super.key,
    required this.onTap,
    required this.message,
    this.borders = true,
    this.alternateColors = false,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 80% of screenWidth
    final buttonWidth = screenWidth * 0.75;
    return CustomShapeButton(
      width: buttonWidth,
      onTap: onTap, 
      elevation: elevation,
      borders: borders,
      alternateColors: alternateColors,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}