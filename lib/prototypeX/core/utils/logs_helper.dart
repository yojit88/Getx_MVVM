import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LogsHelper {
  static void debugLog(Object? log, {String? tag}) {
    if (kDebugMode) {
      if (tag?.isNotEmpty ?? false) {
        print("$tag: $log");
        return;
      }
      print(log);
    }
  }
}


var logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);