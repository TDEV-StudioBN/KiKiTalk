import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/features/cumulativepoint/domain/entities/cumulativepoint_entity.dart';
import 'package:kikitalk/features/cumulativepoint/domain/usecases/cumulativepoint_get_usecase.dart';

class CumulativePointState {
  final ENTCumulativePoint? data;

  const CumulativePointState({
    this.data,
  });

  CumulativePointState copyWith({
    ENTCumulativePoint? data,
  }) {
    return CumulativePointState(
      data: data ?? this.data,
    );
  }
}

class CumulativePointCubit extends Cubit<CumulativePointState> {
  final UCECumulativePointWatch usecase;

  StreamSubscription? _subscription;

  CumulativePointCubit(this.usecase) : super(const CumulativePointState());

  void start(String email) {
    _subscription?.cancel();
    _subscription = usecase(UCECumulativePointWatchParams(email: email)).listen((result) {
      if (result is Success<ENTCumulativePoint>) {
        emit(state.copyWith(data: result.value));
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
