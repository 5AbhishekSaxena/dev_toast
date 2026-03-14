#include "include/dev_toast/dev_toast_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "dev_toast_plugin.h"

void DevToastPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  dev_toast::DevToastPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
