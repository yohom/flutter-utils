import 'dart:async';

import 'package:flutter/services.dart';

class FlutterUtils {
  static const MethodChannel _channel = const MethodChannel('flutter_utils');

  static Future<String> get androidId async {
    return await _channel.invokeMethod('getAndroidId');
  }

  static Future<String> get appVersionName async {
    return await _channel.invokeMethod('getAppVersionName');
  }

  static Future<String> get appVersionCode async {
    return await _channel.invokeMethod('getAppVersionCode');
  }

  static Future<bool> get isAppDebug async {
    return await _channel.invokeMethod('isAppDebug');
  }
}
