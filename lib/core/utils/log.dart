import 'dart:convert';

import 'package:chia_wallet/core/utils/config.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

enum LogLevel { DEBUG, INFO, ERROR }

class Log {
  static Uri? _uri;

  static LogLevel logLevel = LogLevel.values[Config.getInt("log_level") ?? LogLevel.ERROR.index] ;

  static void postLog(String data) {
    try {
      if (_uri == null) {
        var url = Config.getString("log_endpoint") ?? '';
        _uri = Uri.parse(url);
      }
      if (_uri != null) {
        Map<String, dynamic> body = {'data': data};
        http.post(_uri!, body: jsonEncode(body));
      }
    } catch (ex) {}
  }

  static void debug(dynamic data) {
    printConsole(data);
    if (logLevel.index <= LogLevel.DEBUG.index) {
      if (data is Exception) {
        exception(data);
      } else if (data is Error) {
        logError(data);
      } else if (data is String) {
        postLog(data);
      } else {
        postLog(data.toString());
      }
    }
  }

  static void info(dynamic data) {
    printConsole(data);
    if (logLevel.index <= LogLevel.INFO.index) {
      if (data is Exception) {
        exception(data);
      } else if (data is Error) {
        logError(data);
      } else if (data is String) {
        postLog(data);
      } else {
        postLog(data.toString());
      }
    }
  }

  static void error(dynamic data) {
    printConsole(data);
    if (logLevel.index <= LogLevel.ERROR.index) {
      if (data is Exception) {
        exception(data);
      } else if (data is Error) {
        logError(data);
      } else if (data is String) {
        postLog(data);
      } else {
        postLog(data.toString());
      }
    }
  }

  static void exception(Exception exception) {
    printConsole(exception);
    if (logLevel.index <= LogLevel.ERROR.index) {
      postLog(exception.toString());
    }
  }

  static void logError(Error error) {
    printConsole(error);
    if (logLevel.index <= LogLevel.ERROR.index) {
      var log = {"stack_trace": error.stackTrace, "message": error.toString()};
      postLog(log.toString());
    }
  }

  static void printConsole(dynamic data) {
    if (!kReleaseMode) {
      // ignore: avoid_print
      print(data.toString());
    }
  }
}