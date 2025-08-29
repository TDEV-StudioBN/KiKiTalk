import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kikitalk/core/di.dart';
import 'package:kikitalk/app/ui/snackbars/snackbar.dart';
import 'package:kikitalk/features/user/presentation/screens/login.dart';
import 'package:kikitalk/screen/presentation/screens/main_screen.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_bloc.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_event.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_state.dart';

class SCRKikiTalk extends StatelessWidget {
  const SCRKikiTalk({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(getIt(), getIt(), getIt())..add(EVEGetAuth()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is STAAuthFailure) {
            SnackbarHelper.showError(context, state.message);
          }
        },
        child: const _KikiTalkScreen(),
      ),
    );
  }
}

class _KikiTalkScreen extends StatelessWidget {
  const _KikiTalkScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is! STAAuthSuccess) {
            return const SCRLogin();
          }
          return const SCRMain();
    });
  }
}