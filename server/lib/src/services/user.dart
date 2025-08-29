import 'package:server/src/entities/user.dart';
import 'package:server/src/repositories/user.dart';

sealed class IUserService {
  Future<bool> login(UserEntity entity);
}

class UserServiceImpl implements IUserService {
  final _usersRepository = UserRepositoryImpl();

  @override
  Future<bool> login(UserEntity entity) {
    return _usersRepository.login(entity);
  }
}
