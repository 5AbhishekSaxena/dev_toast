import 'package:dev_toast/model/platform_options.dart';
import 'package:dev_toast/model/toast_options.dart';

import 'dev_toast_platform_interface.dart';
import 'model/web_toast_options.dart';

class DevToast {
  static Future<void> show({
    required String message,
    ToastOptions options = const PlatformToastOptions(),
  }) {
    return DevToastPlatform.instance.showToast(
      message,
      options is PlatformToastOptions ? options.getPlatformOptions() : options,
    );
  }

  static final web = _WebToastApi();
}

class _WebToastApi {
  Future<void> show({
    required String message,
    required WebToastOptions options,
  }) async {
    return DevToastPlatform.instance.showToast(message, options);
  }
}
