package com.example.dev_toast

import android.content.Context
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DevToastPlugin */
class DevToastPlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private var context: Context? = null


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "dev_toast")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        Log.d(javaClass.name, "onAttachedToEngine, Plugin attached")
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        if (call.method == "showToast") {
            val message = call.argument<String>("message")

            if (message == null) {
                result.error("INVALID_MESSAGE", "Message cannot be null", null)
                return
            }

            showToast(message)

            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        context = null
    }

    private fun showToast(message: String) {
        if (context == null) return
        Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
    }
}
