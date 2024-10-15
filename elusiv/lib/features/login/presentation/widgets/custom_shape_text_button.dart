import 'package:elusiv/core/common_widgets/themed_container.dart';
import 'package:elusiv/core/common_widgets/themed_container_no_borders.dart';
import 'package:elusiv/core/localization/string_extensions.dart';
import 'package:flutter/material.dart';

class CustomShapeTextButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;

  const CustomShapeTextButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // 80% of screenWidth
    final buttonWidth = screenWidth * 0.75;

    return ThemedContainer(
      borderRadiusValue: 8,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.blue.withOpacity(0.5),
          highlightColor: Colors.blue.withOpacity(0.3),
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}