import 'package:dev_toast/model/toast_options.dart';

import 'dev_toast_platform_interface.dart';

class DevToast {
  Future<void> show({
    required String message,
    ToastOptions options = const EmptyToastOptions(),
  }) {
    return DevToastPlatform.instance.showToast(message, options);
  }
}
