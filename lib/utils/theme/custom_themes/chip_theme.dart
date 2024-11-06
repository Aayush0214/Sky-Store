import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class SkyChipTheme {
  SkyChipTheme._();

  /// light chip theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: SkyColors.black),
    selectedColor: SkyColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: SkyColors.white,
  );

  /// dark chip theme
  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: SkyColors.darkerGrey,
    labelStyle: TextStyle(color: SkyColors.white),
    selectedColor: SkyColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: SkyColors.white,
  );
}
