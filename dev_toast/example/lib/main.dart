import 'package:dev_toast/dev_toast.dart';
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
  void onShowToastPressed() {
    final options = WebToastOptions(
      showCloseButton: true,
      stopOnFocs: true,
      onClick: () => print("toast clicked"),
    );

    // Cross-platform public API, automatically ignores options for other platforms
    DevToast.show(message: "Do something!", options: options);

    // Cross-platform public APIw with PlatformOptions
    DevToast.show(
      message: "Do something!",
      options: PlatformToastOptions(web: options),
    );

    // using Platform specific API
    // DevToast.web.show(message: "Do something!", options: options);
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
