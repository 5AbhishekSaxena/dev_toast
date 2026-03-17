# dev_toast

A federated plugin project to explore and understand nuances of building plugins in flutter.

The project targets to implement plugin with different behaviors for different platforms.
- **Android** - Use the Android's native `Toast` API.
- **Web** - Uses 'Toastify' package via JS interop.
- **Windows** - Currently logs to the console; `Overlay` API implementation is planned.

## Features
- **Type-safe Options**: Handy APIs to provide platform-specific `ToastOptions`.
- **Platform-Specific Access**: Use `DevToast.web` for direct platform-specific features.
- **Global Configuration**: Initialize once and use everywhere.

> [!TIP]
> This plugin is demonstrated across different architectural patterns. To compare this federated approach with a single-package implementation, please refer to the [single_package_plugin](https://github.com/5AbhishekSaxena/dev_toast/tree/single_package_plugin) branch.

## Platform Support

| Android | Web | Windows |
|:---:|:---:|:---:|
| ✅ (Native API) | ✅ (Toastify) | 🚧 (Console Log) |


### Usage

### Simple call
```dart
DevToast.show(message: "Hello World");
```

### Platform-Specific Options
```dart
DevToast.show(message: "Hello World", options: PlatformToastOptions(..));

DevToast.show(message: "Hello World", options: WebToastOptions(.));

DevToast.web.show(message: "Hello World", options: WebToastOptions(..));
```

### Global Configuration

> **_NOTE:_**
> Configurations are platform-safe; the plugin will gracefully ignore platform-specific settings that don't match the current environment (e.g., passing WebToastOptions while running on Android).

You can set up default behavior during app startup:
```dart
DevToast.initialize(config: DevToastConfig(options: PlatformToastOptions(..));
```
