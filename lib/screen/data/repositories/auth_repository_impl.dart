import 'package:kikitalk/utils/log.dart';
import 'package:kikitalk/core/result/failure.dart';
import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/screen/data/datasources/local.dart';
import 'package:kikitalk/screen/data/models/auth_model.dart';
import 'package:kikitalk/screen/domain/entities/auth_entity.dart';
import 'package:kikitalk/screen/domain/repositories/auth_repository.dart';

class REPAuthImpl extends REPAuth {
  final LDSAuth _local;
  REPAuthImpl(this._local);

  @override
  Future<Result<bool>> auth(ENTAuth auth) async {
    try {
      final result = await _local.auth(MODAuth.fromEntity(auth));
      return Success(result);
    } catch (e, s) {
      logError(e.toString(), stackTrace: s);
      return const Fail(DatabaseFailure.writeError());
    }
  }

  @override
  Future<Result<bool>> signOut() async {
    try {
      final result = await _local.signOut();
      return Success(result);
    } catch (e, s) {
      logError(e.toString(), stackTrace: s);
      return const Fail(DatabaseFailure.writeError());
    }
  }

  @override
  Future<Result<ENTAuth?>> getAuth() async {
    try {
      final result = await _local.getAuth();
      if (result == null) {
        return const Success(null);
      }
      return Success(result);
    } catch (e, s) {
      logError(e.toString(), stackTrace: s);
      return const Fail(DatabaseFailure.getError());
    }
  }
}