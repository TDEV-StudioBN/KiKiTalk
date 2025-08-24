import 'package:kikitalk/core/result/failure.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Fail<T> extends Result<T> {
  final Failure error;
  final T? value;
  const Fail(this.error, {this.value});
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Fail<T>;

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Failure error, [T? value]) onFailure,
  }) {
    return switch (this) {
      Success(:final value) => onSuccess(value),
      Fail(:final error, :final value) => onFailure(error, value),
    };
  }
}
