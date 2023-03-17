import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../helpers/shared_preferences_provider.dart";
import "theme_state.dart";

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            themeMode: ThemeMode
                .values[SharedPreferencesProvider.getInt("theme_mode") ?? 2]));

  void changeThemeMode(ThemeState newState) {
    SharedPreferencesProvider.setInt("theme_mode", newState.themeMode.index);

    emit(newState);
  }
}
