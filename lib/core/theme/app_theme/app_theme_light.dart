import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeColorLight(BuildContext context, Locale? locale) => ThemeData(
  fontFamily: font,
  primaryColor: AppColorLight.primary,

  secondaryHeaderColor: AppColorLight.onPrimary,
  scaffoldBackgroundColor: AppColorLight.background,

  colorScheme: ColorScheme.light(
    primary: AppColorLight.primary,
    secondary: AppColorLight.info,
    error: AppColorLight.error,
    outline: AppColorLight.border,
    primaryContainer: AppColorLight.primaryContainer,
  ),

  iconTheme: IconThemeData(color: AppColorLight.iconPrimary, size: 27.sp),

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColorLight.iconPrimary),
      foregroundColor: WidgetStatePropertyAll(AppColorLight.background),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 64)),
      shape: const WidgetStatePropertyAll(
        ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        ),
      ),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(
        AppColorLight.buttonPrimary,
      ),
      foregroundColor: const WidgetStatePropertyAll(
        AppColorLight.onButtonPrimary,
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          fontFamily: font,
          letterSpacing: 0.7,
        ),
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 64)),
      shape: const WidgetStatePropertyAll(
        ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        ),
      ),
      elevation: const WidgetStatePropertyAll(0),
      side: const WidgetStatePropertyAll(BorderSide.none),
      foregroundColor: const WidgetStatePropertyAll(
        AppColorLight.onButtonSecondary,
      ),
      backgroundColor: const WidgetStatePropertyAll(
        AppColorLight.buttonSecondary,
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: font,
          letterSpacing: 0.7,
        ),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll(AppColorLight.info),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 18.sp, fontFamily: font),
      ),
    ),
  ),

  radioTheme: const RadioThemeData(
    fillColor: WidgetStatePropertyAll(AppColorLight.primary),
  ),

  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(color: AppColorLight.primary),
    checkColor: WidgetStatePropertyAll(AppColorLight.primary),
    fillColor: WidgetStatePropertyAll(AppColorLight.background),
  ),

  textTheme: TextTheme(
    headlineLarge: _getTextStyle(
      AppColorLight.textPrimary,
      32,
      FontWeight.bold,
      context,
    ),
    headlineMedium: _getTextStyle(
      AppColorLight.textPrimary,
      28,
      FontWeight.bold,
      context,
    ),
    headlineSmall: _getTextStyle(
      AppColorLight.textPrimary,
      24,
      FontWeight.bold,
      context,
    ),
    titleLarge: _getTextStyle(
      AppColorLight.textPrimary,
      22,
      FontWeight.w600,
      context,
    ),
    titleMedium: _getTextStyle(
      AppColorLight.textPrimary,
      20,
      FontWeight.w600,
      context,
    ),
    titleSmall: _getTextStyle(
      AppColorLight.textPrimary,
      18,
      FontWeight.w500,
      context,
    ),
    bodyLarge: _getTextStyle(
      AppColorLight.textSecondary,
      16,
      FontWeight.normal,
      context,
    ),
    bodyMedium: _getTextStyle(
      AppColorLight.textSecondary,
      14,
      FontWeight.normal,
      context,
    ),
    bodySmall: _getTextStyle(
      AppColorLight.textSecondary,
      12,
      FontWeight.normal,
      context,
    ),
    labelLarge: _getTextStyle(
      AppColorLight.textSecondary,
      16,
      FontWeight.w500,
      context,
    ),
    labelMedium: _getTextStyle(
      AppColorLight.textSecondary,
      14,
      FontWeight.w500,
      context,
    ),
    labelSmall: _getTextStyle(
      AppColorLight.textSecondary,
      12,
      FontWeight.w500,
      context,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColorLight.onPrimary,
    selectionColor: AppColorLight.primary.withOpacity(0.5),
    selectionHandleColor: AppColorLight.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,

    fillColor: AppColorLight.surface.withOpacity(.8),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorLight.border, width: 1.5),
    ),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorLight.error.withOpacity(.5)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorLight.error),
    ),
    prefixIconColor: AppColorLight.textSecondary.withOpacity(.5),

    hintStyle: TextStyle(
      color: AppColorLight.textSecondary,
      fontSize: 17.sp,
      fontFamily: font,
    ),
    suffixIconColor: AppColorLight.textSecondary,
    errorStyle: TextStyle(color: AppColorLight.error),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorLight.background,
    dragHandleSize: Size(double.infinity, 4),
    dragHandleColor: AppColorLight.primary,
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColorLight.primary,
  ),

  dividerTheme: const DividerThemeData(
    color: AppColorLight.divider,
    thickness: 1.2,
    endIndent: 10,
    indent: 10,
  ),

  dialogTheme: DialogThemeData(backgroundColor: AppColorLight.background),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColorLight.primary,
    unselectedItemColor: AppColorLight.textDisabled,
    elevation: 10,
  ),

  expansionTileTheme: const ExpansionTileThemeData(
    iconColor: AppColorLight.primary,
    shape: Border(),
  ),

  cardTheme: CardThemeData(
    color: AppColorLight.surface,
    shadowColor: AppColorLight.shadow,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
    ),
  ),
);

TextStyle _getTextStyle(
  Color color,
  double fontSize,
  FontWeight fontWeight,
  BuildContext context,
) {
  return TextStyle(
    color: color,
    fontFamily: font,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}
