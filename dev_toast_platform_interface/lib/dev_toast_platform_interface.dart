import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'dev_toast_method_channel.dart';
import 'model/toast_options.dart';

abstract class DevToastPlatform extends PlatformInterface {
  /// Constructs a DevToastPlatform.
  DevToastPlatform() : super(token: _token);

  static final Object _token = Object();

  static DevToastPlatform _instance = MethodChannelDevToast();

  /// The default instance of [DevToastPlatform] to use.
  ///
  /// Defaults to [MethodChannelDevToast].
  static DevToastPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DevToastPlatform] when
  /// they register themselves.
  static set instance(DevToastPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> showToast(String message, ToastOptions options) {
    throw UnimplementedError('showToast() has not been implemented.');
  }
}
