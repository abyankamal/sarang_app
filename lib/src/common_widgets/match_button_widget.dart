import 'package:flutter/material.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';

class MatchButtonWidget extends StatelessWidget {
  const MatchButtonWidget({
    super.key,
    this.dimensions = 50.0,
    required this.iconPath,
    required this.onTap
    });

  final double dimensions;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dimensions,
        height: dimensions,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              '${AssetImageIconManager.assetPath}/$iconPath'
            ),
            )
        ),
      ),
      );
  }
}