import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kikitalk/app/style/theme.dart';

sealed class IAppStyle {
  final BuildContext _context;
  IAppStyle(this._context);
}

class AppStyle extends IAppStyle {
  AppStyle(super.context);

  AppColor get color => AppColor._(_context);
  AppSize get size => AppSize._(_context);
  AppTheme get theme => AppTheme._(_context);
}

class AppTheme extends IAppStyle {
  AppTheme._(super.context);

  AppThemeData get data => _context.read<AppThemeCubit>().state;
}

class AppColor extends IAppStyle {
  AppColor._(super.context);

  Color get primary => Theme.of(_context).primaryColor.withValues(alpha: 0.5);
  Color get secondary => Theme.of(_context).primaryColor.withValues(alpha: 0.2);
  Color get backgroundPrimary => Theme.of(_context).primaryColor.withValues(alpha: 0.2);
  Color get backgroundSecondary => Theme.of(_context).primaryColor.withValues(alpha: 0.05);
  Color get statusBar => Theme.of(_context).primaryColor.withValues(alpha: 0.33);
  Color get textPrimary => Theme.of(_context).primaryColor;
  Color get textSecondary => Theme.of(_context).primaryColor.withValues(alpha: 0.5);
  Color get cardColor => Theme.of(_context).cardColor;
}

class AppSize extends IAppStyle {
  AppSize._(super.context);

  double get statusBar => MediaQuery.of(_context).padding.top;
  Size get sizeScreen => MediaQuery.of(_context).size;
  double get heightScreen => MediaQuery.of(_context).size.height;
  double get widthScreen => MediaQuery.of(_context).size.width;

  static double get padding => 8;

  static double get small1 => 10.0;
  static double get small2 => 15.0;
  static double get small3 => 20.0;
  static double get small4 => 25.0;

  static double get medium1 => 30.0;
  static double get medium2 => 40.0;
  static double get medium3 => 50.0;
  static double get medium4 => 60.0;

  static double get large1 => 70.0;
  static double get large2 => 80.0;
  static double get large3 => 90.0;
}
