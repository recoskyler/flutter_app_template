import "package:flex_color_scheme/flex_color_scheme.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "../config/theme.dart";

class ThemeHelper {
  static final ThemeData baseTheme = ThemeData(
    colorSchemeSeed: AppThemeConfig.primaryColor,
    useMaterial3: true,
    brightness: SchedulerBinding.instance.platformDispatcher.platformBrightness,
  );

  static final ThemeData lightThemeData = FlexThemeData.light(
    scheme: AppThemeConfig.flexScheme,
    useMaterial3: AppThemeConfig.useMaterial3,
    useMaterial3ErrorColors: AppThemeConfig.useMaterial3,
  );

  static final ThemeData darkThemeData = FlexThemeData.dark(
    scheme: AppThemeConfig.flexScheme,
    useMaterial3: AppThemeConfig.useMaterial3,
    useMaterial3ErrorColors: AppThemeConfig.useMaterial3,
  );

  static ThemeData getThemeDataFromMode(ThemeMode mode) =>
      mode == ThemeMode.dark
          ? darkThemeData
          : mode == ThemeMode.light
              ? lightThemeData
              : baseTheme;
}
