import "package:flutter/material.dart";
import '../../helpers/theme_helper.dart';

class AppConfigState {
  final Locale locale;
  final ThemeMode themeMode;
  late ThemeData themeData;

  AppConfigState({required this.themeMode, required this.locale}) {
    themeData = ThemeHelper.getThemeDataFromMode(themeMode);
  }

  AppConfigState copyWith({ThemeMode? themeMode, Locale? locale}) =>
      AppConfigState(
        themeMode: themeMode ?? ThemeMode.system,
        locale: locale ?? const Locale("en"),
      );
}
