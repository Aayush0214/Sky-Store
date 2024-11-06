import 'package:flutter/material.dart';
import 'package:sky_store/utils/constants/colors.dart';

class SkyCircularLoader extends StatelessWidget {
  const SkyCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: SkyColors.white,
        color: SkyColors.primary,
        strokeWidth: 5,
      ),
    );
  }
}
