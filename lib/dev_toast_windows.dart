import 'package:dev_toast/dev_toast_platform_interface.dart';
import 'package:dev_toast/model/toast_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class DevToastWindows extends DevToastPlatform {
  DevToastWindows();

  static void registerWith(Registrar registrar) {
    DevToastPlatform.instance = DevToastWindows();
  }

  @override
  Future<void> showToast(String message, ToastOptions options) async {
    debugPrint("Windows toast: $message");
  }
}
