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
