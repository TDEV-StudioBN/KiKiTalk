import 'package:kikitalk/core/result/result.dart';
import 'package:kikitalk/screen/domain/entities/auth_entity.dart';

abstract class REPAuth {
  Future<Result<bool>> auth(ENTAuth auth);
  Future<Result<bool>> signOut();
  Future<Result<ENTAuth?>> getAuth();
}