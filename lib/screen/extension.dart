
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_bloc.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_state.dart';

extension Auth on BuildContext {
  String get userEmail => (read<AuthBloc>().state as STAAuthSuccess).email;
}