import 'package:dev_toast/model/toast_options.dart';
import 'package:dev_toast/model/web_toast_options.dart';
import 'package:flutter/foundation.dart';

import 'empty_toast_options.dart';

final class PlatformToastOptions implements ToastOptions {
  final WebToastOptions? web;

  const PlatformToastOptions({this.web});

  factory PlatformToastOptions.from(ToastOptions? options) {
    if (options is PlatformToastOptions) {
      return options;
    }

    if (options is WebToastOptions) {
      return PlatformToastOptions(web: options);
    }

    return const PlatformToastOptions();
  }

  ToastOptions resolve() {
    final defaultOptions = const EmptyToastOptions();

    if (kIsWeb && web != null) {
      return web!;
    }

    return defaultOptions;
  }

  PlatformToastOptions merge(PlatformToastOptions? override) {
    if (override == null) return this;

    return PlatformToastOptions(web: override.web ?? web);
  }
}
