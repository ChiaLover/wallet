import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:chia_wallet/core/utils/log.dart';

// import 'package:firebase_remote_config/firebase_remote_config.dart' as frc;

enum Mode { Debug, Production }

class Config {
  static Map<String, dynamic> _debug = {
    'test_key': 'test_value',
    "api_host": "",
    'web_host': '',
    "min_version": 2,
    "latest_version": 2,
    "ios_min_version": "2.0.0",
    "android_min_version": 1,
    "log_level": LogLevel.INFO.index,
  };
  static Map<String, dynamic> _production = {
    'key': 'value',
    "api_host": "",
    'web_host': '',
    "min_version": 2,
    "latest_version": 2,
    "ios_min_version": "2.0.0",
    "android_min_version": 1,
    "log_level": LogLevel.INFO.index,
  };

  static RemoteConfig? _config;

  static void init(Mode mode) {
    if (Mode.Debug == mode) {
      _config = RemoteConfig(_debug);
    } else {
      _config = RemoteConfig(_production);
    }
  }

  static int? getInt(String key) {
    return _config?.getInt(key);
  }

  static String? getString(String key) {
    return _config?.getString(key);
  }

  static double? getDouble(String key) {
    return _config?.getDouble(key);
  }

  static bool? getBool(String key) {
    return _config?.getBool(key);
  }

  static int getCurrentVersion() => 1;

  static String get storeCurrentVersion => "3.0.2";

  /*Use to force update, be careful */
  // static int getLatestVersion() => getInt("latest_version");
  //
  // static int getMinVersion() => getInt("min_version");
}

class RemoteConfig {
  Map<String, dynamic> _default;

  RemoteConfig(this._default);

  int? getInt(String key) {
    return _default[key];
  }

  String? getString(String key) {
    return _default[key];
  }

  double? getDouble(String key) {
    return _default[key];
  }

  bool? getBool(String key) {
    return _default[key];
  }

  dynamic get(String key) {
    return _default[key];
  }

  Map<String, dynamic> getAll() {
    return _default;
  }
}

// class FireBaseRemoteConfig extends RemoteConfig {
//   frc.RemoteConfig _conf;

//   FireBaseRemoteConfig(Map<String, dynamic> defaultValue)
//       : super(defaultValue) {
//     _init();
//   }

//   void _init() async {
//     try {
//       _conf = await frc.RemoteConfig.instance;
//       _conf.setDefaults(_default ?? <String, dynamic>{});
//       _conf.fetch(expiration: Duration(hours: 1));
//       await _conf.activateFetched();
//       _conf.addListener(() {
//         getAll().forEach((key, value) {
//           Log.error("Key: " + key + " Value: " + value.toString());
//         });
//       });
//     } catch (e) {
//       Log.error('Fail to fetch config from firebase: $e');
//     }
//   }

//   @override
//   int getInt(String key) {
//     return _conf == null ? _default[key] : _conf.getInt(key);
//   }

//   @override
//   String getString(String key) {
//     return _conf == null ? _default[key] : _conf.getString(key);
//   }

//   @override
//   double getDouble(String key) {
//     return _conf == null ? _default[key] : _conf.getDouble(key);
//   }

//   @override
//   bool getBool(String key) {
//     return _conf == null ? _default[key] : _conf.getBool(key);
//   }

//   @override
//   dynamic get(String key) {
//     return _conf == null ? _default[key] : _conf.getValue(key);
//   }

//   @override
//   Map<String, dynamic> getAll() {
//     return _conf == null ? _default : _conf.getAll();
//   }
// }
