import 'dart:async';

import 'package:flutter/services.dart';

class BouncingCharacter {
  static const MethodChannel _channel =
      const MethodChannel('bouncing_character');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
