import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/theme/app_color/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeColorDark(BuildContext context, Locale? locale) => ThemeData(
  fontFamily: locale?.languageCode == 'ar' ? fontArabic : fontEnglish,
  primaryColor: AppColorDark.primaryColor,
  secondaryHeaderColor: AppColorDark.secondaryColor,
  scaffoldBackgroundColor: AppColorDark.backgroundColor,

  //
  colorScheme: ColorScheme.dark(
    outline: Colors.white.withOpacity(.2),
    primaryContainer: AppColorDark.containerBackgroundColor,
  ),
  //AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorDark.appBarColor,
    surfaceTintColor: Colors.transparent,
  ),

  //Icon Button
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColorDark.iconPrimaryColor),
      foregroundColor: WidgetStatePropertyAll(AppColorDark.backgroundColor),
    ),
  ),

  //Elevated Button
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
      backgroundColor: WidgetStateProperty.all(
        AppColorDark.primaryColor,
      ), // Button background color
      foregroundColor: WidgetStateProperty.all(
        AppColorDark.textPrimary,
      ), // Text color
    ),
  ),

  //outlinedButton
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
      side: WidgetStatePropertyAll(
        BorderSide(color: AppColorDark.primaryColor, width: 1.2),
      ),
      foregroundColor: WidgetStateProperty.all(AppColorDark.primaryColor),
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: AppColorDark.primaryColor),
    checkColor: WidgetStatePropertyAll(AppColorDark.primaryColor),
    fillColor: WidgetStatePropertyAll(AppColorDark.backgroundColor),
  ),
  //Icon
  iconTheme: IconThemeData(color: AppColorDark.iconPrimaryColor),

  //Radio
  radioTheme: RadioThemeData(
    fillColor: WidgetStatePropertyAll(AppColorDark.primaryColor),
  ),
  // Text,
  textTheme: TextTheme(
    // Headline - Large Titles (Used for Page Titles or Important Headlines)
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

    // Title - Medium Titles (Used for Section Titles)
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

    // Body - Normal Text (Used for Main Paragraphs and Content)
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

    // Labels -   Small Captions
    labelLarge: _getTextStyle(
      AppColorDark.textTertiary,
      16,
      FontWeight.w500,
      context,
      locale,
    ),
    labelMedium: _getTextStyle(
      AppColorDark.textTertiary,
      14,
      FontWeight.w500,
      context,
      locale,
    ),
    labelSmall: _getTextStyle(
      AppColorDark.textTertiary,
      12,
      FontWeight.w500,
      context,
      locale,
    ),
  ),

  // Text Field
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorDark.containerBackgroundColor,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.primaryColor),
    ),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.errorColor.withOpacity(.5)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.errorColor),
    ),
    prefixIconColor: AppColorDark.primaryColor,
    labelStyle: TextStyle(color: AppColorDark.primaryColor, fontSize: 16.0.sp),
    hintStyle: TextStyle(
      color: AppColorDark.textTertiary,
      fontSize: 17.sp,
      fontWeight: FontWeight.normal,
      // fontFamily: isRTL(context) ? fontArabic : fontEnglish,
    ),
    suffixIconColor: AppColorDark.textTertiary,
    errorStyle: TextStyle(
      color: AppColorDark.errorColor,
      // fontFamily: isRTL(context) ? fontArabic : fontEnglish,
    ),
  ),

  //Bottom Sheet
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColorDark.backgroundColor,
    dragHandleSize: const Size(double.infinity, 4),
    dragHandleColor: AppColorDark.primaryColor,
  ),

  // Progress Indicator
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColorDark.primaryColor,
  ),

  //Text Button
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          // fontFamily: isRTL(context) ? fontArabic : fontEnglish,
          fontSize: 18.sp,
        ),
      ),
      foregroundColor: WidgetStatePropertyAll(AppColorDark.linkTextColor),
    ),
  ),

  //Divider
  dividerTheme: DividerThemeData(
    color: AppColorDark.dividerColor,
    thickness: 1.2,
    endIndent: 10,
    indent: 10,
  ),

  //Dialog
  dialogTheme: DialogThemeData(backgroundColor: AppColorDark.backgroundColor),

  // Bottom Navigation Bar
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: AppColorDark.primaryColor,
    unselectedItemColor: AppColorDark.textDisabled,
    elevation: 10,
  ),

  // Expansion Tile
  expansionTileTheme: ExpansionTileThemeData(
    iconColor: AppColorDark.primaryColor,
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
