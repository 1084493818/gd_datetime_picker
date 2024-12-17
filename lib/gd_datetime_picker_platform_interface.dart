import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gd_datetime_picker_method_channel.dart';

abstract class GdDatetimePickerPlatform extends PlatformInterface {
  /// Constructs a GdDatetimePickerPlatform.
  GdDatetimePickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static GdDatetimePickerPlatform _instance = MethodChannelGdDatetimePicker();

  /// The default instance of [GdDatetimePickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelGdDatetimePicker].
  static GdDatetimePickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GdDatetimePickerPlatform] when
  /// they register themselves.
  static set instance(GdDatetimePickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
