import 'package:flutter/material.dart';
import 'package:movemate_ui/presentation/core/asset.dart';

class PackageIcon extends StatelessWidget {
  const PackageIcon({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.scale = 25,
    this.hasBackground = true,
  });
  final Color backgroundColor;
  final double scale;
  final bool hasBackground;

  @override
  Widget build(BuildContext context) {
    if (hasBackground) {
      return CircleAvatar(
        radius: 15,
        backgroundColor: backgroundColor,
        child: Image.asset(
          Asset.package,
          scale: scale,
        ),
      );
    }

    return Image.asset(
      Asset.package,
      scale: scale,
    );
  }
}
