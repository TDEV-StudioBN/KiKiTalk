import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kikitalk/app/configs/auth_config.dart';
import 'package:kikitalk/utils/log.dart';
import 'package:kikitalk/features/user/presentation/states/login_bloc/event.dart';
import 'package:kikitalk/features/user/presentation/states/login_bloc/state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(STALoginInit()) {
    on<EVELoginWithGoogle>(_loginGoogle);
  }

  //  Đăng nhập bằng google ----------------------------------------------------
  Future<void> _loginGoogle(EVELoginWithGoogle event, Emitter<LoginState> emit) async {
    if(state is STALoginInProgress) return;
    emit(STALoginInProgress());
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;
      if(Platform.isAndroid) {
        await googleSignIn.initialize(
            serverClientId: AppAuthConfig.androidGoogle
        );
      }
      await googleSignIn.signOut();

      final account = await googleSignIn.authenticate();
      final avatar = account.photoUrl;
      final name = account.displayName;
      final email = account.email;
      final id = account.id;

      logInfo(avatar ?? '');
      logInfo(name ?? '');
      logInfo(email);
      logInfo(id);

      emit(STALoginSucsess(email: email));
    } catch (e, s) {
      logError(e.toString(), stackTrace: s);
      emit(STALoginError('Lỗi đăng nhập'));
      return;
    }
  }
}
