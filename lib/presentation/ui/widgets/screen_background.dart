import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_campus/presentation/ui/utility/image_assets.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            ImageAssets.myCampusBackgroundSVG,
            fit: BoxFit.cover,
          ),
        ),
        child
      ],
    );
  }
}
