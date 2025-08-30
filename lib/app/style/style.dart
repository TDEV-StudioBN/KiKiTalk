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
  static double get alphaCoefficient => 0.5;
  Color get primary => Theme.of(_context).primaryColor.withValues(alpha: alphaCoefficient);
  Color get secondary => Theme.of(_context).primaryColor.withValues(alpha: alphaCoefficient - 0.3);
  Color get backgroundPrimary => Theme.of(_context).primaryColor.withValues(alpha: alphaCoefficient - 0.4);
  Color get backgroundSecondary => Theme.of(_context).primaryColor.withValues(alpha: alphaCoefficient - 0.45);
  Color get statusBar => Theme.of(_context).primaryColor.withValues(alpha: alphaCoefficient - 0.25);
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

  static const double padding = 8;

  static const double textTitle = 18.0;
  static const double textBody = 14.0;

  // Small spacing
  static const double small1 = 10.0;
  static const double small2 = 12.0;
  static const double small3 = 14.0;
  static const double small4 = 16.0;

  // Medium spacing
  static const double medium1 = 18.0;
  static const double medium2 = 22.0;
  static const double medium3 = 26.0;
  static const double medium4 = 30.0;

  // Large spacing
  static const double large1 = 34.0;
  static const double large2 = 40.0;
  static const double large3 = 46.0;
  static const double large4 = 52.0;
}
