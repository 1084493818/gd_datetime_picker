import 'package:flutter_test/flutter_test.dart';
import 'package:gd_datetime_picker/gd_datetime_picker.dart';
import 'package:gd_datetime_picker/gd_datetime_picker_platform_interface.dart';
import 'package:gd_datetime_picker/gd_datetime_picker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGdDatetimePickerPlatform
    with MockPlatformInterfaceMixin
    implements GdDatetimePickerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GdDatetimePickerPlatform initialPlatform = GdDatetimePickerPlatform.instance;

  test('$MethodChannelGdDatetimePicker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGdDatetimePicker>());
  });

  test('getPlatformVersion', () async {
    GdDatetimePicker gdDatetimePickerPlugin = GdDatetimePicker();
    MockGdDatetimePickerPlatform fakePlatform = MockGdDatetimePickerPlatform();
    GdDatetimePickerPlatform.instance = fakePlatform;

    expect(await gdDatetimePickerPlugin.getPlatformVersion(), '42');
  });
}
