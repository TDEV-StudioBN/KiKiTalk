import 'package:server/src/controllers/response.dart';
import 'package:server/src/dtos/user.dart';
import 'package:server/src/entities/user.dart';
import 'package:server/src/services/user.dart';
import 'package:server/src/utils/log_util.dart';

sealed class IUserController {
  /// Tham số
  /// [request] = [UserEntity]
  /// ```
  /// {
  ///   'email': String
  ///   'name': String
  ///   'avatart' String
  /// }
  /// ```
  Response login(Map<String, Object?> request);
}

class UserControllerImpl extends IUserController {
  final _usersService = UserServiceImpl();

  @override
  Response login(Map<String, Object?> request) {
    try {
      try {
        final user = UserDTO.fromJson(request).toEntity();
        _usersService.login(user);
        return Success200({});
      } catch (e) {
        return BadRequest400();
      }
    } catch (e, s) {
      logError(e.toString(), stackTrace: s);
      return InternalServerError500();
    }
  }
}