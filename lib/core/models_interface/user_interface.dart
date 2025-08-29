import 'package:kikitalk/core/models_interface/app_interface.dart';

abstract class IUser extends AppInterFace {
  final String name;
  final String email;
  final String? avatar;

  IUser({
    required this.name,
    required this.email,
    this.avatar,
  });
}
