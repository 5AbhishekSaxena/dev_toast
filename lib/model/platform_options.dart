import 'package:dev_toast/model/toast_options.dart';
import 'package:dev_toast/model/web_toast_options.dart';
import 'package:flutter/foundation.dart';

import 'empty_toast_options.dart';

final class PlatformToastOptions implements ToastOptions {
  final WebToastOptions? web;

  const PlatformToastOptions({this.web});

  ToastOptions getPlatformOptions() {
    final defaultOptions = const EmptyToastOptions();

    if (kIsWeb && web != null) {
      return web!;
    }

    return defaultOptions;
  }
}
