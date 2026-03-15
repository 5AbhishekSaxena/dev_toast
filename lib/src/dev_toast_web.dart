// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'dart:js_interop';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'dev_toast_platform_interface.dart';
import 'model/toast_options.dart';

@JS("Toastify")
extension type Toastify._(JSObject _) implements JSObject {
  // The JS library expects an options object: Toastify({ text: "...", ... })
  external factory Toastify(JSObject options);

  // The JS library uses .showToast() to trigger the UI
  external void showToast();
}

/// A web implementation of the DevToastPlatform of the DevToast plugin.
class DevToastWeb extends DevToastPlatform {
  /// Constructs a DevToastWeb
  DevToastWeb();

  static void registerWith(Registrar registrar) {
    DevToastPlatform.instance = DevToastWeb();
  }

  @override
  Future<void> showToast(String message, ToastOptions options) async {
    final webOptions = switch (options) {
      WebToastOptions o => o,
      _ => const WebToastOptions(),
    };

    final toastOptions = {
      "text": message,
      "duration": 3000,
      "close": webOptions.showCloseButton,
      "stopOnFocus": webOptions.stopOnFocs,
    };

    if (webOptions.onClick != null) {
      toastOptions["onClick"] = () => webOptions.onClick!();
    }

    final jsObject = toastOptions.jsify() as JSObject;

    Toastify(jsObject).showToast();
  }
}
