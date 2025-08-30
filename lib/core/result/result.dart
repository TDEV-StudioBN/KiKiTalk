import 'package:kikitalk/core/result/failure.dart';

sealed class Result<T> {
  const Result();

  factory Result.success(T value) = Success<T>;
  factory Result.error(Failure error) = Fail<T>;
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Fail<T> extends Result<T> {
  final Failure error;
  const Fail(this.error);
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Fail<T>;

  R fold<R>({
    required R Function(T value) onSuccess,
    required R Function(Failure error) onFailure,
  }) {
    return switch (this) {
      Success(:final value) => onSuccess(value),
      Fail(:final error) => onFailure(error),
    };
  }
}
