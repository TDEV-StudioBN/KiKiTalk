import 'package:uuid/uuid.dart';

class UTIGenerateId {
  static String randomV4() {
    return const Uuid().v4();
  }
}