import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gd_datetime_picker_platform_interface.dart';

/// An implementation of [GdDatetimePickerPlatform] that uses method channels.
class MethodChannelGdDatetimePicker extends GdDatetimePickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gd_datetime_picker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
