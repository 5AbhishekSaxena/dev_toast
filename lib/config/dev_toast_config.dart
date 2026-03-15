import 'package:dev_toast/dev_toast.dart';
import 'package:dev_toast/model/platform_options.dart';

class DevToastConfig {
  final PlatformToastOptions options;

  const DevToastConfig({this.options = const PlatformToastOptions()});
}
