import 'package:flutter/foundation.dart';

const reset = '\x1B[0m';
const red = '\x1B[31m';
const green = '\x1B[32m';
const yellow = '\x1B[33m';
const blue = '\x1B[34m';

logInfo(Object message) => _log("$blueℹ️ INFO: $message$reset");

logSuccess(Object message) => _log("$green✅ SUCCESS: $message$reset");

logWarning(Object message) => _log("$yellow⚠️ WARNING: $message$reset");

logError(Object message, {StackTrace? stackTrace}) => _log("$red❌ ERROR: $message$reset \n${stackTrace?.toString()}");

_log(Object message) {
  if (kDebugMode) {
    print(message);
  }
}