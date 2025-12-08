import 'package:depi_graduation_project/components/custom_app_bar_widget.dart';
import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/utils/language/language_cubit.dart';
import 'package:depi_graduation_project/generated/l10n.dart';
import 'package:depi_graduation_project/core/utils/language/language_state.dart';
import 'package:depi_graduation_project/core/utils/theme/theme_cubit.dart';
import 'package:depi_graduation_project/core/utils/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;

  _toggleSwitch() {
    setState(() {
      _notificationsEnabled = !_notificationsEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: S.of(context).settingsTitle),
      body: Column(
        children: [
          ListTile(
            title: Text(S.of(context).settingsNotifications),
            trailing: Transform.scale(
              scale: 0.7,
              child: Switch(
                value: _notificationsEnabled,
                activeThumbColor: Theme.of(context).colorScheme.primary,
                activeTrackColor: Theme.of(
                  context,
                ).colorScheme.primary.withOpacity(.2),
                onChanged: (val) {
                  _toggleSwitch();
                },
              ),
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              String themeName;
              if (state.themeMode == ThemeMode.dark) {
                themeName = S.of(context).settingsDark;
              } else if (state.themeMode == ThemeMode.light) {
                themeName = S.of(context).settingsLight;
              } else {
                themeName = S.of(context).settingsSystem;
              }

              return ListTile(
                title: Text(S.of(context).settingsTheme),
                trailing: Text(themeName, style: TextStyle(fontSize: 16.sp)),
                onTap: () => showThemeSheet(context),
              );
            },
          ),

          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              String langName = state.locale.languageCode == "ar"
                  ? S.of(context).settingsArabic
                  : S.of(context).settingsEnglish;

              return ListTile(
                title: Text(S.of(context).settingsLanguage),
                trailing: Text(langName, style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  showLanguageSheet(context);
                },
              );
            },
          ),

          ListTile(
            title: Text(S.of(context).settingsPrivacyPolicy),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouteNames.privacyPolicyScreenRoute,
              );
            },
            trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
          ),

          ListTile(
            title: Text(S.of(context).settingsTerms),

            trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRouteNames.termsAndConditionsScreenRoute,
              );
            },
          ),

          ListTile(
            title: Text(S.of(context).settingsAbout),
            trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
            onTap: () {
              Navigator.pushNamed(context, AppRouteNames.aboutScreenRoute);
            },
          ),
          Spacer(),

          Text(S.of(context).settingsVersion),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void showThemeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final theme = Theme.of(context);
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).settingsChooseTheme,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),

                  _themeOption(
                    context,
                    S.of(context).settingsLight,
                    ThemeMode.light,
                    state.themeMode,
                    theme,
                  ),
                  _themeOption(
                    context,
                    S.of(context).settingsDark,
                    ThemeMode.dark,
                    state.themeMode,
                    theme,
                  ),
                  _themeOption(
                    context,
                    S.of(context).settingsSystem,
                    ThemeMode.system,
                    state.themeMode,
                    theme,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _themeOption(
    BuildContext context,
    String title,
    ThemeMode mode,
    ThemeMode current,
    ThemeData theme,
  ) {
    return RadioListTile<ThemeMode>(
      value: mode,
      groupValue: current,
      contentPadding: EdgeInsets.zero,
      activeColor: theme.colorScheme.primary,
      title: Text(title, style: theme.textTheme.bodyLarge),
      onChanged: (_) {
        context.read<ThemeCubit>().changeTheme(mode);
        Navigator.pop(context);
      },
    );
  }

  void showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final theme = Theme.of(context);
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).settingsChooseLanguage,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),

                  _langOption(
                    context,
                    S.of(context).settingsEnglish,
                    "en",
                    state.locale.languageCode,
                    theme,
                  ),
                  _langOption(
                    context,
                    S.of(context).settingsArabic,
                    "ar",
                    state.locale.languageCode,
                    theme,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _langOption(
    BuildContext context,
    String title,
    String code,
    String current,
    ThemeData theme,
  ) {
    return RadioListTile<String>(
      value: code,
      groupValue: current,
      contentPadding: EdgeInsets.zero,
      activeColor: theme.colorScheme.primary,
      title: Text(title, style: theme.textTheme.bodyLarge),
      onChanged: (_) {
        context.read<LanguageCubit>().changeLanguage(code);
        Navigator.pop(context);
      },
    );
  }
}
