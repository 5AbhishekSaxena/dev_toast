#ifndef FLUTTER_PLUGIN_DEV_TOAST_PLUGIN_H_
#define FLUTTER_PLUGIN_DEV_TOAST_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace dev_toast {

class DevToastPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DevToastPlugin();

  virtual ~DevToastPlugin();

  // Disallow copy and assign.
  DevToastPlugin(const DevToastPlugin&) = delete;
  DevToastPlugin& operator=(const DevToastPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace dev_toast

#endif  // FLUTTER_PLUGIN_DEV_TOAST_PLUGIN_H_
