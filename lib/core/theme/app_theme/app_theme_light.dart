import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeColorLight(BuildContext context, Locale? locale) => ThemeData(
  fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
  primaryColor: AppColorLight.primaryColor,
  secondaryHeaderColor: AppColorLight.secondaryColor,
  scaffoldBackgroundColor: AppColorLight.scaffoldBackgroundColor,

  colorScheme: ColorScheme.light(
    primary: AppColorLight.primaryColor,
    secondary: AppColorLight.secondaryColor,
    error: AppColorLight.errorColor,
    outline: AppColorLight.borderColor,
    primaryContainer: AppColorLight.containerBackgroundColor,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorLight.appBarColor,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
  ),

  iconTheme: const IconThemeData(
    color: AppColorLight.iconPrimaryColor,
    size: 27,
  ),

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: const WidgetStatePropertyAll(AppColorLight.iconPrimaryColor),
      foregroundColor: const WidgetStatePropertyAll(
        AppColorLight.backgroundColor,
      ),
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
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(AppColorLight.primaryColor),
      foregroundColor: const WidgetStatePropertyAll(
        AppColorLight.backgroundColor,
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
          letterSpacing: 0.7,
        ),
      ),
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
      elevation: const WidgetStatePropertyAll(0),
      side: const WidgetStatePropertyAll(
        BorderSide(color: AppColorLight.primaryColor, width: 1.2),
      ),
      foregroundColor: const WidgetStatePropertyAll(AppColorLight.primaryColor),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
          letterSpacing: 0.7,
        ),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll(
        AppColorLight.linkTextColor,
      ),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.sp,
          fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
        ),
      ),
    ),
  ),

  radioTheme: const RadioThemeData(
    fillColor: WidgetStatePropertyAll(AppColorLight.primaryColor),
  ),

  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(color: AppColorLight.primaryColor),
    checkColor: WidgetStatePropertyAll(AppColorLight.primaryColor),
    fillColor: WidgetStatePropertyAll(AppColorLight.backgroundColor),
  ),

  textTheme: TextTheme(
    headlineLarge: _getTextStyle(
      AppColorLight.textPrimary,
      32,
      FontWeight.bold,
      context,
      locale,
    ),
    headlineMedium: _getTextStyle(
      AppColorLight.textPrimary,
      28,
      FontWeight.bold,
      context,
      locale,
    ),
    headlineSmall: _getTextStyle(
      AppColorLight.textPrimary,
      24,
      FontWeight.bold,
      context,
      locale,
    ),
    titleLarge: _getTextStyle(
      AppColorLight.textPrimary,
      22,
      FontWeight.w600,
      context,
      locale,
    ),
    titleMedium: _getTextStyle(
      AppColorLight.textPrimary,
      20,
      FontWeight.w600,
      context,
      locale,
    ),
    titleSmall: _getTextStyle(
      AppColorLight.textPrimary,
      18,
      FontWeight.w500,
      context,
      locale,
    ),
    bodyLarge: _getTextStyle(
      AppColorLight.textSecondary,
      16,
      FontWeight.normal,
      context,
      locale,
    ),
    bodyMedium: _getTextStyle(
      AppColorLight.textSecondary,
      14,
      FontWeight.normal,
      context,
      locale,
    ),
    bodySmall: _getTextStyle(
      AppColorLight.textSecondary,
      12,
      FontWeight.normal,
      context,
      locale,
    ),
    labelLarge: _getTextStyle(
      AppColorLight.textTertiary,
      16,
      FontWeight.w500,
      context,
      locale,
    ),
    labelMedium: _getTextStyle(
      AppColorLight.textTertiary,
      14,
      FontWeight.w500,
      context,
      locale,
    ),
    labelSmall: _getTextStyle(
      AppColorLight.textTertiary,
      12,
      FontWeight.w500,
      context,
      locale,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorLight.containerBackgroundColor.withOpacity(.6),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorLight.borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorLight.primaryColor),
    ),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorLight.errorColor.withOpacity(.5)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorLight.errorColor),
    ),
    prefixIconColor: AppColorLight.primaryColor,
    labelStyle: TextStyle(color: AppColorLight.primaryColor, fontSize: 16.sp),
    hintStyle: TextStyle(color: AppColorLight.textTertiary, fontSize: 17.sp),
    suffixIconColor: AppColorLight.textTertiary,
    errorStyle: TextStyle(color: AppColorLight.errorColor),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorLight.backgroundColor,
    dragHandleSize: Size(double.infinity, 4),
    dragHandleColor: AppColorLight.primaryColor,
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColorLight.primaryColor,
  ),

  dividerTheme: const DividerThemeData(
    color: AppColorLight.dividerColor,
    thickness: 1.2,
    endIndent: 10,
    indent: 10,
  ),

  dialogTheme: DialogThemeData(backgroundColor: AppColorLight.backgroundColor),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColorLight.primaryColor,
    unselectedItemColor: AppColorLight.textDisabled,
    elevation: 10,
  ),

  expansionTileTheme: const ExpansionTileThemeData(
    iconColor: AppColorLight.primaryColor,
    shape: Border(),
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
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}
