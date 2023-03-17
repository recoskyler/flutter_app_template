import "package:flutter/material.dart";
import "../../helpers/theme_helper.dart";

class ThemeState {
  final ThemeMode themeMode;
  late ThemeData themeData;

  ThemeState({required this.themeMode}) {
    themeData = ThemeHelper.getThemeDataFromMode(themeMode);
  }

  ThemeState copyWith({ThemeMode? changeState}) =>
      ThemeState(themeMode: changeState ?? ThemeMode.system);
}
