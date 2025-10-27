import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/theme/app_color/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeColorDark(BuildContext context, Locale? locale) => ThemeData(
  fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
  primaryColor: AppColorDark.primary,
  secondaryHeaderColor: AppColorDark.info,
  scaffoldBackgroundColor: AppColorDark.background,

  colorScheme: ColorScheme.dark(
    outline: Colors.white.withOpacity(.2),
    primaryContainer: AppColorDark.primaryContainer,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorDark.surface,
    surfaceTintColor: Colors.transparent,
  ),

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColorDark.iconPrimary),
      foregroundColor: WidgetStatePropertyAll(AppColorDark.background),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 47)),
      shape: const WidgetStatePropertyAll(
        ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          letterSpacing: .7,
          fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStateProperty.all(AppColorDark.buttonPrimary),
      foregroundColor: WidgetStateProperty.all(AppColorDark.onButtonPrimary),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 47)),
      shape: const WidgetStatePropertyAll(
        ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(27)),
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          letterSpacing: .7,
          fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevation: const WidgetStatePropertyAll(0),
      side: const WidgetStatePropertyAll(BorderSide.none),
      foregroundColor: WidgetStateProperty.all(AppColorDark.onButtonSecondary),
      backgroundColor: WidgetStateProperty.all(AppColorDark.buttonSecondary),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: AppColorDark.primary),
    checkColor: WidgetStatePropertyAll(AppColorDark.primary),
    fillColor: WidgetStatePropertyAll(AppColorDark.background),
  ),
  iconTheme: IconThemeData(color: AppColorDark.iconPrimary),

  radioTheme: RadioThemeData(
    fillColor: WidgetStatePropertyAll(AppColorDark.primary),
  ),
  textTheme: TextTheme(
    headlineLarge: _getTextStyle(
      AppColorDark.textPrimary,
      32,
      FontWeight.bold,
      context,
      locale,
    ),
    headlineMedium: _getTextStyle(
      AppColorDark.textPrimary,
      28,
      FontWeight.bold,
      context,
      locale,
    ),
    headlineSmall: _getTextStyle(
      AppColorDark.textPrimary,
      24,
      FontWeight.bold,
      context,
      locale,
    ),

    titleLarge: _getTextStyle(
      AppColorDark.textPrimary,
      22,
      FontWeight.w600,
      context,
      locale,
    ),
    titleMedium: _getTextStyle(
      AppColorDark.textPrimary,
      20,
      FontWeight.w600,
      context,
      locale,
    ),
    titleSmall: _getTextStyle(
      AppColorDark.textPrimary,
      18,
      FontWeight.w500,
      context,
      locale,
    ),

    bodyLarge: _getTextStyle(
      AppColorDark.textSecondary,
      16,
      FontWeight.normal,
      context,
      locale,
    ),
    bodyMedium: _getTextStyle(
      AppColorDark.textSecondary,
      14,
      FontWeight.normal,
      context,
      locale,
    ),
    bodySmall: _getTextStyle(
      AppColorDark.textSecondary,
      12,
      FontWeight.normal,
      context,
      locale,
    ),

    labelLarge: _getTextStyle(
      AppColorDark.textSecondary,
      16,
      FontWeight.w500,
      context,
      locale,
    ),
    labelMedium: _getTextStyle(
      AppColorDark.textSecondary,
      14,
      FontWeight.w500,
      context,
      locale,
    ),
    labelSmall: _getTextStyle(
      AppColorDark.textSecondary,
      12,
      FontWeight.w500,
      context,
      locale,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorDark.surface,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.primary),
    ),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.error.withOpacity(.5)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.error),
    ),
    prefixIconColor: AppColorDark.primary,
    labelStyle: TextStyle(color: AppColorDark.primary, fontSize: 16.0.sp),
    hintStyle: TextStyle(
      color: AppColorDark.textSecondary,
      fontSize: 17.sp,
      fontWeight: FontWeight.normal,
    ),
    suffixIconColor: AppColorDark.textSecondary,
    errorStyle: TextStyle(color: AppColorDark.error),
  ),

  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColorDark.background,
    dragHandleSize: const Size(double.infinity, 4),
    dragHandleColor: AppColorDark.primary,
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColorDark.primary,
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 18.sp)),
      foregroundColor: WidgetStatePropertyAll(AppColorDark.info),
    ),
  ),

  dividerTheme: DividerThemeData(
    color: AppColorDark.divider,
    thickness: 1.2,
    endIndent: 10,
    indent: 10,
  ),

  dialogTheme: DialogThemeData(backgroundColor: AppColorDark.background),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColorDark.primary,
    unselectedItemColor: AppColorDark.textDisabled,
    elevation: 10,
  ),

  expansionTileTheme: ExpansionTileThemeData(
    iconColor: AppColorDark.primary,
    shape: Border.all(width: 0, color: Colors.transparent),
  ),
);

TextStyle _getTextStyle(
  Color color,
  double fontSize,
  FontWeight fontWeight,
  BuildContext context,
  Locale? locale,
) {
  return TextStyle(
    color: color,
    fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
    // fontSize: fontSize * ScaleSize.textScaleFactor(context),
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}
