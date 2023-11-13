import 'package:flutter/material.dart';
import 'package:movemate_ui/presentation/core/asset.dart';

class PackageIcon extends StatelessWidget {
  const PackageIcon({super.key, required this.backgroundColor});
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: backgroundColor,
      child: Image.asset(
        Asset.package,
        scale: 25,
      ),
    );
  }
}
