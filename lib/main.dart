import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/app_config/app_config_cubit.dart';
import 'bloc/app_config/app_config_state.dart';
import 'helpers/shared_preferences_provider.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SharedPreferencesProvider.init();

  await FlutterDisplayMode.setHighRefreshRate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppConfigCubit(),
      child: BlocBuilder<AppConfigCubit, AppConfigState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: S.supportedLocales,
            onGenerateTitle: (context) => S.of(context)!.title,
            theme: state.themeData,
            themeMode: state.themeMode,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
