import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kikitalk/app/assets/assets.dart';
import 'package:kikitalk/app/ui/snackbars/snackbar.dart';
import 'package:kikitalk/app/ui/widgets/buttons.dart';
import 'package:kikitalk/features/user/presentation/states/login_bloc/bloc.dart';
import 'package:kikitalk/features/user/presentation/states/login_bloc/event.dart';
import 'package:kikitalk/features/user/presentation/states/login_bloc/state.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_bloc.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_event.dart';

class SCRLogin extends StatelessWidget {
  const SCRLogin({super.key});

  void _onError(BuildContext context, String message) {
    SnackbarHelper.showError(context, message);
  }

  void _onSucsess(BuildContext context, String email) {
    context.read<AuthBloc>().add(EVEAuth(email: email));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is STALoginError) {
                _onError(context, state.message);
              }
              else if(state is STALoginSucsess) {
                _onSucsess(context, state.email);
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>
              (builder: (childContext, state) {
              if (state is! STALoginSucsess) {
                return const _LoginScreen();
              }
              return const Center(child: Text('Thành công'));
            }),
          )
      ),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();

  void handleGoogleSignIn(BuildContext context) {
    context.read<LoginBloc>().add(EVELoginWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              /// Button Login Google ------------------------------------------
              WIDButton(
                onTap: () => handleGoogleSignIn(context),
                borderRadius: BorderRadius.circular(16),
                color: Colors.brown.withValues(alpha: 0.5),
                child: SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        width: 45,
                        child: Image.asset(AppAsset.path.images.login.logoGoogle),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Tiếp tục với Google',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}