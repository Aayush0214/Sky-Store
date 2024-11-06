import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class SkyPrimaryHeaderContainer extends StatelessWidget {
  const SkyPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SkyCurvedEdgeWidget(
      child: Container(
        color: SkyColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: SkyCircularContainer(
                backgroundColor: SkyColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: SkyCircularContainer(
                backgroundColor: SkyColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
