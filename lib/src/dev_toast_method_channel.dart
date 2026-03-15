import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'dev_toast_platform_interface.dart';
import 'model/toast_options.dart';

/// An implementation of [DevToastPlatform] that uses method channels.
class MethodChannelDevToast extends DevToastPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('dev_toast');

  @override
  Future<void> showToast(String message, ToastOptions options) async {
    await methodChannel.invokeMethod<void>('showToast', {"message": message});
  }
}
