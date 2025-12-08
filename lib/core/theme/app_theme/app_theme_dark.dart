import 'package:depi_graduation_project/core/constants/app_constants.dart';
import 'package:depi_graduation_project/core/theme/app_color/app_color_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeColorDark(BuildContext context, Locale? locale) => ThemeData(
  brightness: Brightness.dark,
  fontFamily: font,
  primaryColor: AppColorDark.primary,
  secondaryHeaderColor: AppColorDark.onPrimary,
  scaffoldBackgroundColor: AppColorDark.background,
  canvasColor: AppColorDark.background,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),

  colorScheme: ColorScheme.dark(
    primary: AppColorDark.primary,
    secondary: AppColorDark.info,
    error: AppColorDark.error,
    outline: AppColorDark.border,
    primaryContainer: AppColorDark.primaryContainer,
    surface: AppColorDark.surface,
    surfaceContainerLow: AppColorDark.shimmerBase,
    surfaceContainerHighest: AppColorDark.shimmerHighlight.withOpacity(.65),
  ),

  iconTheme: IconThemeData(color: AppColorDark.iconPrimary, size: 27.sp),

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColorDark.iconPrimary),
      foregroundColor: WidgetStatePropertyAll(AppColorDark.background),
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
      backgroundColor: const WidgetStatePropertyAll(AppColorDark.buttonPrimary),
      foregroundColor: const WidgetStatePropertyAll(
        AppColorDark.onButtonPrimary,
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
        AppColorDark.onButtonSecondary,
      ),
      backgroundColor: const WidgetStatePropertyAll(
        AppColorDark.buttonSecondary,
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
      foregroundColor: const WidgetStatePropertyAll(AppColorDark.info),
      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 18.sp, fontFamily: font),
      ),
    ),
  ),

  radioTheme: const RadioThemeData(
    fillColor: WidgetStatePropertyAll(AppColorDark.primary),
  ),

  checkboxTheme: const CheckboxThemeData(
    side: BorderSide(color: AppColorDark.primary),
    checkColor: WidgetStatePropertyAll(AppColorDark.primary),
    fillColor: WidgetStatePropertyAll(AppColorDark.background),
  ),

  textTheme: TextTheme(
    headlineLarge: _getTextStyle(
      AppColorDark.textPrimary,
      32,
      FontWeight.bold,
      context,
    ),
    headlineMedium: _getTextStyle(
      AppColorDark.textPrimary,
      28,
      FontWeight.bold,
      context,
    ),
    headlineSmall: _getTextStyle(
      AppColorDark.textPrimary,
      24,
      FontWeight.bold,
      context,
    ),
    titleLarge: _getTextStyle(
      AppColorDark.textPrimary,
      22,
      FontWeight.w600,
      context,
    ),
    titleMedium: _getTextStyle(
      AppColorDark.textPrimary,
      20,
      FontWeight.w600,
      context,
    ),
    titleSmall: _getTextStyle(
      AppColorDark.textPrimary,
      18,
      FontWeight.w500,
      context,
    ),
    bodyLarge: _getTextStyle(
      AppColorDark.textSecondary,
      16,
      FontWeight.normal,
      context,
    ),
    bodyMedium: _getTextStyle(
      AppColorDark.textSecondary,
      14,
      FontWeight.normal,
      context,
    ),
    bodySmall: _getTextStyle(
      AppColorDark.textSecondary,
      12,
      FontWeight.normal,
      context,
    ),
    labelLarge: _getTextStyle(
      AppColorDark.textSecondary,
      16,
      FontWeight.w500,
      context,
    ),
    labelMedium: _getTextStyle(
      AppColorDark.textSecondary,
      14,
      FontWeight.w500,
      context,
    ),
    labelSmall: _getTextStyle(
      AppColorDark.textSecondary,
      12,
      FontWeight.w500,
      context,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColorDark.onPrimary,
    selectionColor: AppColorDark.primary.withOpacity(0.5),
    selectionHandleColor: AppColorDark.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,

    fillColor: AppColorDark.surface.withOpacity(.8),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.border, width: 1.5),
    ),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.error.withOpacity(.5)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColorDark.error),
    ),
    prefixIconColor: AppColorDark.textSecondary.withOpacity(.5),

    hintStyle: TextStyle(
      color: AppColorDark.textSecondary,
      fontSize: 17.sp,
      fontFamily: font,
    ),
    suffixIconColor: AppColorDark.textSecondary,
    errorStyle: TextStyle(color: AppColorDark.error),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorDark.background,
    dragHandleSize: Size(double.infinity, 4),
    dragHandleColor: AppColorDark.primary,
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColorDark.primary,
  ),

  dividerTheme: const DividerThemeData(
    color: AppColorDark.divider,
    thickness: 1.2,
    endIndent: 10,
    indent: 10,
  ),

  dialogTheme: DialogThemeData(backgroundColor: AppColorDark.background),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColorDark.surface,
    selectedItemColor: AppColorDark.primary,
    unselectedItemColor: AppColorDark.iconSecondary,
    elevation: 10,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),

  expansionTileTheme: const ExpansionTileThemeData(
    iconColor: AppColorDark.primary,
    shape: Border(),
  ),

  cardTheme: CardThemeData(
    color: AppColorDark.surface,
    shadowColor: AppColorDark.shadow,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.r)),
    ),
  ),

  datePickerTheme: DatePickerThemeData(
    confirmButtonStyle: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll(AppColorDark.onPrimary),

      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          fontFamily: font,
        ),
      ),
    ),
    cancelButtonStyle: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll(AppColorDark.error),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          fontFamily: font,
        ),
      ),
    ),
    backgroundColor: AppColorDark.background,
    headerBackgroundColor: AppColorDark.primary,
    headerForegroundColor: AppColorDark.onPrimary,
    dayForegroundColor: WidgetStateProperty.all(AppColorDark.textPrimary),
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
