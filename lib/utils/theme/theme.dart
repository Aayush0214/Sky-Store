import 'package:flutter/material.dart';
import 'package:sky_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:sky_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:sky_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:sky_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:sky_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:sky_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:sky_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:sky_store/utils/theme/custom_themes/text_theme.dart';

class SkyAppTheme {
  /// private constructor to avoid creating instances
  SkyAppTheme._();

  /// light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    chipTheme: SkyChipTheme.lightChipTheme,
    textTheme: SkyTextTheme.lightTextTheme,
    appBarTheme: SkyAppBarTheme.lightAppBarTheme,
    checkboxTheme: SkyCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: SkyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SkyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SkyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SkyTextFormFieldTheme.lightInputDecorationTheme,
  );

  /// dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    chipTheme: SkyChipTheme.darkChipTheme,
    textTheme: SkyTextTheme.darkTextTheme,
    appBarTheme: SkyAppBarTheme.darkAppBarTheme,
    checkboxTheme: SkyCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: SkyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SkyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SkyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SkyTextFormFieldTheme.darkInputDecorationTheme,
  );
}
