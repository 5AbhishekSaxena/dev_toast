import 'package:flutter/foundation.dart';

sealed class ToastOptions {
  const ToastOptions();
}

final class EmptyToastOptions implements ToastOptions {
  const EmptyToastOptions();
}

final class WebToastOptions implements ToastOptions {
  final bool showCloseButton;
  final bool stopOnFocs;
  final void Function()? onClick;

  const WebToastOptions({
    this.showCloseButton = false,
    this.stopOnFocs = true,
    this.onClick,
  });
}

final class PlatformToastOptions implements ToastOptions {
  final WebToastOptions? web;

  const PlatformToastOptions({this.web});

  factory PlatformToastOptions.from(ToastOptions? options) {
    final defaultOption = const PlatformToastOptions();

    return switch (options) {
      null => defaultOption,
      PlatformToastOptions it => it,
      EmptyToastOptions _ => defaultOption,
      WebToastOptions webOptions => PlatformToastOptions(web: webOptions),
    };
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
