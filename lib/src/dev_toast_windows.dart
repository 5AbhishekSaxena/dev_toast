import 'package:dev_toast_platform_interface/dev_toast_platform_interface.dart';
import 'package:dev_toast_platform_interface/model/toast_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import '../dev_toast.dart';

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
