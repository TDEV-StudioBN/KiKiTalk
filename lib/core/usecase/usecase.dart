import 'package:kikitalk/core/result/result.dart';

abstract class UseCase<T, Params> {
  Future<Result<T>> call(Params params);
}

abstract class StreamUseCase<T, Params> {
  Stream<Result<T>> call(Params params);
}


class NoParams {
  const NoParams();
}
