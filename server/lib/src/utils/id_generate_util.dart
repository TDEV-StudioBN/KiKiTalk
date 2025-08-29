import 'package:uuid/uuid.dart';

class IDUtil {
  static String randomV4() {
    return const Uuid().v4();
  }
}