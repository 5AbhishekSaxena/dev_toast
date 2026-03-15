import 'package:dev_toast/model/toast_options.dart';

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
