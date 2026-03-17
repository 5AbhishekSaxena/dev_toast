import 'package:dev_toast_platform_interface/dev_toast_platform_interface.dart';
import 'package:dev_toast_platform_interface/model/toast_options.dart';

import '../dev_toast.dart';

class DevToast {
  static DevToastConfig _config = const DevToastConfig();

  static final web = _WebToastApi();

  static void initialize({DevToastConfig config = const DevToastConfig()}) {
    _config = config;
  }

  static Future<void> show({required String message, ToastOptions? options}) {
    final PlatformToastOptions resolvedOptions = _config.options.merge(
      PlatformToastOptions.from(options),
    );

    return DevToastPlatform.instance.showToast(
      message,
      resolvedOptions.resolve(),
    );
  }
}

class _WebToastApi {
  Future<void> show({
    required String message,
    required WebToastOptions options,
  }) async {
    return DevToastPlatform.instance.showToast(message, options);
  }
}
