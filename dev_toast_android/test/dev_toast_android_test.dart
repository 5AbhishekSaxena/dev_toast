
import 'package:dev_toast_android/dev_toast_android.dart';
import 'package:dev_toast_platform_interface/dev_toast_platform_interface.dart';
import 'package:dev_toast_platform_interface/model/toast_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDevToastAndroidPlatform
    with MockPlatformInterfaceMixin
    implements DevToastPlatform {
  // @override
  // Future<String?> getPlatformVersion() => Future.value('42');
  @override
  Future<void> showToast(String message, ToastOptions options) {
    throw UnimplementedError();
  }
}

void main() {
  final DevToastPlatform initialPlatform = DevToastPlatform.instance;

  test('$DevToastAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<DevToastAndroid>());
  });

  test('getPlatformVersion', () async {
    DevToastAndroid devToastAndroidPlugin = DevToastAndroid();
    MockDevToastAndroidPlatform fakePlatform = MockDevToastAndroidPlatform();
    DevToastPlatform.instance = fakePlatform;

    // expect(await devToastAndroidPlugin.getPlatformVersion(), '42');
  });
}
