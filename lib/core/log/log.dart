import 'package:flutter/foundation.dart';

const reset = '\x1B[0m';
const red = '\x1B[31m';
const green = '\x1B[32m';
const yellow = '\x1B[33m';
const blue = '\x1B[34m';

logInfo(String message) => _log("$blueℹ️ INFO: $message$reset");

logSuccess(String message) => _log("$green✅ SUCCESS: $message$reset");

logWarning(String message) => _log("$yellow⚠️ WARNING: $message$reset");

logError(String message, {StackTrace? stackTrace}) => _log("$red❌ ERROR: $message$reset \n${stackTrace?.toString()}");

_log(String message) {
  if (kDebugMode) {
    print(message);
  }
}