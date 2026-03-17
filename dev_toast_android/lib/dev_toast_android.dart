import 'package:dev_toast_platform_interface/dev_toast_platform_interface.dart';
import 'package:dev_toast_platform_interface/model/toast_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// An implementation of [DevToastPlatform] that uses method channels.
class DevToastAndroid extends DevToastPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final MethodChannel methodChannel = const MethodChannel("dev_toast");

  static void registerWith() {
    DevToastPlatform.instance = DevToastAndroid();
  }

  @override
  Future<void> showToast(String message, ToastOptions options) async {
    await methodChannel.invokeMethod<void>('showToast', {"message": message});
  }
}
