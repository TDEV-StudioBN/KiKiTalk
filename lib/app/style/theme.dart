import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kikitalk/utils/shared_preferences_util.dart';

class AppThemeProvider extends StatelessWidget {
  final Widget Function(BuildContext, AppThemeData) builder;
  const AppThemeProvider({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppThemeCubit>(
      create: (_) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, AppThemeData>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: state.mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
            statusBarIconBrightness: state.mode == ThemeMode.dark ? Brightness.light : Brightness.dark,
          ));
          return builder(context, state);
        },
      ),
    );
  }
}

class AppThemeCubit extends Cubit<AppThemeData> {
  final _cache = UTISharedPreferences.storage;

  AppThemeCubit() : super(AppThemeData._init()) {
    _loadStyleFromCache();
  }

  // --- Theme sáng ------------------------------------------------------------
  static ThemeData _lightTheme(Color primaryColor) => ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,

    textTheme: GoogleFonts.pangolinTextTheme(
      ThemeData.light().textTheme,
    ),
    useMaterial3: true,
  );

  // --- Theme tối -------------------------------------------------------------
  static ThemeData _darkTheme(Color primaryColor) => ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,

    textTheme: GoogleFonts.pangolinTextTheme(
      ThemeData.dark().textTheme,
    ),
    useMaterial3: true,
  );

  // --- Load theme từ cache ---------------------------------------------------
  Future<void> _loadStyleFromCache() async {
    final mode = _cache.getString('mode');
    final primaryColorValue = _cache.getInt('primaryColor') ?? Colors.deepPurple.toARGB32();
    final primaryColor = Color(primaryColorValue);

    emit(state._updateTheme(
      light: _lightTheme(primaryColor),
      dark: _darkTheme(primaryColor),
      mode: ThemeMode.values.firstWhere(
            (element) => element.name == mode,
        orElse: () => ThemeMode.light,
      ),
    ));
  }

  // --- Set theme sáng --------------------------------------------------------
  Future<void> setLightTheme() async {
    if(state.mode == ThemeMode.light) return;
    await _cache.setString('mode', ThemeMode.light.name);
    emit(state._updateTheme(
      mode: ThemeMode.light,
    ));
  }

  // --- Set theme tối ---------------------------------------------------------
  Future<void> setDarkTheme() async {
    if(state.mode == ThemeMode.dark) return;
    await _cache.setString('mode', ThemeMode.dark.name);
    emit(state._updateTheme(
      mode: ThemeMode.dark,
    ));
  }

  // ---  Hệ thống  ------------------------------------------------------------
  Future<void> setSystemTheme() async {
    if(state.mode == ThemeMode.system) return;
    await _cache.setString('mode', ThemeMode.system.name);
    emit(state._updateTheme(
      mode: ThemeMode.system,
    ));
  }

  // --- Đổi màu primary runtime -----------------------------------------------
  Future<void> setPrimaryColor(Color color) async {
    if(state.light.primaryColor == color) return;
    await _cache.setInt('primaryColor', color.toARGB32());
    emit(state._updateTheme(
      light: _lightTheme(color),
      dark: _darkTheme(color),
    )
    );
  }
}

class AppThemeData {
  final ThemeData light;
  final ThemeData dark;
  final ThemeMode mode;

  AppThemeData._init() :
        light = ThemeData.light(),
        dark = ThemeData.dark(),
        mode = ThemeMode.system;
  AppThemeData._(this.light, this.dark, this.mode);

  AppThemeData _updateTheme({ThemeData? light, ThemeData? dark, ThemeMode? mode}) {
    return AppThemeData._(
      light ?? this.light,
      dark ?? this.dark,
      mode ?? this.mode,
    );
  }
}