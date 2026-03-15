import 'package:dev_toast/dev_toast.dart';
import 'package:dev_toast/model/toast_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _devToastPlugin = DevToast();

  void onShowToastPressed() {
    ToastOptions options = const EmptyToastOptions();

    if (kIsWeb) {
      options = WebToastOptions(
       showCloseButton: true,
       stopOnFocs: true,
       onClick:  () => print("toast clicked")
      );
    }

    _devToastPlugin.show(message: "Do something!", options: options);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: onShowToastPressed,
                child: const Text("Show Text"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
