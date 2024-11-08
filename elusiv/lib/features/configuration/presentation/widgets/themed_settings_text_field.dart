import 'package:flutter/material.dart';
import 'package:elusiv/core/theme/app_theme.dart';

class ThemedSettingsTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  static const double _borderRadiusValue = 12.0;
  static const double _borderWidth = 2.0;
  static const bool _alternateColors = false;
  static const double _width = double.infinity;
  static const double _height = 60.0;

  const ThemedSettingsTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const fillColor = !_alternateColors ? secondary : primary;
    final BorderRadius finalBorderRadius = BorderRadius.circular(_borderRadiusValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: const TextStyle(fontSize: 16),
          ),
        SizedBox(
          width: _width,
          height: _height,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: finalBorderRadius,
                borderSide: const BorderSide(
                  width: _borderWidth,
                  color: Colors.black,
                ),
              ),
              filled: true,
              fillColor: fillColor,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}