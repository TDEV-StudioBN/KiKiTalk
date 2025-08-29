import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/features/cumulativepoint/domain/entities/cumulativepoint_entity.dart';
import 'package:kikitalk/features/cumulativepoint/domain/usecases/cumulativepoint_get_usecase.dart';

class CumulativePointState {
  final bool loading;
  final ENTCumulativePoint? data;
  final String? error;

  const CumulativePointState({
    this.loading = false,
    this.data,
    this.error,
  });

  CumulativePointState copyWith({
    bool? loading,
    ENTCumulativePoint? data,
    String? error,
  }) {
    return CumulativePointState(
      loading: loading ?? this.loading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}

class CumulativePointCubit extends Cubit<CumulativePointState> {
  final UCECumulativePointWatch usecase;

  StreamSubscription? _subscription;

  CumulativePointCubit(this.usecase) : super(const CumulativePointState());

  void start(String email) {
    emit(state.copyWith(loading: true));

    _subscription?.cancel();
    _subscription = usecase(UCECumulativePointWatchParams(email: email)).listen((result) {
      if (result is Success<ENTCumulativePoint>) {
        emit(state.copyWith(loading: false, data: result.value));
      } else if (result is Fail<ENTCumulativePoint>) {
        emit(state.copyWith(loading: false, error: result.error.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
