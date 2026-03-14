import 'package:flutter_test/flutter_test.dart';
import 'package:dev_toast/dev_toast.dart';
import 'package:dev_toast/dev_toast_platform_interface.dart';
import 'package:dev_toast/dev_toast_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDevToastPlatform
    with MockPlatformInterfaceMixin
    implements DevToastPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DevToastPlatform initialPlatform = DevToastPlatform.instance;

  test('$MethodChannelDevToast is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDevToast>());
  });

  test('getPlatformVersion', () async {
    DevToast devToastPlugin = DevToast();
    MockDevToastPlatform fakePlatform = MockDevToastPlatform();
    DevToastPlatform.instance = fakePlatform;

    expect(await devToastPlugin.getPlatformVersion(), '42');
  });
}
