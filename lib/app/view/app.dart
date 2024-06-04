import 'package:challenge/cubit/theme/change_theme_cubit.dart';
import 'package:challenge/theme/theme.dart';
import 'package:challenge/ui/home/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_repository/graph_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  static SharedPreferences? mainSharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ToDosBloc>(
          create: (context) => ToDosBloc(client: client)..run(),
        ),
        BlocProvider<ChangeThemeCubit>(
          create: (context) => ChangeThemeCubit(
            mainSharedPreferences: App.mainSharedPreferences,
          ),
        ),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context1, ChangeThemeState themeState) {
          return MaterialApp(
            darkTheme: (themeState is ThemeAutoState)
                ? buildThemeData(myThemes[1])
                : (themeState is ThemeLightState)
                    ? buildThemeData(myThemes[0])
                    : buildThemeData(myThemes[1]),
            theme: (themeState is ThemeAutoState)
                ? buildThemeData(myThemes[0])
                : (themeState is ThemeLightState)
                    ? buildThemeData(myThemes[0])
                    : buildThemeData(myThemes[1]),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
