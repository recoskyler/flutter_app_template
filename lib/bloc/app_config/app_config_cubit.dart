import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import '../../helpers/shared_preferences_provider.dart';
import 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit()
      : super(
          AppConfigState(
            themeMode: ThemeMode
                .values[SharedPreferencesProvider.getInt("theme_mode") ?? 2],
            locale:
                Locale(SharedPreferencesProvider.getString("locale") ?? "en"),
          ),
        );

  void changeThemeMode(AppConfigState newState) async {
    await SharedPreferencesProvider.setInt(
      "theme_mode",
      newState.themeMode.index,
    );

    emit(newState);
  }

  void changeLocale(AppConfigState newState) async {
    await SharedPreferencesProvider.setString(
      "locale",
      newState.locale.languageCode,
    );

    emit(newState);
  }
}
