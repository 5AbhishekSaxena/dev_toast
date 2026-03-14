
import 'dev_toast_platform_interface.dart';

class DevToast {
  Future<String?> getPlatformVersion() {
    return DevToastPlatform.instance.getPlatformVersion();
  }
}
