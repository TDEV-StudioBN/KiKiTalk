import 'package:uuid/uuid.dart';

abstract class IDUtil {
  static String randomV4() {
    return const Uuid().v4();
  }
}