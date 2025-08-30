
const reset = '\x1B[0m';
const red = '\x1B[31m';
const green = '\x1B[32m';
const yellow = '\x1B[33m';
const blue = '\x1B[34m';

logInfo(Object message) => print("$blueℹ️ INFO: $message$reset");

logSuccess(Object message) => print("$green✅ SUCCESS: $message$reset");

logWarning(Object message) => print("$yellow⚠️ WARNING: $message$reset");

logError(Object message, {StackTrace? stackTrace}) => print("$red❌ ERROR: $message$reset \n${stackTrace?.toString()}");
