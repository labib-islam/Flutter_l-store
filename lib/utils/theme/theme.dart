import 'package:flutter/material.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter_l_store/utils/theme/custom_themes/text_theme.dart';

import '../constants/colors.dart';

class LAppTheme {
  LAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: LTextTheme.lightTextTheme,
    chipTheme: LChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: LAppBarTheme.lightAppBarTheme,
    checkboxTheme: LCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: LBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: LElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: LOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: LTextFormFieldTheme.lightInputDecorationTheme
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: LTextTheme.darkTextTheme,
      chipTheme: LChipTheme.darkChipTheme,
      scaffoldBackgroundColor: LColors.black,
      appBarTheme: LAppBarTheme.darkAppBarTheme,
      checkboxTheme: LCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: LBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: LElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: LOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: LTextFormFieldTheme.darkInputDecorationTheme,
  );
}
