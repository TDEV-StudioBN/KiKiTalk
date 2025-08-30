import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kikitalk/app/style/style.dart';
import 'package:kikitalk/app/style/theme.dart';

export 'package:kikitalk/app/style/theme.dart';

extension AppStyleExtension on BuildContext {
  AppStyle get style => AppStyle(this);
  AppThemeCubit get styleConfig => read<AppThemeCubit>();
}
