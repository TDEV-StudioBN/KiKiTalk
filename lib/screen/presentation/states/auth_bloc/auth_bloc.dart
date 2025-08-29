import 'package:bloc/bloc.dart';
import 'package:kikitalk/core/result/failure.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/core/usecase/usecase.dart';
import 'package:kikitalk/screen/constants/message_contants.dart';
import 'package:kikitalk/screen/domain/entities/auth_entity.dart';
import 'package:kikitalk/screen/domain/usecase/auth.dart';
import 'package:kikitalk/screen/domain/usecase/get_auth.dart';
import 'package:kikitalk/screen/domain/usecase/singout.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_event.dart';
import 'package:kikitalk/screen/presentation/states/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UCEAuth _auth;
  final UCESingout _singout;
  final UCEGetAuth _getAuth;

  AuthBloc(this._auth, this._singout, this._getAuth)
      : super(STAAuthInitial()) {
    on<EVEAuth>(_onAuth);
    on<EVESingout>(_onSingout);
    on<EVEGetAuth>(_onGetAuth);
  }

  void _onAuth(EVEAuth event, Emitter<AuthState> emit) async {
    emit(STAAuthLoading());
    final result = await _auth(AuthParams(email: event.email));
    result.fold(
        onSuccess: (bool value) {
          emit(STAAuthSuccess(email: event.email));
        },
        onFailure: (Failure error) {
          emit(STAAuthFailure(message: CONAuthMessage.failSingin));
        }
    );
  }

  void _onSingout(EVESingout event, Emitter<AuthState> emit) async {
    emit(STAAuthLoading());
    final result = await _singout(const NoParams());
    result.fold(
        onSuccess: (bool value) {
          emit(STAAuthSignOut());
        },
        onFailure: (Failure error) {
          emit(STAAuthFailure(message: CONAuthMessage.failSingout));
        }
    );
  }

  void _onGetAuth(EVEGetAuth event, Emitter<AuthState> emit) async {
    emit(STAAuthSignOut());
    final result = await _getAuth(const NoParams());
    result.fold(
        onSuccess: (ENTAuth? value) {
          if (value != null) {
            emit(STAAuthSuccess(email: value.emailAuth));
          }
        },
        onFailure: (Failure error) {
          emit(STAAuthFailure(message: CONAuthMessage.failSingin));
        }
    );
  }
}