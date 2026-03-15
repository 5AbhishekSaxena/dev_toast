import 'package:dev_toast/dev_toast.dart';
import 'package:dev_toast_platform_interface/dev_toast_method_channel.dart';
import 'package:dev_toast_platform_interface/dev_toast_platform_interface.dart';
import 'package:dev_toast_platform_interface/model/toast_options.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDevToastPlatform
    with MockPlatformInterfaceMixin
    implements DevToastPlatform {
  @override
  Future<void> showToast(String message, ToastOptions options) {
    return Future.value();
  }
}

void main() {
  final DevToastPlatform initialPlatform = DevToastPlatform.instance;

  test('$MethodChannelDevToast is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDevToast>());
  });

  // test('getPlatformVersion', () async {
  //   DevToast devToastPlugin = DevToast();
  //   MockDevToastPlatform fakePlatform = MockDevToastPlatform();
  //   DevToastPlatform.instance = fakePlatform;
  //
  //   expect(await devToastPlugin.getPlatformVersion(), '42');
  // });
}
