import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gd_datetime_picker/gd_datetime_picker_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelGdDatetimePicker platform = MethodChannelGdDatetimePicker();
  const MethodChannel channel = MethodChannel('gd_datetime_picker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
